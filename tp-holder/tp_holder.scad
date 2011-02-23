
base_thickness=4;
base_width=80;

tp_height=110;
tp_radius=19.5;
tp_thickness=2;

cap_radius=22;
cap_thickness=2;

slit_thickness=8;

// Base
translate([-base_width/2, -base_width/2,0])
	cube(size=[base_width,base_width,base_thickness]);

difference() {
	union() {
		// tube
		translate([0,0,base_thickness])		
			cylinder(h=tp_height,r=tp_radius);

		//endcap
		translate([0,0,base_thickness+tp_height])
			cylinder(h=cap_thickness, r1 =tp_radius, r2=cap_radius);
	}
	// hollow ceter
	translate([0,0,5])
		cylinder(h=tp_height+cap_thickness, r=tp_radius-tp_thickness);
	// side holes
	translate([-base_width/2,-slit_thickness/2,30])
		cube(size=[base_width, slit_thickness,tp_height+cap_thickness]);
}