#include <Arduino.h>
#include <Wire.h>
#include <LiquidCrystal_PCF8574.h>
#include <max6675.h>
 
int SO = 12;
int CS = 10;
int sck = 13;

MAX6675 ts(sck, CS, SO);
LiquidCrystal_PCF8574 lcd(0x27);

const int TAPER_MODE_OFF = 0;
const int TAPER_MODE_5M = 1;
const int TAPER_MODE_10M = 2;
const int TAPER_MODE_15M = 3;

const int START_BUTTON_PIN = 3;
const int RESET_BUTTON_PIN = 4;
const int STOP_BUTTON_PIN = 5;
const int TAPER_BUTTON_PIN = 6;

const int MAX_TIME_POT_PIN = A0;
const int MAX_TEMP_POT_PIN = A1;
const int OP_RANGE_POT_PIN = A2;

const int LCD_I2C_PIN = 0;
const int HEATER_RELAY_PIN = 8;

int loopDelay = 250;

bool stopped = true;
bool timeExpired = false;
bool startButtonPressed = false;
bool stopButtonPressed = false;

bool heatExceeded = false;

int maxTimeCap = 180;
unsigned long exitTime = (maxTimeCap) * 30;

int maxTemp = 0;
unsigned long maxTime = 0;

int temp = 0;
long startTime = millis();
long time = 0;

bool heaterTurnOff = false;
bool heaterCurrentlyOff = false;
int tempThreshold = 0;

char line1[21] = "";
char line2[21] = "";
char line3[21] = "";
char line4[21] = "";

const float BETA = 3950; // should match the Beta Coefficient of the thermistor

int taperMode = TAPER_MODE_OFF;
char taperModeString[3] = "";

void start() {
    reset();
    startButtonPressed = true;
    stopButtonPressed = false;
    stopped = false;
}

void reset() {
    startTime = millis();
}

void stop() {
    startButtonPressed = false;
    stopButtonPressed = true;
    stopped = true;
    heaterTurnOff = true;
}

void cycleTaperMode() {
    taperMode += 1;
    if (taperMode > TAPER_MODE_15M) {
        taperMode = TAPER_MODE_OFF;
    }
}

void setup() {
  // put your setup code here, to run once:
  pinMode(HEATER_RELAY_PIN, OUTPUT);

  pinMode(START_BUTTON_PIN, INPUT_PULLUP);
  pinMode(RESET_BUTTON_PIN, INPUT_PULLUP);
  pinMode(STOP_BUTTON_PIN, INPUT_PULLUP);
  pinMode(TAPER_BUTTON_PIN, INPUT_PULLUP);

  pinMode(MAX_TIME_POT_PIN, INPUT);
  pinMode(MAX_TEMP_POT_PIN, INPUT);
  pinMode(OP_RANGE_POT_PIN, INPUT);
  
  lcd.begin(20, 4);
  lcd.setBacklight(255);

  stop();
}

void loop() {
  // put your main code here, to run repeatedly:
  maxTime = map(analogRead(MAX_TIME_POT_PIN), 0, 1023, 1, maxTimeCap) * 30 * 1000;
  maxTemp = map(analogRead(MAX_TEMP_POT_PIN), 0, 1023, 20, 250);
  tempThreshold = map(analogRead(OP_RANGE_POT_PIN), 0, 1023, 10, 100);
  
  byte startButtonState = digitalRead(START_BUTTON_PIN);
  if (startButtonState == LOW) {
      start();
  }

  byte resetButtonState = digitalRead(RESET_BUTTON_PIN);
  if (resetButtonState == LOW) {
      reset();
  }

  byte stopButtonState = digitalRead(STOP_BUTTON_PIN);
  if (stopButtonState == LOW) {
      stop();
  }

  byte taperButtonState = digitalRead(TAPER_BUTTON_PIN);
  if (taperButtonState == LOW) {
      cycleTaperMode();
  }

  time = millis() - startTime;
  timeExpired = false;

  int temp = ts.readCelsius();

  // turn heater off if time is up
  if (time > maxTime) {
      heaterTurnOff = true;
      timeExpired = true;
  } else {
      // turn heater on if its already off and and the temp is less than the heat threshold
      if (heaterCurrentlyOff && temp < (maxTemp - tempThreshold)) {
          heaterTurnOff = false;
      }
  }

  // turn heater off if the temperature is greater than the cutoff
  if (temp > maxTemp) {
      heaterTurnOff = true;
      heatExceeded = true;
  }

  if (stopped) {
      heaterTurnOff = true;
  }

  // switch the heater state if it has changed
  if (heaterTurnOff != heaterCurrentlyOff) {
      if (heaterTurnOff) {
          // send off signal to relay
          digitalWrite(HEATER_RELAY_PIN, LOW);
      } else {
          // send on signal to relay
          digitalWrite(HEATER_RELAY_PIN, HIGH);
      }
  }

  heaterCurrentlyOff = heaterTurnOff;

  int maxTimeMin = floor((maxTime/1000/60) << 0);
  int maxTimeSec = floor((maxTime/1000) % 60);

  int min = floor((time/1000/60) << 0);
  int sec = floor((time/1000) % 60);

  lcd.setCursor(0, 0);
  //sprintf(line1, "%02dm%02ds %03dc %03dc %s", maxTimeMin, maxTimeSec, maxTemp, tempThreshold, taperModeString);
  sprintf(
    line1,
    "%02dm%02ds %03dc %03dc %s",
    maxTimeMin,
    maxTimeSec,
    maxTemp,
    tempThreshold,
    (taperMode < 1
      ? "OFF"
      : (taperMode < 2
          ? " 5M"
          : (taperMode < 3
              ? "10M"
              : (taperMode < 4
                  ? "15M"
                  : "   "
                )
            )
          )
        )
      );
  lcd.print(line1);

  lcd.setCursor(0, 1);
  if (timeExpired || stopped) {
      // quit the program as we are out of time but wait a bit for safety
      if (time / 1000 > exitTime && heaterCurrentlyOff) {
          exit(0);
      }

      // display the max time when the time has expired instead of normal
      sprintf(line2, "%02dm%02ds %03dc        %s", stopped ? 0 : maxTimeMin, stopped ? 0 : maxTimeSec, temp, (startButtonPressed ? "X" : " "));
  } else {
      sprintf(line2, "%02dm%02ds %03dc        %s", min, sec, temp, (startButtonPressed ? "X" : " "));
  }
  lcd.print(line2);

  lcd.setCursor(0, 2);
  sprintf(line3, "%s       %s", (timeExpired ? "Time expired" : "            "), (resetButtonState == LOW ? "X" : " "));
  lcd.print(line3);

  lcd.setCursor(0, 3);
  sprintf(line4, "Heater: %s        %s", (heaterCurrentlyOff ? "OFF" : "ON "), stopped ? "X" : " ");
  lcd.print(line4);

  // quit the program as we are out of time but wait a bit for safety
  if (timeExpired) {
      // divide the time 
      if (time / 1000 > exitTime && heaterCurrentlyOff) {
          exit(0);
      }
  }

  delay(loopDelay);
}
