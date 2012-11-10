/*
 * cup(innerRadius, innerHeight, wallWidth)
 *
 * Create a water-tight.
 *
 * Arguments:
 *  - innerRadius - The internal radius of the saucer. Should have
 *      some wiggle room against the pot.
 *  - innerHeight - The internal, usable height of the saucer.
 *  - wallWidth - The width of any wall, including the sides and bottom.
 *
 * Total diameter can be calculated by (innerRadius + wallWidth) * 2
 * Total height can be calculated by innerHeight + wallWidth
 */
module cup(innerRadius, innerHeight, wallWidth) {
	outerRadius = innerRadius + wallWidth;

	union() {
		difference() {
			cylinder(r = outerRadius, h = innerHeight);
			translate([0, 0, wallWidth]) {
				cylinder(r = innerRadius, h = innerHeight);
			}
		}
	}
}

cup(32, 30, 2);