
hole_fudge = 1.2;

module hexagon(size, height) {
	union() {
		for(i=[0:2]) //loop i from 0 to 2
		{ 
			//make a cube, rotate it 60 degrees around the X axis,
			rotate([0,0,120*i]) {
				cube([size*hole_fudge,(size/tan(60))*hole_fudge,height], center = true);
			}
		}
	}
}

module boltHole() {
	translate(v=[0,0,2.5]) {
		hexagon(size=8, height = 5);
	}
	cylinder(h = 10, r = 2.5*hole_fudge, center = true);	
}
module depthIndicatorMount()
{
	difference() { 
		// Plate
		cube(size = [120,20,10], center = true);
		// Gauge hole
		cylinder(h = 10, r = 4.75*hole_fudge, center = true);
		
		// Screw mounts
		translate(v=[52.5,0,0]) {
			boltHole();
		}
		translate(v=[-52.5,0,0]) {
			boltHole();
		}
		// hinge cutout
		cube(size = [40,2,10],center = true);
		translate(v=[20-1,5,0]) {
			cube(size = [2,10,10],center = true);
		}
		// screw hole for hinge
		translate(v=[13,0,0]) {
			rotate(a=[90,0,0]) {
				cylinder(h = 21, r = 1.6*hole_fudge, center = true);
				translate(v=[0,0,10-1.45]) {
					hexagon(size=5.5, height = 3);
				}
			}
		}
	}
}

depthIndicatorMount();
