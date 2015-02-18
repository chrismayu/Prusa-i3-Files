/*
	Lego Hemisphere
	Steve Medwin 10/18/14

	Need 'Parametric Lego Brick' module by John Stäck which uses work by Andrew Sweet
		To use: put lego.scad in your OpenSCAD libraries folder
		(location varies with OS, but on a Mac it's ~/Documents/OpenSCAD/libraries/) 
*/

use <lego.scad> 
 
// Position the bricks
for (i=[0:3]) {
	translate ([20,0,0]) rotate ([-20,20,90*i])  
	LegoBrick(
		rows=2,       //Number of pegs in X direction
		cols=2,       //Number of pegs in Y direction
		height=1,     //Normal bricks are 1, "low bricks" are 1/3
		brickScale=1, //Sizing factor. Use powers of 2 for compatibility
		pegs=true,    //If pegs on top are to be included
		fn=72         //"Curve fidelity", used as $fn for cylinders
	);
}

// Add the hemisphere
difference() {
	 translate ([20,0,-25]) sphere(30, $fn=120);
	 translate ([-20,-30,-60]) cube([80,60,40]);
}