//-----------------------------------------------------------------------------------
//
// i3_y_endstop.scad - Mark Bateman - CC-BY-SA - 17th December 2013
//
 
 
//-----------------------------------------------------------------------------------
//
// variables
//
 
 
//-----------------------------------------------------------------------------------
//
// modules
//

module front_bracket() {

	difference() {
		union() {
			
			// main block
			translate([-4,0,2])
				cube([8,7,40]);
			
			// switch tab
			translate([4,5,19])
				cube([8,2,20]);

			// tab strength
			translate([4,4,19])
				cube([8,1,3]);

			translate([4,4,36])
				cube([8,1,3]);
		}
		
		// skim middle so clamps grip under pressure
		translate([-5,-0.75,12])
			cube([10,1,20]);

		// frame bars
		translate ([-100, 0, 35]) {
			rotate(a=[0,90,0]) {
	
				translate([0,0,0])
					cylinder(h=200, r=4.1, $fn=64);
	
				translate([25,0,0])
					cylinder(h=200, r=5, $fn=64);
			}
		}
	
		// tie strap holes
		translate([5,4,33.25])
			cube([3,4,1.5]);
	
		translate([5,4,23.75])
			cube([3,4,1.5]);
	
		// screw shaft
		translate([0,9,17.5])
			rotate(a=[90,0,0])
			cylinder(h=10, r=1.6, $fn=64);
	
		translate([0,9,27])
			rotate(a=[90,0,0])
			cylinder(h=10, r=1.6, $fn=64);
		
		// screw head
		translate([0,15,17.5])
			rotate(a=[90,0,0])
			cylinder(h=10, r=3.3 , $fn=6);
	
		translate([0,15,27])
			rotate(a=[90,0,0])
			cylinder(h=10, r=3.3 , $fn=6);
	}
}


module rear_bracket() {

	difference() {
			
		// main block
		translate([-4,0,2])
			cube([8,7,40]);
		
		// skim middle so clamps grip under pressure
		translate([-5,-0.75,12])
			cube([10,1,20]);

		// frame bars
		translate ([-100, 0, 35]) {
			rotate(a=[0,90,0]) {
	
				translate([0,0,0])
					cylinder(h=200, r=4.1, $fn=64);
	
				translate([25,0,0])
					cylinder(h=200, r=5, $fn=64);
			}
		}
		
		// screw shaft
		translate([0,9,17.5])
			rotate(a=[90,0,0])
			cylinder(h=10, r=1.6, $fn=64);
	
		translate([0,9,27])
			rotate(a=[90,0,0])
			cylinder(h=10, r=1.6, $fn=64);

		//screw head
		translate([0,15,17.5])
			rotate(a=[90,0,0])
			cylinder(h=10, r=2.9 , $fn=64);
	
		translate([0,15,27])
			rotate(a=[90,0,0])
			cylinder(h=10, r=2.9 , $fn=64);
	}
}


//-----------------------------------------------------------------------------------
//
// main
//

// printing normal
translate([20,-22,7])
	rotate(a=[-90,0,0])
		front_bracket();

translate([7.5,-22,7])
	rotate(a=[-90,0,0])
		rear_bracket();

// printing reverse
translate([-20,-22,7])
	rotate(a=[-90,0,0])
		mirror([1,0,0])
			front_bracket();

translate([-7.5,-22,7])
	rotate(a=[-90,0,0])
		rear_bracket();
