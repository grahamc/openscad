width     = 60;
length    = 100;
height    = 15;
rounding  = 5;
wall      = 4;

union() {
	difference() {
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
		}

		// The top of the block is rounded, and that makes a strange print.
		// This creates a block overlapping on the top, and then it is removed.
		translate([0, 0, (height / 2) + 2]) {
			assign ( biground = rounding * 2) {
				# cube([length + biground, width + biground, rounding], center=true);
			}
		}

		// This is the sin waves. It's a real son of a gun. Only really got it
		// via trial and error.
		translate([0, 0, - height / 2 ]) {
			for (m = [-2:0]) {
				translate([0, m * 20, 0]) {
					translate([5 - (length / 2.2), width / 3, 0]) {
						for(i = [0:2:(length / 2) - 10]) {
							translate([i * 2, sin(i * 26) * 5, 0]) {
								# cylinder(r = 2, h = height, center = true);
							}
						}
					}
				}
			}
		}
	}

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

