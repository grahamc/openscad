use <helpers/pivot.scad>
use <helpers/tube.scad>
use <helpers/cup.scad>
use <helpers/bevel.scad>

$fn = 100;

module saucer(radius, height, wall, supports, supportRadius, supportHeight) {
	cup(radius, height, wall);
	pivot(supports, radius / 1.5) {
		cylinder(r = supportRadius, h = supportHeight, $fn = 25);
	}
}

module topCup(topRadius, topHeight, lowerRadius, lowerHeight, wall, ) {
	difference() {
		union() {
			// Create a beveled tube
			translate([0, 0, 22]) {
				tube(topRadius, topHeight, wall);
			}
			translate([0, 0, 20]) {
				bevel_tube(lowerRadius + wall, topRadius + wall, wall);
			}

			// Tuck a little cup at the bottom
			cup(lowerRadius, 22, wall);
		}

		// Poke a hole for drainage
		translate([0, 0, -5]) {
			cylinder(r = 5, h = 10);
		}
	}
}

wall = 2;

saucerInnerRadius = 32;
saucerInnerHeight = 30;
saucerSupportHeight = 10;

// saucer(saucerInnerRadius, saucerInnerHeight, wall, 4, 5, saucerSupportHeight);


potLowerInnerRadius = saucerInnerRadius - 3;
potUpperInnerRadius = saucerInnerRadius;
potUpperHeight = 60;
potLowerHeight = saucerInnerHeight - saucerSupportHeight;

translate([0, 0, 10]) {
	color("red") topCup(potUpperInnerRadius, potUpperHeight, potLowerInnerRadius, potLowerHight, wall);
}
