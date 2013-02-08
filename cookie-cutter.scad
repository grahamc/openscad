norm = [0, 0, 0];
display = [106, 0, 200];
rotate(norm) {
	union() {
		outer_cup();
		inner_cup();
	
		translate([0, 0, 15]) {
			cylinder(r = 4, h = 2, $fn = 50);
		}
	}
}

module outer_cup() {
	difference() {
		dome(11, 30);
		dome(10, 30, .9);
	}

	difference() {
		translate([0, 0, -10]) {
			cylinder(r = log(11) * 30, h = 10);
		}
		translate([0, 0, -11]) {
			cylinder(r = log(10) * 30, h = 12);
		}
	}
}


module inner_cup() {
	difference() {
		dome(20, 10);
		dome(15, 10, .5);
	}

	difference() {
		translate([0, 0, -10]) {
			cylinder(r = log(20) * 10, h = 10);
		}
		translate([0, 0, -11]) {
			cylinder(r = log(15) * 10, h = 12);
		}
	}
}

module dome(iterations, diameter, precision = 1) {
	hull() {
		for (i = [0:iterations]) {
			translate([0, 0, (iterations - i) * precision])
			cylinder(r = log(i) * diameter, h = precision, $fn=50);
		}
	}
}