module tube(innerRadius, height, wallWidth) {
	outerRadius = innerRadius + wallWidth;

	difference() {
		cylinder(r = outerRadius, h = height);
		translate([0, 0, -5]) {
			cylinder(r = innerRadius, h = height + 10);
		}
	}	
}

tube(10, 30, 2, $fn = 100);