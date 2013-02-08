width     = 60;
length    = 100;
height    = 15;
rounding  = 5;
wall      = 4;

use <helpers/grid.scad>

union() {
	difference() {
		dish(length, width, height, rounding);

		// This is the sin waves. It's a real son of a gun. Only really got it
		// via trial and error.

		translate([-length / 2 + 4, -width / 2 +4, - height / 2 ]) {
			grid(12 / 2, 4, 8.3 * 2)
			// grid(12, 7, 8.3)
				cylinder(r = 2, h = height, center = true, $fn = 30);
		}

		translate([-length / 2 + 12.45, -width / 2 +12.45, - height / 2 ]) {
			// grid(12 / 2, 4, 8.3 * 2)
			grid(5, 3, 8.3 * 2)
				cylinder(r = 2, h = height, center = true, $fn = 30);
		}
	}

	risers(length, width, height);
}

module dish(length, width, height, rounding)
{
	// Create the primary block. Round corners via minkowski.
	difference() {
		minkowski() {
			cube([length, width, height], center=true);
			sphere(r=rounding);
		}

		translate([0, 0, wall]) {
			minkowski() {
				cube([length - wall, width - wall, height], center=true);
				sphere(r=rounding );
			}
		}

		// The top of the block is rounded, and that makes a strange print.
		// This creates a block overlapping on the top, and then it is removed.
		translate([0, 0, (height / 2) + 2]) {
			assign ( biground = rounding * 2) {
				# cube([length + biground, width + biground, rounding], center=true);
			}
		}
	}
}

module risers(length, width, height)
{
	// Create the risers
	for (bridge = [(0 - length / 2):25:(length / 2)]) {
		translate([bridge, 0, 0]) {
			hull() {
				// This is the small left side
				translate([0, (- width  / 2) + 5, (- height / 2) - 3])
					rotate(a = 90, v = [0, 1, 0])
						cylinder(r = 1, h = 1);
				// Small right side
				translate([0, (width  / 2) - 5, (- height / 2) - 3])
					rotate(a = 90, v = [0, 1, 0])
						cylinder(r = 1, h = 1);
				// Large center block
				translate([0, 0, (- height / 2) + 1])
					rotate(a = 90, v = [0, 1, 0])
						cylinder(r = 2, h = 1);
			}
		}
	}
}

