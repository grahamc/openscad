module pivot(number, r) {
	if (number == 1) {
		child(0);
	} else if (number > 1) {
		for (i = [0 : number - 1]) {
			rotate([0, 0, 360 / number * i]) {
				translate([r, 0, 0]) {
					child(0);
				}
			}
		}
	}
}

pivot(5, 10) {
	cylinder(r = 5, h = 5, center = true);
}