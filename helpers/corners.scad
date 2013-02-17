wall = 5;
diameter = 100;
radius = diameter / 2;

outer_bound = radius + wall;


rounded_corner(wall = 3, radius = 30, height = 30, corners = [0, 0, 0, 1]);

/**
 * Create a rounded corner.
 * @param int wall Thickness of the wall.
 * @param int radius Radius of the rounded corner.
 * @param int height How tall the corner should be.
 * @param array corners [topLeft, topRight, bottomRight, bottomLeft]
 * The orientation of the corner.
 */
module rounded_corner(wall, radius, height, corners = [0, 1, 0, 0]) {
	diameter = radius * 2;
	outer_bound = radius + wall;

	subtract_height = height + 2;

	difference() {
		cylinder(r = outer_bound, h = height);
		translate([0, 0, -1]) {
			cylinder(r = radius, h = subtract_height);
	
             
			// Remove the top left section
			if (!corners[0])
				_rounded_corner_section(outer_bound, subtract_height, [1, 0, 0]);

			// remove the top right section
			if (!corners[1])
				_rounded_corner_section(outer_bound, subtract_height, [0, 0, 0]);

			// Remove the bottom right section
			if (!corners[2])
				_rounded_corner_section(outer_bound, subtract_height, [0, 1, 0]);

			// Remove the bottom left section
			if (!corners[3])
				_rounded_corner_section(outer_bound, subtract_height, [1, 1, 0]);



			// Remove the artifact between the top right and top left
			if (!corners[0] && !corners[1]) {
				_rounded_corner_artifact(outer_bound, subtract_height, [0, 1]);
			}
			// Remove the artifact between the top right and bottom right
			if (!corners[1] && !corners[2]) {
				_rounded_corner_artifact(outer_bound, subtract_height, [1, 0]);
			}
			// Remove the artifact between the bottom right and bottom left
			if (!corners[2] && !corners[3]) {
				_rounded_corner_artifact(outer_bound, subtract_height, [0, -1]);
			}
			// Remove the artifact between the bottom left and top left
			if (!corners[3] && !corners[0]) {
				_rounded_corner_artifact(outer_bound, subtract_height, [-1, 0]);
			}

			translate ([0 - wall, 0 - radius - wall]) {
			//	cube([diameter, diameter, subtract_height]);
			}
		}
	}
}

/**
 * Generate a cube the right size to remove the segment of the corner
 */
module _rounded_corner_section(size, height, location = [0, 0, 0]) {
	mirror(location) {
		cube([size, size, height]);
	}
} 

module _rounded_corner_artifact(size, height, location = [0, 0]) {
	translate([location[0] * size - size / 2, location[1] * size - size / 2, 0]) {
		color("blue") cube([size, size, height]);
	}
}
