difference() {
    union() {
        cube([98,8,2]);
        translate([0,0,-2]) {
            cube([6,8,2]);
        }
        
        translate([10,3,2]) {
            cube([80,2,2]);
        }
        
        translate([70,3,-2]) {
            cube([20,2,2]);
        }
    }
    translate([3,4,2]) {
        cylinder(r = 2, h = 10, center = true, $fn = 60);
    }
    
        translate([92,-2,-1]) {
            cube([7,3,5]);
        }
    
        translate([92,7,-1]) {
            cube([7,3,5]);
        }
}
