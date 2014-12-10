// ..............................
// Prusa i3 Things
// LCD Box_hinge
// Oktay Gülmez
// 02/07/2014
// GNU GPL v3
// ..............................

difference(){
  union(){
    

    
         translate([52,0,11]) rotate([0,90,0]) cylinder(h=14, r=6);
    translate([52,-12,0]) cube([14,18,11]);

   //translate([41,-12,0]) cube([36,12,6]); 
  minkowski(){ 
   translate([43,-12,0]) cube([32,16,4]);  
    cylinder(r=2);
  } 
     
  }
 
  
  translate([49,-4,0]) cylinder(h=6.5, r=2);
  translate([69,-4,0]) cylinder(h=6.5, r=2);
   translate([49,-4,2.5]) rotate([0,0,90]) cylinder(h=6.5, r=3.4, $fn=6);
  translate([69,-4,2.5]) rotate([0,0,90]) cylinder(h=6.5, r=3.4, $fn=6);
   

  translate([40,0,11]) rotate([0,90,0]) cylinder(h=38, r=2.3);
  
  translate([51,-12,11]) rotate([0,90,0]) cylinder(h=16, r=6);

   
}





