grid(1, 26, 9)
	cylinder(r = 2, h = 10, $fn = 10);

module grid(x, y, space)
{
	for (i = [1:space:x * space]) {
		for (j = [1:space:y * space]) {
			translate([i, j, 0]) {
				child();
			}
		}
	}
}