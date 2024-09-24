module mount(height) {
    difference() {
        cylinder(r = 4, h = height, center = true);
        translate([0,0,0]) {
            cylinder(r = 1.25, h = (height + 2), center = true);
        }
    }
    cube([4,4,0.5], center = true);
}

module cableClip() {
   
    rotate([90,90,270]) {
        translate([5.75,2,0]) {
            difference() {
                cylinder(r = 6, h = 4, center = true);
                translate([0,0,0]) {
                    cylinder(r = 4, h = 5, center = true);
                }
                translate([6,0,0]) {
                    cube([15,15,15], center = true);
                }
            }
        
        }
    }
}

difference() {
    // main box
    translate([0,0,0]) {
        union() {
            cube([104,74,106]);
            
            
        }
    }
    
    // cut-outs
    translate([2,2,2]) {
        // main box
        cube([100,74,102]);
        
        // screen
        translate([1,-4,29.5]) {
            cube([98,74,41]);
        }
    }
    
    translate([90,0.25,5]) {
        rotate([90,0,0]) {
            linear_extrude(5) {
                text("robopop", 6, "robopop", halign = "right");
            }
        }
    }
    
    translate([92,0.25,5]) {
        rotate([90,0,0]) {
            linear_extrude(5) {
                text("v0.1", 3, "v0.1", halign = "left");
            }
        }
    }
    

    translate([9,0,91]) {
        // pot
        translate([10,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 3.75, h = 10, center = true, $fn = 60);
            }
            
                    
            translate([0,0.25,-14]) {
                rotate([90,0,0]) {
                    linear_extrude(5) {
                        text("time", 4, "time", halign = "center");
                    }
                }
            }
        }
        
        
        // pot
        translate([32,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 3.75, h = 10, center = true, $fn = 60);
            }
            
            translate([0,0.25,-14]) {
                rotate([90,0,0]) {
                    linear_extrude(5) {
                        text("temp", 4, "temp", halign = "center");
                    }
                }
            }
        }
        
        // pot
        translate([54,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 3.75, h = 10, center = true, $fn = 60);
            }
            
            translate([0,0.25,-14]) {
                rotate([90,0,0]) {
                    linear_extrude(5) {
                        text("range", 4, "range", halign = "center");
                    }
                }
            }
        }
        
        // button
        translate([76,0,0]) {
            rotate([90,0,0]) {
                cylinder(r = 6.25, h = 10, center = true, $fn = 60);
            }
            
            translate([0,0.25,-14]) {
                rotate([90,0,0]) {
                    linear_extrude(5) {
                        text("mode", 4, "mode", halign = "center");
                    }
                }
            }
        }
        
    }
    
    
    
    // side buttons
    translate([100,25,36]) {
        translate([0,0,0]) {
            rotate([90,0,90]) {
                cylinder(r = 6.25, h = 10, center = true, $fn = 60);
                
                translate([-15,0,3.25]) {
                    rotate([0,0,0]) {
                        linear_extrude(5) {
                            text("stop", 4, "stop", halign = "center", valign="center");
                        }
                    }
                }
            }
        }
        translate([0,0,16]) {
            rotate([90,0,90]) {
                cylinder(r = 6.25, h = 10, center = true, $fn = 60);
                translate([-15,0,3.25]) {
                    rotate([0,0,0]) {
                        linear_extrude(5) {
                            text("reset", 4, "reset", halign = "center", valign="center");
                        }
                    }
                }
            }
        }
        translate([0,0,32]) {
            rotate([90,0,90]) {
                cylinder(r = 6.25, h = 10, center = true, $fn = 60);
                translate([-15,0,3.25]) {
                    rotate([0,0,0]) {
                        linear_extrude(5) {
                            text("start", 4, "start", halign = "center", valign="center");
                        }
                    }
                }
            }
        }
    }
    

    // power
    translate([-2,16,43]) {
        rotate([90,0,90]) {
            cube([12,11,12]);
        }
    }
    
    // usb
    translate([-2,16,12.5]) {
        rotate([90,0,90]) {
            cube([12,13,12]);
        }
    }
    
    // back
    intersection() {
        // back
        translate([52,359,60]) {
            rotate([0,0,0]) {
                cylinder(r = 300, h = 200, center = true, $fn = 300);
            }
        }
        
        // back
        translate([52,140,60]) {
            rotate([0,0,0]) {
                cylinder(r = 90, h = 200, center = true, $fn = 300);
            }
        }
    }
}


