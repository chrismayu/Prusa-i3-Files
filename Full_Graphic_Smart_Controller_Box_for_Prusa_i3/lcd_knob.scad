// ..............................
// Prusa i3 Things
// LCD Box_knob
// Oktay Gülmez
// 02/07/2014
// GNU GPL v3
// ..............................

module hole(){
difference(){
  union(){
    
   translate([0,0,0]) cylinder(h=10, r=3.3, $fn=24);

    
  }
 translate([-3,1.7,0]) cube([6,3,10]);
 
}
}

difference(){
  union(){
    
     translate([0,0,0]) cylinder(h=13, r=10);
     translate([0,0,13]) cylinder(h=1, r1=10, r2=9);
    
     
    
  }
   translate([0,0,3]) hole();
   translate([0,0,0]) cylinder(h=1.5, r=4, $fn=24);
   translate([0,0,1.5]) cylinder(h=2.5, r=3.3, $fn=24);


   for ( i = [0 : 11] )
{
    rotate( i * 360 / 12, [0, 0, 1])
    translate([0, 11, 0])
    cylinder(h=18, r=2, $fn=10);
}
   
}



