wall = 2;
height = 20;

complete();

module complete()
{
	translate([0, -35, 0]) {
		monitor_hook(wall, height);
	}

	main_beam(wall, height);

	translate([10, 0, 0]) {
		top_L(wall, height);
	}

	translate([60, 0, 0]) {
		bottom_L(wall, height);
	}

}

module main_beam(wall, height)
{
	cube([75, wall, height]);
}

module monitor_hook(wall, height)
{
	cube([wall, 35, height]);
	cube([20, wall, height]);
}

module top_L(wall, height)
{
	cube([wall, 25, height]);
	translate([-10, 25, 0]) {
		cube([10 + wall, wall, height]);
	}
}

module bottom_L(wall, height)
{
	cube([wall, 25, height]);
	translate([-15 + wall, 25, 0]) {
		cube([15, wall, height]);
	}
}
