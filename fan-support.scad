$fn = 100;

union() {
	cube(size = [80, 14, 4]);
	translate([4.3, 2, 2]) {
		rotate([90, 0, 0]) {
			cylinder(r = 2, h = 30);
		}
	}
	
	translate([75.7, 2, 2]) {
		rotate([90, 0, 0]) {
			cylinder(r = 2, h = 30);
		}
	}
}