// ..............................
// Prusa i3 Things
// LCD Box_back
// Oktay Gülmez
// 02/07/2014
// GNU GPL v3
// ..............................

module back(){
difference(){
  union(){
    minkowski(){
         translate([2,2,0]) cube([94,88,2]);
       cylinder(r=2);
    }
   translate([2.5,2.5,0]) cube([93,87,6]); 

    
         translate([42,-6,6]) rotate([0,90,0]) cylinder(h=34, r=6);
   translate([42,-12,0]) cube([34,12,6]);  
   translate([42,-12,0]) cube([34,15,3]);   
     
  }
 translate([23.5,74,0]) cube([21.5,9,10]);
 translate([54,74,0]) cube([21.5,9,10]);
  
 
   translate([4,4,1.5]) cube([90,84,10]); 

 translate([0,41,3]) cube([10,29,15]);

  translate([40,-6,6]) rotate([0,90,0]) cylinder(h=38, r=2.3);

  translate([52,-13,0]) cube([14,13,13]); 
}
}

difference(){
  union(){
    back();
     translate([5,87,0]) cylinder(h=6, r=4.5);
    translate([93,87,0]) cylinder(h=6, r=4.5);
    translate([5,22,0]) cylinder(h=6, r=4.5);
    translate([93,22,0]) cylinder(h=6, r=4.5);
  }
   translate([5,87,0]) cylinder(h=8, r=2);
    translate([93,87,0]) cylinder(h=8, r=2);
    translate([5,22,0]) cylinder(h=8, r=2);
    translate([93,22,0]) cylinder(h=8, r=2);
 
 translate([0,0,3]) cube([2.5,100,10]);
 translate([95.5,0,3]) cube([2.5,100,10]);
 translate([0,89.5,3]) cube([100,2.5,10]);
}