difference() {
    // mounts
    union() {

        // uno mount
        translate([18,8,6]) {
            rotate([90,0,180]) {
                mount(12);
            }
        }

        // uno mount
        translate([65,8,14]) {
            rotate([90,0,180]) {
                mount(12);
            }
        }
        
        // uno mount fill
        translate([16,2,2]) {
            rotate([0,0,0]) {
                cube([4,12,2]);
            }
        }

        // screen bottom left
        translate([5,5,22+3]) {
            rotate([90,0,180]) {
                mount(6);
            }
        }

        // screen bottom right
        translate([99,5,22+3]) {
            rotate([90,0,180]) {
                mount(6);
            }
        }

        // screen top right
        translate([99,5,(22+3+60)-5]) {
            rotate([90,0,180]) {
                mount(6);
            }
        }

        // screen top left
        translate([5,5,(22+3+60)-5]) {
            rotate([90,0,180]) {
                mount(6);
            }
        }


        // top row buttons left
        translate([5,6,91]) {
            rotate([90,0,180]) {
                mount(10);
            }
        }
        
        // top button right mount fill
        translate([101,2,89]) {
            rotate([0,0,0]) {
                cube([2,8,4]);
            }
        }

        // top row buttons right
        //translate([99,6,90]) {
        //    rotate([90,0,180]) {
        //        mount(9);
        //    }
        //}
        
        // top row buttons right
        translate([102,7,85.5]) {
            rotate([90,00,180]) {
                difference() {
                    cube([4,11,8]);
                    translate([1,1,4]) {
                        cube([7,9,3]);
                    }
                }
            }
        }
        
        // top button left mount fill
        translate([1,2,89]) {
            rotate([0,0,0]) {
                cube([2,9,4]);
            }
        }

        // side buttons top
        //translate([100,25,88]) {
        //    rotate([90,0,270]) {
        //        mount(9);
        //    }
        //}
        
        // side buttons top
        translate([102,31,90.5]) {
            rotate([270,90,90]) {
                difference() {
                    cube([7,12,5]);
                    translate([3,1,1]) {
                        cube([7,10,3]);
                    }
                }
            }
        }
        
        // side buttons bottom
        //translate([100,25,16]) {
        //    rotate([90,0,270]) {
        //        mount(9);
        //    }
        //}
        
        // side buttons bottom
        translate([98,25,14]) {
            union() {
                rotate([90,0,180]) {
                    mount(9);
                }
                translate([0,-4.5,1.35]) {
                    cube([4,9,2.5]);
                }
                translate([0,-4.5,-3.85]) {
                    cube([4,9,2.5]);
                }
                translate([3,-4.5,-3]) {
                    cube([1,9,4.5]);
                }
            }
        }

        // temp board
        //translate([70,38,2+2]) {
        //    rotate([0,0,0]) {
        //        mount(4);
        //    }
        //}
        
        // temp board
        translate([2,45,35]) {
            rotate([0,90,0]) {
                mount(4);
            }
        }
        

        // relay front
        translate([90,25,102]) {
            rotate([0,180,0]) {
                mount(4);
            }
        }
        
        // relay front retention
        translate([95.5,19.5,104]) {
            union() {
                rotate([0,180,0]) {
                    difference() {
                        cube([7,7,8]);
                        translate([1,1,4]) {
                            cube([7,7,3]);
                        }
                    }
                }
            }
        }

        // relay back
        translate([62,45,102]) {
            rotate([0,180,0]) {
                mount(4);
            }
        }

        // bottom front support
        translate([2,2,2]) {
            rotate([0,0,0]) {
                cube([102,2,4]);
            }
        }

        // top front support
        translate([2,2,103]) {
            rotate([0,0,0]) {
                cube([102,1,1]);
            }
        }

        // lcd top support
        translate([2,2,73]) {
            rotate([0,0,0]) {
                cube([102,4,4.5]);
            }
        }

        // lcd bottom support
        translate([2,2,26.5]) {
            rotate([0,0,0]) {
                cube([102,4,4.5]);
            }
        }

        // left front support
        translate([1.5,2,2]) {
            rotate([0,0,0]) {
                cube([1,4,100]);
            }
        }

        // right front support
        translate([101.5,2,2]) {
            rotate([0,0,0]) {
                cube([1,4,100]);
            }
        }

        // right rear support
        translate([100,56,2]) {
            rotate([0,0,0]) {
                cube([2,10,100]);
            }
        }

        // left rear support
        translate([2,56,2]) {
            rotate([0,0,0]) {
                cube([2,10,100]);
            }
        }

        // bottom rear support
        translate([2,56,2]) {
            rotate([0,0,0]) {
                cube([100,10,2]);
            }
        }

        // top rear support
        translate([2,56,102]) {
            rotate([0,0,0]) {
                cube([100,10,2]);
            }
        }

        // rear bottom left mount
        translate([22,54,2]) {
            rotate([0,0,0]) {
                difference() {
                    cube([8,10,8]);
                    translate([4,5,4]) {
                        rotate([90,0,0]) {
                            cylinder(r = 1.5, h = 12, center = true);
                        }
                    }
                }
            }
        }

        // rear bottom right mount
        translate([74,54,2]) {
            rotate([0,0,0]) {
                difference() {
                    cube([8,10,8]);
                    translate([4,5,4]) {
                        rotate([90,0,0]) {
                            cylinder(r = 1.5, h = 12, center = true);
                        }
                    }
                }
            }
        }

        // rear top left mount
        translate([74,54,96]) {
            rotate([0,0,0]) {
                difference() {
                    cube([8,10,8]);
                    translate([4,5,4]) {
                        rotate([90,0,0]) {
                            cylinder(r = 1.5, h = 12, center = true);
                        }
                    }
                }
            }
        }

        // rear top right mount
        translate([22,54,96]) {
            rotate([0,0,0]) {
                difference() {
                    cube([8,10,8]);
                    translate([4,5,4]) {
                        rotate([90,0,0]) {
                            cylinder(r = 1.5, h = 12, center = true);
                        }
                    }
                }
            }
        }

        // top left depth support
        translate([2,2,103]) {
            rotate([0,0,0]) {
                cube([4,65,1]);
            }
        }

        // top right depth support
        translate([98,2,103]) {
            rotate([0,0,0]) {
                cube([4,65,1]);
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
        translate([101,2,78]) {
            rotate([0,0,0]) {
                cube([2,6,4]);
            }
        }
        
        // lcd top left fill
        translate([1,2,78]) {
            rotate([0,0,0]) {
                cube([2,6,4]);
            }
        }
        
        
        // cable clip bottom
        translate([50,50,6]) {
            rotate([0,0,90]) {
                cableClip();
            }
        }
        
        // cable clip bottom
        translate([90,50,6]) {
            rotate([0,0,90]) {
                cableClip();
            }
        }
        
        // cable clip bottom
        translate([10,50,6]) {
            rotate([0,0,90]) {
                cableClip();
            }
        }
        
        // cable clip left
        translate([98,50,30]) {
            rotate([270,0,90]) {
                cableClip();
            }
        }
        
        // cable clip left
        translate([98,50,60]) {
            rotate([270,0,90]) {
                cableClip();
            }
        }
        
        // cable clip left
        translate([98,50,90]) {
            rotate([270,0,90]) {
                cableClip();
            }
        }
        
        
        // cable clip right
        translate([6,35,75]) {
            rotate([90,0,90]) {
                cableClip();
            }
        }
        
        // cable clip top
        translate([40,50,100]) {
            rotate([180,0,90]) {
                cableClip();
            }
        }
        
    }
    
    intersection() {
        // back
        translate([52,359,60]) {
            rotate([0,0,0]) {
                cylinder(r = 300, h = 200, center = true, $fn = 300);
            }
        }
        
        // back
        translate([52,140,60]) {
            rotate([0,0,0]) {
                cylinder(r = 90, h = 200, center = true, $fn = 300);
            }
        }
    }
    
}
/*
        // back
        translate([50,359,60]) {
            rotate([0,0,0]) {
                cylinder(r = 300, h = 200, center = true, $fn = 300);
            }
        }
*/
/*
    intersection() {
        // back
        translate([50,359,60]) {
            rotate([0,0,0]) {
                cylinder(r = 300, h = 200, center = true, $fn = 300);
            }
        }
        
        // back
        translate([50,140,60]) {
            rotate([0,0,0]) {
                cylinder(r = 90, h = 200, center = true, $fn = 300);
            }
        }
    }
    */

// pot shims
translate([9,2,91]) {
    translate([10,0,0]) {
        difference() {
            rotate([90,0,0]) {
                difference() {
                    cylinder(r = 9, h = 4, center = true);
                    cylinder(r = 6, h = 10, center = true, $fn = 60);
                    
                }
            }
            
            translate([7,0,-1.5]) {
                cube([4,3,3]);
            }
        }
    }
    
    translate([32,0,0]) {
        difference() {
            rotate([90,0,0]) {
                difference() {
                    cylinder(r = 9, h = 4, center = true);
                    cylinder(r = 6, h = 10, center = true, $fn = 60);
                    
                }
            }
            
            translate([7,0,-1.5]) {
                cube([4,3,3]);
            }
        }
    }
    
    translate([54,0,0]) {
        difference() {
            rotate([90,0,0]) {
                difference() {
                    cylinder(r = 9, h = 4, center = true);
                    cylinder(r = 6, h = 10, center = true, $fn = 60);
                    
                }
            }
            
            translate([7,0,-1.5]) {
                cube([4,3,3]);
            }
        }
    }
}

