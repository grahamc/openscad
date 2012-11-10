radius = 25;
wall_thickness = 3;
bottom_radius = radius - wall_thickness;

height = 10;

inner_radius = radius - wall_thickness;
inner_bottom_radius = bottom_radius - wall_thickness;
bottom_offset = height - wall_thickness;

difference() {
    union() {
        cylinder(h=height, r1=bottom_radius, r2=radius);
        translate([0, 0, height]) {
            cylinder(h=height, r=radius);
        }
    }

    // Inside Cup
    translate([0, 0, wall_thickness]) {
        union() {
            cylinder(h=bottom_offset, r1=inner_bottom_radius, r2=inner_radius);
            translate([0, 0, bottom_offset]) {
                cylinder(h=height, r=inner_radius);
            }
        }
    }
}