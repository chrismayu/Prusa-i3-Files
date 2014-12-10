// ..............................
// Prusa i3 Things
// LCD Box_front
// Oktay Gülmez
// 02/07/2014
// GNU GPL v3
// ..............................

module box(){
difference(){
  union(){
    minkowski(){
         translate([2,2,2]) cube([94,88,15]);
       sphere(r=2, $fn=10);
    }
      
  }
 
     translate([2,2,2]) cube([94,88,15]);
   
 translate([9.5,29,0]) cube([79,52,15]);
  
   translate([95,40.5,12]) cube([5,28,5]);

   translate([0,0,16]) cube([100,100,5]);
}
}

module buzzer(){
 difference(){
     translate([0,0,0]) cylinder(h=3, r=6);
    translate([0,0,0]) cube([12,1.5,6], center=true);
    translate([0,3,0]) cube([12,1.5,6], center=true);
    translate([0,-3,0]) cube([12,1.5,6], center=true);
    translate([0,6,0]) cube([12,1.5,6], center=true);
    translate([0,-6,0]) cube([12,1.5,6], center=true);
 }
}

difference(){
  union(){
   box();
    translate([5,87,1]) cylinder(h=5.5, r=4.5);
    translate([93,87,1]) cylinder(h=5.5, r=4.5);
    translate([5,22,1]) cylinder(h=5.5, r=4.5);
    translate([93,22,1]) cylinder(h=5.5, r=4.5);

    translate([9.5,27,1]) cube([79,2,3]);
    translate([9.5,81,1]) cube([79,2,3]);
    translate([7.5,27,1]) cube([2,56,3]); 
    translate([88.5,27,1]) cube([2,56,3]);     
  }
  translate([5,87,1.5]) cylinder(h=6.5, r=1.3);
    translate([93,87,1.5]) cylinder(h=6.5, r=1.3);
    translate([5,22,1.5]) cylinder(h=6.5, r=1.3);
    translate([93,22,1.5]) cylinder(h=6.5, r=1.3);

  translate([12,11,0]) cylinder(h=6.5, r=5);
  translate([45.5,11,0]) cylinder(h=6.5, r=2);
  translate([87,14.5,0]) cylinder(h=6.5, r=3);
  
  translate([29,11,0]) buzzer();
}