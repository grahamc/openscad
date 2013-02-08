wall = 3;
height = 10;
wire = 5;

complete();
//wire_holder(wall, height, wire);
module complete()
{
	translate([0, -35, 0]) {
		monitor_hook(wall, height);
	}

	main_beam(wall, height);

	translate([20, 0, 0]) {
		top_L(wall, height);
	}

	translate([0, 25, 0]) {
		wire_holder(20, height, wire);
	}

	translate([40 - wall, 0, 0]) {
		cube([wall, 25, height]);
	}

}

module main_beam(wall, height)
{
	cube([40, wall, height]);
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
	down = -5;

	difference()
	{
		cube([40, wall, height]);

		translate([10, wall * .5, down]) {
			rotate([270, 0, 0]) {
				keyhole(wall * 3, wire);
			}
		}
		translate([30, wall * .5, down]) {
			rotate([270, 0, 0]) {
				keyhole(wall * 3, wire);
			}
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
