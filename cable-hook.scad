wall = 3;
height = 15;
wire = 4;

complete();
//wire_holder(wall, height, wire);
module complete()
{
	translate([0, -35, 0]) {
		monitor_hook(wall, height);
	}

	main_beam(wall, height);

	translate([10, 0, 0]) {
		top_L(wall, height);
	}

	translate([65, 0, 0]) {
		bottom_L(wall, height);
	}

	translate([0, 25, 0]) {
		wire_holder(wall, height, wire);
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
	translate([0, 25, 0]) {
		cube([10, wall, height]);
	}
}

module wire_holder(wall, height, wire)
{
	difference()
	{
		main_beam(wall, height);

		translate([45, wall * 1.5, height - 5]) {
			keyhole(wall * 2, wire);
		}
		translate([30, wall * 1.5, height - 5]) {
			keyhole(wall * 2, wire);
		}
	}
}


module keyhole(wall, entrance_width)
{
	hole_diameter = entrance_width * 2;
	translate([- hole_diameter / 4, -wall, 0]) {
		cube([entrance_width, wall, hole_diameter]);
	}
	rotate([90, 0, 0]) {
		cylinder(r = hole_diameter / 2, h = wall, $fn = 50 );
	}
}
