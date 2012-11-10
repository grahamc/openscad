module bevel_tube(bottomRadius, topRadius, height) {
	difference() {
		cylinder(r1 = bottomRadius, r2 = topRadius, h = height);

		translate([0, 0, -5]) {
			if (topRadius > bottomRadius) {
				cylinder(r = bottomRadius, h = height + 10);
			} else {
				cylinder(r = topRadius, h = height + 10);
			}
		}
	}
}

bevel_tube(30, 20, 10);