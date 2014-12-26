height =110;

axle = 8;

base = 110;


difference(){

union(){

cube([base,10,10]);
cube([base,2,20]);
hull(){
translate([0,5,0])
cylinder(r=5, h=5, ceter=true);
translate([(base/2),height,0])
cylinder(r=5, h=5, ceter=true);
}

hull(){
translate([(base/2),height,0])
cylinder(r=5, h=5, ceter=true);
translate([base,5,0])
cylinder(r=5, h=5, ceter=true);
}


translate([(base/2),height,0])
cylinder(r=axle,h=10);
}
translate([(base/2),height,-1])
cylinder(r=(axle/2),h=12);
}