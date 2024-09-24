width = 12;
height = 10;
margin = 1;
sideHeight = 80;

difference() {
    union() {
        cube([height, width, 76]);
            
        translate([(height / 2) + 1,(width / 2) - 1,2]) {
            cube([6, 2, 68]);
        }
    }
    
    translate([-1,0-margin,10]) {
        cube([height - 1, 15, 60]);
    }
    
    translate([-1,1,-1]) {
        cube([height - 1, width - margin -1, 60]);
    }
    
    
    translate([1,0-margin,72]) {
        cube([height, width + (margin * 2), 10]);
    }
    
    
    translate([-1,-1,12]) {
        cube([height + 2, margin + 1, sideHeight]);
    }
    
    translate([-1,width - margin,12]) {
        cube([height + 2, margin + 1, sideHeight]);
    }
    
    translate([-1,0, sideHeight-8]) {
        cube([height + 2, margin + 1, 10]);
    }
    
    translate([-1,width - margin * 2, sideHeight-8]) {
        cube([height + 2, margin + 1, 10]);
    }
    
    translate([3,6,4]) {
        rotate([90,90,0]) {
            cylinder(r = 2, h = 14, center = true, $fn = 300);
        }
    }
}
   
        translate([(height / 2) + 1,(width / 2) - 1,10]) {
           cube([2, 2, 60]);
        }
