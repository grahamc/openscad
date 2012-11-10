bottom_section = false;

module eight(height, wall_width, inner_width, inner_length) {
    length = inner_length * 2 + wall_width * 3;
    width = wall_width * 2 + inner_width;
    wall_offset = (wall_width + inner_length) / 2;

    if (debug) {
        echo("Height: ", height);
        echo("Wall Width: ", wall_width);
        echo("Inner Width:", inner_width);
        echo("Inner Length: ", inner_length);
        echo("Total Length: ", length);
        echo("Total Width: ", width);
        echo("Wall Offset: ", wall_offset);
    }

    difference() {
        cube([length, width, height], center = true);

        translate([wall_offset, 0, 0]) {
            cube([inner_length, inner_width, height * 1.5], center = true);
        }

        translate([- wall_offset, 0, 0]) {
            cube([inner_length, inner_width, height * 1.5], center = true);
        }

    }
}

length = 50;
single_length = 75;

translate([12.5, -1.5, -1.5]) {
    cube([length, 3, 3]);
}

eight(3, 3, 4, 8);

if (length < single_length) {
    translate([length + 25, 0, 0]) {
        eight(3, 3, 4, 8);
    }
}
