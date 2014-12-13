
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
    }

    union()
    {
       rotate([0,30,0]) cutting();  // schraubenbohrung

       translate([4,-16, -2 ]) rotate([0,0,0]) pinzette();

        // round big 
        // translate([4,-20,-1]) cylinder(h = body_height+2, r1=3, r2=3 ,$fn = 50);	
        // translate([4,-20,-1]) cylinder(h = body_height/3*2, r1=9, r2=4 ,$fn = 50);	

	  //screw to hold to rod
	  translate([0,10,screw_elevation]) rotate([0,90,0]) 
		cylinder(40,screwhole/2, screwhole/2, $fn=20,center=true); //screw hole
	  translate([-8,10,screw_elevation]) rotate([0,90,0]) 
		cylinder(5,nuttrap/2,nuttrap/2, $fn=6,center=true); //nut trap
    }
  }
}

module pinzette()
{
   polyhedron(
      points=[ [8,8,0],[8,-8,0],[-8,-8,0],[-8,8,0], // the four points at base
                  [0,0,40]  ],                                 // the apex point 
      triangles=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],          // each triangle side
                     [1,0,3],[2,1,3] ]                         // two triangles for square base
   );
}

module cutting()
{
	translate([0,     0, -5 ]) cylinder((body_height+20),4.25,4.25);  // for 8mm threaded rod
	translate([-3.75,0, -5 ]) cube([7.5,25,(body_height+20)]);   // long slot 
}
