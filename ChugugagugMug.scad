$fn = 100;

module bottomCup() {
	offsetFromCenter = 20;
	postHeight = 10;

	union() {
		difference() {
			cylinder(r = 34, h = 30);
			translate([0, 0, 2]) {
				cylinder(r = 32, h = 30);
			}
		}

		translate([-offsetFromCenter, 0, 0]) {
			cylinder(r = 5, h = postHeight, $fn = 25);
		}
		translate([offsetFromCenter, 0, 0]) {
			cylinder(r = 5, h = postHeight, $fn = 25);
		}
		translate([0, offsetFromCenter, 0]) {
			cylinder(r = 5, h = postHeight, $fn = 25);
		}
		translate([0, -offsetFromCenter, 0]) {
			cylinder(r = 5, h = postHeight, $fn = 25);
		}
	}
}

module topCup() {
	difference() {
		union() {
			translate([0, 0, 20]) {
				difference() {
					union() {
						translate([0, 0, 2]) {
							cylinder(r = 34, h = 60);
						}
						cylinder(r1 = 31, r2 = 34, h = 2);
					}
					translate([0, 0, 2]) {
						cylinder(r = 32, h = 62);
					}
				}
			}
			cylinder(r = 31, h = 22);
		}
		translate([0, 0, 2]) {
			cylinder(r = 29, h = 30);
		}
		translate([0, 0, -5]) {
			cylinder(r = 5, h = 10);
		}
	}
}

// bottomCup();

translate([0, 0, 10]) {
	color("red") topCup();
}
