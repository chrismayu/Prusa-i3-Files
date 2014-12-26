//diameters of spool holes
big_hole = 53.3;
medium_hole = 32.2;
small_hole= 19.3;

bearing_hole= 22;//608
bearing_depth = 7;//608
spool_depth =15 ;//depth of each teir
axle_diameter = 8;//diameter of axle hole.



module rim(){
cylinder(r=big_hole/2 + 5,h=3,center=true,$fs = 0.01);
}

module big(){
translate([0,0,spool_depth/2-1])cylinder(r=big_hole/2,h=spool_depth+1,center=true,$fs = 0.01);
}

module  mid(){
translate([0,0,((spool_depth/2)*3)-1])cylinder(r=medium_hole/2,h=spool_depth+1,center=true,$fs = 0.01);
}

module small(){
translate([0,0,((spool_depth/2)*5)-1])cylinder(r=small_hole/2,h=spool_depth+1,center=true,$fs = 0.01);
}

module axle(){
cylinder(r=axle_diameter/2 +.5,h=spool_depth * 8,center=true,$fs = 0.01);
}

module bearing(){
translate([0,0,bearing_depth/2 -2])cylinder(r=bearing_hole/2,h=bearing_depth,center=true,$fs = 0.01);
}
difference(){

		union(){
			rim();
			big();
			mid();
			small();
		}
		axle();
		bearing();
}