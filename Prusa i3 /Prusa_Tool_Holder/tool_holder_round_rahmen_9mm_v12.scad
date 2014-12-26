
// nischi prusa lamp holder


screwhole = 4; 		//for 3mm screw, to mount opto stop
nuttrap=7; 			//hole for nut - 3mm nut measured, thickness 2.5 
gap_width = 10;

body_width=24; 	//rod end
body_height=10; 	//rod end
screw_elevation = body_height/2; // set at half of body_height 

translate([0,0,body_height ]) rotate([0,-180,0]) tool_holder();

module tool_holder()
{
  difference()
  {
    union()
    {
  	translate([-8,-20,0 ]) cube([body_width,38,body_height]);  
	translate([4,-20,0 ]) cylinder(body_height, r=body_width/2,$fn=20);
	translate([4,-20,-5 ]) cylinder(body_height, r1=7, r2=10,  $fn=20);
    }

    union()
    {
       rotate([0,30,0]) cutting();

        translate([4,-20,-1]) cylinder(h = body_height+2, r1=3, r2=3 ,$fn = 50);	
        translate([4,-20,-6]) cylinder(h = body_height/3*2, r1=9/2, r2=4 ,$fn = 50);	

	  //screw to hold to rod
	  translate([0,10,screw_elevation]) rotate([0,90,0]) 
		cylinder(40,screwhole/2, screwhole/2, $fn=20,center=true); //screw hole
	  translate([-8,10,screw_elevation]) rotate([0,90,0]) 
		cylinder(5,nuttrap/2,nuttrap/2, $fn=6,center=true); //nut trap
    }
  }
}

module cutting()
{
	translate([0,     0, -5 ]) cylinder((body_height+20),4.25,4.25);  // for 8mm threaded rod
	translate([-3.75,0, -5 ]) cube([7.5,25,(body_height+20)]);   // long slot 
}
