use <helpers/pivot.scad>
use <helpers/grid.scad>
use <helpers/tube.scad>
use <helpers/bevel.scad>


explodeFactor = 3;
display = 0;

printTop = 0;
printBottom = 1;

testPrintScrewHole = 0;
testPrintLeds = 0;

if (printTop == 1) {
	top();
}

if (display == 1) {
	translate([0, 0, 15 * (explodeFactor * 3 + 1)]) {
		screws();
	}
}

if (printBottom == 1) {
	translate([0, 0, 37 * (explodeFactor + 1)]) {
		plate();
	}
}

if (testPrintScrewHole == 1) {
	difference() {
		screwsHolder(10);
		translate([0, 0, -15]) {
			screws();
		}
	}
	
}

if (testPrintLeds == 1) {
	rot_case();
}

module top()
{

	difference() {
		tube(44, 40, 3, $fn = 100);

		translate([30, -7, 24]) {
			usb_port();
		}
	}


	difference() {
		cylinder(r = 47, h = 5, $fn = 100);
		translate([0, 0, -1]) {
			leds();
		}

		translate([0, 0, 2]) {
			reader_inplace();
		}
	}
	
	if (display == 1) {
		leds();

		translate([0, 0, 2]) {
			reader_inplace();
		}
	}

	translate([0, 0, 5]) {
		led_holders(height = 2);
	}

	screwsHolder();	
}


module plate()
{
	difference() {
		cylinder(r = 44, h = 3, $fn = 100);
		translate([0, 0, -22]) {
			screws();
		}
	}
}


module screws()
{
	head_radius = 3.25;
	head_height = 2.7;
	screw_radius = 1.75;
	screw_height = 25;

	screwPattern() {
		union() {
			translate([0, 0, screw_height - head_height]) {
				bevel_tube(screw_radius, head_radius, head_height, $fn = 100);
			}
			cylinder(h = screw_height, r = screw_radius, $fn = 100);
		}
	}
}

module screwsHolder(screwHeight = 37)
{
	screwPattern() screwHolder(screwHeight);
}

module screwPattern()
{

	offX = 28;
	offY = 28;
	rotate([0, 0, 22.5]) {
		translate([offX, offY, 0]) {
			child();
		}
		translate([offX, -offY, 0]) {
			child();
		}
		translate([-offX, offY, 0]) {
			child();
		}
		translate([-offX, -offY, 0]) {
			child();
		}
	}
}

module screwHolder(screwHeight = 37)
{
	screwRadius = 1.8;
	wallWidth = 3;

	tube(screwRadius, screwHeight, wallWidth, $fn = 100);

}

/* USB Port */

module usb_port()
{
	cube([20, 15, 20]);
}

/* RFID Reader */

module reader_inplace()
{
	rotate([0, 0, 22.5]) {
		translate([-14, -14, 0]) {
			color("black") reader();
		}
	}
}

module reader()
{
	cube([28, 28, 6]);
}


/* LED Bits */

module led_holders(height = 7, radius = 2.5, wall = 3)
{
	color("blue") rot_case(height, radius, wall);
	rotate([0, 0, 45]) {
		color("red") rot_case(height, radius, wall);
	}
}

module leds(height = 7, radius = 2.5)
{
	color("blue") rot_bars(height, radius);
	rotate([0, 0, 45]) {
		color("red") rot_bars(height, radius);
	}
}


module rot_case(height = 7, radius = 2.5, wall = 3)
{
	difference() {
		rot_bars(height, radius + wall);
		translate([0, 0, -height * .05])
		rot_bars(height * 1.2, radius);
	}
}

module rot_bars(height = 7, radius = 2.5)
{
	pivot(4, 20.2) {
		grid(4, 1, 6) {
			cylinder(r = radius, h = height, $fn = 50);
		}
	}
}