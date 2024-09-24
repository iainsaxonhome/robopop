difference() {
    // main box
    translate([0,0,0]) {
        cube([104,64,94]);
    }
    
    // cut-outs
    translate([2,2,2]) {
        // main box
        cube([100,64,90]);
        
        // screen
        translate([1,-4,19.5]) {
            cube([98,64,41]);
        }
    }
    

    translate([10,0,80]) {
        // pot
        translate([10,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 3.5, h = 10, center = true, $fn = 60);
            }
        }
        
        // pot
        translate([32,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 3.5, h = 10, center = true, $fn = 60);
            }
        }
        
        // pot
        translate([54,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 3.5, h = 10, center = true, $fn = 60);
            }
        }
        
        // button
        translate([78,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 6, h = 10, center = true, $fn = 60);
            }
        }
    }
    
    
    
    // side buttons
    translate([100,25,28]) {
        translate([0,0,0]) {
            rotate([90,0,90]) {
                cylinder(r = 6, h = 10, center = true, $fn = 60);
            }
        }
        translate([0,0,14]) {
            rotate([90,0,90]) {
                cylinder(r = 6, h = 10, center = true, $fn = 60);
            }
        }
        translate([0,0,28]) {
            rotate([90,0,90]) {
                cylinder(r = 6, h = 10, center = true, $fn = 60);
            }
        }
    }
    

    // usb
    translate([-2,16,42]) {
        rotate([90,0,90]) {
            cube([12,10,12]);
        }
    }
    
    // power
    translate([-2,16,12]) {
        rotate([90,0,90]) {
            cube([12,12,12]);
        }
    }
    
    
    // back
    translate([50,460,50]) {
        rotate([0,0,0]) {
            cylinder(r = 399, h = 200, center = true, $fn = 300);
        }
    }
}

/*
difference() {
    // mounts
    union() {

        // uno mount
        translate([15,8,5]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 12, center = true);
            }
        }

        // uno mount
        translate([65,8,8]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 12, center = true);
            }
        }
        
        // uno mount fill
        translate([13,2,2]) {
            rotate([0,0,0]) {
                cube([4,12,2]);
            }
        }

        // screen bottom left
        translate([4,5,12+3]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 6, center = true);
            }
        }

        // screen bottom right
        translate([100,5,12+3]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 6, center = true);
            }
        }

        // screen top right
        translate([100,5,(12+3+60)-5]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 6, center = true);
            }
        }

        // screen top left
        translate([4,5,(12+3+60)-5]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 6, center = true);
            }
        }


        // top row buttons left
        translate([5,6,80]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 8, center = true);
            }
        }
        
        // top button right mount fill
        translate([101,2,78]) {
            rotate([0,0,0]) {
                cube([2,8,4]);
            }
        }

        // top row buttons right
        translate([99,6,80]) {
            rotate([90,0,0]) {
                cylinder(r = 3, h = 8, center = true);
            }
        }
        
        // top button left mount fill
        translate([1,2,78]) {
            rotate([0,0,0]) {
                cube([2,8,4]);
            }
        }

        // side buttons top
        translate([100,25,70]) {
            rotate([90,0,90]) {
                cylinder(r = 3, h = 8, center = true);
            }
        }
        
        // side buttons bottom
        translate([100,25,14]) {
            rotate([90,0,90]) {
                cylinder(r = 3, h = 8, center = true);
            }
        }

        // temp board
        translate([70,35,2+2]) {
            rotate([0,0,0]) {
                cylinder(r = 3, h = 4, center = true);
            }
        }

        // relay front
        translate([90,25,90]) {
            rotate([0,0,0]) {
                cylinder(r = 3, h = 4, center = true);
            }
        }

        // relay back
        translate([62,45,90]) {
            rotate([0,0,0]) {
                cylinder(r = 3, h = 4, center = true);
            }
        }

        // bottom front support
        translate([2,2,2]) {
            rotate([0,0,0]) {
                cube([102,2,4]);
            }
        }

        // top front support
        translate([2,2,91]) {
            rotate([0,0,0]) {
                cube([102,1,1]);
            }
        }

        // lcd top support
        translate([2,2,63]) {
            rotate([0,0,0]) {
                cube([102,4,6]);
            }
        }

        // lcd bottom support
        translate([2,2,15]) {
            rotate([0,0,0]) {
                cube([102,4,6]);
            }
        }

        // left front support
        translate([1.5,2,2]) {
            rotate([0,0,0]) {
                cube([1,4,90]);
            }
        }

        // right front support
        translate([101.5,2,2]) {
            rotate([0,0,0]) {
                cube([1,4,90]);
            }
        }

        // right rear support
        translate([100,56,8]) {
            rotate([0,0,0]) {
                cube([2,8,80]);
            }
        }

        // left rear support
        translate([2,56,8]) {
            rotate([0,0,0]) {
                cube([2,8,80]);
            }
        }

        // bottom rear support
        translate([8,56,2]) {
            rotate([0,0,0]) {
                cube([90,8,2]);
            }
        }

        // top rear support
        translate([8,56,90]) {
            rotate([0,0,0]) {
                cube([90,8,2]);
            }
        }

        // rear bottom left mount
        translate([2,54,2]) {
            rotate([0,0,0]) {
                cube([8,10,8]);
            }
        }

        // rear bottom right mount
        translate([94,54,2]) {
            rotate([0,0,0]) {
                cube([8,10,8]);
            }
        }

        // rear top left mount
        translate([94,54,84]) {
            rotate([0,0,0]) {
                cube([8,10,8]);
            }
        }

        // rear top right mount
        translate([2,54,84]) {
            rotate([0,0,0]) {
                cube([8,10,8]);
            }
        }

        // top left depth support
        translate([2,2,91]) {
            rotate([0,0,0]) {
                cube([4,60,1]);
            }
        }

        // top right depth support
        translate([98,2,91]) {
            rotate([0,0,0]) {
                cube([4,60,1]);
            }
        }

        // bottom right depth support
        translate([98,2,2]) {
            rotate([0,0,0]) {
                cube([4,60,1]);
            }
        }

        // bottom left depth support
        translate([2,2,2]) {
            rotate([0,0,0]) {
                cube([4,60,1]);
            }
        }
        
        // lcd top right fill
        translate([101,2,68]) {
            rotate([0,0,0]) {
                cube([2,6,4]);
            }
        }
        
        // lcd top left fill
        translate([1,2,68]) {
            rotate([0,0,0]) {
                cube([2,6,4]);
            }
        }
    }
    
    // back
    translate([50,460,50]) {
        rotate([0,0,0]) {
            cylinder(r = 399, h = 200, center = true, $fn = 300);
        }
    }
}
*/