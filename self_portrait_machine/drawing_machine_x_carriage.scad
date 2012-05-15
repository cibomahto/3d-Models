box_width = 65;
box_length = 75;
box_height = 40;

frame_thickness = 13;

bar_radius = 15.5/2+.3;
bar_separation = 49.27;

belt_mount_length = 5;
belt_mount_offset = 13.28;


platform_mount_height = 5;

module frame() {
  union() {
    // outer box
    difference() {
      cube(size=[box_width,box_length,box_height]);

      translate([frame_thickness/2,frame_thickness/2,-.25])
        cube(size=[box_width-frame_thickness,box_length-frame_thickness,box_height+.5]);
    }

    // belt mount
    translate([0,box_length/2+bar_separation/2,0])
      translate([0, -belt_mount_offset-belt_mount_length/2,0])
        translate([0, -belt_mount_length/2, 0]) {
          difference() {
            cube(size=[box_width, belt_mount_length, box_height]);

            // teeth
            union() {
              translate([box_width/2,4,0]) {
                cube(size=[1.2,10,9]);

                translate([2,0,0])
                  cube(size=[1.2,10,9]);
                translate([4,0,0])
                  cube(size=[1.2,10,9]);
                translate([6,0,0])
                  cube(size=[1.2,1+10,9]);
                translate([8,0,0])
                  cube(size=[1.2,10,9]);
                translate([10,0,0])
                  cube(size=[1.2,10,9]);
                translate([12,0,0])
                  cube(size=[1.2,10,9]);

                translate([-2,0,0])
                  cube(size=[1.2,10,9]);
                translate([-4,0,0])
                  cube(size=[1.2,10,9]);
                translate([-6,0,0])
                  cube(size=[1.2,10,9]);
                translate([-8,0,0])
                  cube(size=[1.2,10,9]);
                translate([-10,0,0])
                  cube(size=[1.2,10,9]);
                translate([-12,0,0])
                  cube(size=[1.2,10,9]);
              }
            }

            // bolt holes
            translate([box_width/2-8,belt_mount_length+.25,22])
              rotate(a=[90,0,0])
                cylinder(h=belt_mount_length+.5,r=1.75);
            translate([box_width/2+8,belt_mount_length+.25,22])
              rotate(a=[90,0,0])
                cylinder(h=belt_mount_length+.5,r=1.75);
            translate([box_width/2-8,belt_mount_length+.25,13])
              rotate(a=[90,0,0])
                cylinder(h=belt_mount_length+.5,r=1.75);
            translate([box_width/2+8,belt_mount_length+.25,13])
              rotate(a=[90,0,0])
                cylinder(h=belt_mount_length+.5,r=1.75);
          }

        }
   
    // top nut mounts
    translate([0,0,box_height-platform_mount_height])
      difference() {
        cube(size=[frame_thickness+2.5,frame_thickness+2.5,platform_mount_height]);
        translate([10, 10, -.25])
          cylinder(h=platform_mount_height +0.5,r=1.7);
      }

    translate([box_width,0,box_height-platform_mount_height])
      rotate(a=[0,0,90])
        difference() {
          cube(size=[frame_thickness+2.5,frame_thickness+2.5,platform_mount_height]);
          translate([10, 10, -.25])
            cylinder(h=platform_mount_height +0.5,r=1.7);
        }

    translate([box_width,box_length,box_height-platform_mount_height])
      rotate(a=[0,0,180])
        difference() {
          cube(size=[frame_thickness+2.5,frame_thickness+2.5,platform_mount_height]);
          translate([10, 10, -.25])
            cylinder(h=platform_mount_height +0.5,r=1.7);
        }

    translate([0,box_length,box_height-platform_mount_height])
      rotate(a=[0,0,270])
        difference() {
          cube(size=[frame_thickness+2.5,frame_thickness+2.5,platform_mount_height]);
          translate([10, 10, -.25])
            cylinder(h=platform_mount_height +0.5,r=1.7);
        }
  }
}

difference() {
  frame();
  
  // axle punchouts
  translate([-.25,box_length/2+bar_separation/2,10])
    rotate(a=[0,90,0])
      cylinder(h=box_width+.5, r=bar_radius);
  translate([-.25,box_length/2-bar_separation/2,10])
    rotate(a=[0,90,0])
      cylinder(h=box_width+.5, r=bar_radius);

  // belt punchouts
  translate([-.25,box_length/2+bar_separation/2,0]) {
    translate([0,-belt_mount_offset-belt_mount_length/2,0]) {
      translate([0, belt_mount_length/2, 0])
        cube(size=[box_width+.5, 2, 8]);
      translate([0, -2*belt_mount_length/2-belt_mount_length/2, 0])
        cube(size=[box_width+.5, belt_mount_length, 8]);
    }
  }
}