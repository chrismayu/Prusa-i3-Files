// Title: Eggcrate suction cup glass mount
// Description: Designed to work with MaxiJet suction cups
// Author: Shane Graber
// URL: http://thingiverse.com/sgraber

wt = 2.5; 	// wall thickness, mm
ww = 14;  	// wall width, mm
y  = 25;  	// length of fixture, mm
hole = 10;	// suction cup hole diameter, mm


translate([0,-y/2,0]) {
union() {

	// eggcrate attachment
	cube(size=[wt, y, ww]);
	rotate([0,0,90]) translate([y,-(wt+2.5+wt),0]) cube(size=[wt, wt+2.5+wt, ww]);
	translate([wt+2.5,y-2.5,0]) cube(size=[wt,wt*2,ww]);
	translate([35+wt,y-wt-9,0]) rotate([0,0,90]) cube(size=[wt,35+wt,ww]);
	translate([35+wt,y-wt-9,0]) cube(size=[wt, wt*3, ww]);
	translate([0,0,0]) rotate([0,0,90]) cube(size=[wt,5,ww]);
	translate([0,2.2,0]) rotate([0,0,-60]) cube(size=[wt,27,ww]);

	// suction cup attachment
	difference() {
		translate([0,y,0]) cube(size=[wt, 25, ww]);
		translate([-4,y+25/2+1,ww/2]) rotate([0,90,0]) cylinder(r=hole/2, h=10, $fn=7);
	}
	
}
}
