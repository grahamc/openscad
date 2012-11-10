use <helpers/pivot.scad>
use <helpers/tube.scad>
use <helpers/cup.scad>

$fn = 100;

module saucer(radius, height, wall, supports, supportRadius, supportHeight) {
	cup(radius, height, wall);
	pivot(supports, radius / 1.5) {
		cylinder(r = supportRadius, h = supportHeight, $fn = 25);
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
			cup(29, 22, 2);
		}
		translate([0, 0, -5]) {
			cylinder(r = 5, h = 10);
		}
	}
}


// saucer(32, 30, 2, 4, 5, 10);

translate([0, 0, 10]) {
	color("red") topCup();
}
