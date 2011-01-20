height=20;
thick=5;
union() {
cube(size=[thick,50,height],center=false);
translate(v = [thick, 50-thick, 0])
cube(size=[30,thick,height], center=false);
translate(v = [thick+30, 0, 0])
cube(size=[thick,50,height],center=false);
translate(v = [thick+30+thick, 0, 0])
cube(size=[30,thick,height],center=false);
translate(v = [thick+30+thick+30, 0, 0])
cube(size=[thick,50,height],center=false);
translate(v = [thick+30+thick+30-10, 50-thick, 0])
cube(size=[10,thick,height],center=false);
}