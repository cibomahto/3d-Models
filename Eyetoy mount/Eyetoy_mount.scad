thick=0.3;
width=3.5;
rotate=30;

hole_d = 0.120;

v_offset=thick*sin(rotate);
h_offset=thick*cos(rotate);

difference() {
  union() {
    cube(size = [1.2+v_offset,width,thick]);

    translate(v=[h_offset,0,v_offset]) {
      rotate(a=[0,270-rotate,0]) {
        cube(size = [1,width,thick]);
      }
    }
  }
  translate(v=[h_offset+0.5,0,0]) {
    translate(v=[0,0.5,0]) {
      cylinder(h = thick, r=hole_d/2, $fn=20);
  }
    translate(v=[0,3,0]) {
      cylinder(h = thick, r=hole_d/2, $fn=20);
  }
 }
  translate(v=[h_offset-0.1,0,0]) {
    translate(v=[0,0.5,0]) {
      cylinder(h = thick*2, r=hole_d/2, $fn=20);
  }
    translate(v=[0,3,0]) {
      cylinder(h = thick*2, r=hole_d/2, $fn=20);
  }
 }
}