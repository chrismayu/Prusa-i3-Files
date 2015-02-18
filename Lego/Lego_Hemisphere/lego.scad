/* 
   Parametric Lego Brick
   Andrew Sweet, 2014
   Feel free to use my design,
	credit is appreciated where appropriate

   If you choose to alter this code, please keep this
	top comment in all further iterations :)

   Modified into a module (with some small changes) by John Stäck
*/


module LegoBrick(
	rows=4,       //Number of pegs in X direction
	cols=2,       //Number of pegs in Y direction
	height=1,     //Normal bricks are 1, "low bricks" are 1/3
	brickScale=1, //Sizing factor. Use powers of 2 for compatibility
	pegs=true,    //If pegs on top are to be included
	fn=72         //"Curve fidelity", used as $fn for cylinders
)
{


/* Lego Dimensions courtesy of:

http://www.robertcailliau.eu/Lego/Dimensions/zMeasurements-en.xhtml

and

http://static2.wikia.nocookie.net/__cb20130331204917/legomessageboards/images/3/3c/Lego_brick_2x4.png

*/

	// Brick Dimensions
	brickHeightDim = 9.6; // toBeScaled

	brickUnit = 8.0;
	
	dWidth = 0.2;
	brickWidth = ((brickUnit * rows) - dWidth) * brickScale;
	brickDepth = ((brickUnit * cols)  - dWidth) * brickScale;
	
	brickHeight = (height * brickHeightDim) * brickScale;

	shellThicknessTop = 1.0 * brickScale;
	shellThicknessSides = 1.2 * brickScale;
	
	// UnderPeg
	uPegMaxRadius = 6.51 * brickScale/2;
	uPegMinRadius = 4.8 * brickScale/2;
	uPegOffset    = (brickUnit - 0.1) * brickScale;
	uPegHeight    = brickHeight - shellThicknessTop;
	
	// Pegs
	tempDistance = 2.4 + 1.6; // To be scaled
	pegOffset    = (tempDistance - 0.1) * brickScale;
	tempRadius   = 4.8 / 2.0;
	pegDistance  = brickUnit * brickScale;
	
	pegRadius   = tempRadius * brickScale;
	pegHeight   = 1.8 * brickScale;
	
	// KnobHolders (small rectangular protrusions underneath)
	khWidth  = 0.6 * brickScale;
	khDepth  = 0.3 * brickScale;
	khOffset = shellThicknessSides + khDepth + pegRadius+ (0.1 * brickScale);


	// Create the Brick
	difference()
	{
	cube([brickWidth, brickDepth, brickHeight]);
	
	translate([shellThicknessSides, 
				shellThicknessSides,
				-1])
	cube([brickWidth - (shellThicknessSides * 2), 
			brickDepth - (shellThicknessSides * 2), 
			brickHeight - shellThicknessTop + 1]);
	}
	
	if (rows > 1 && cols > 1){
	/* Add Interior */
	for (row = [1:(rows - 1)]){
		for (col = [1:(cols - 1)]){

			// Cylinders
			translate([uPegOffset + (pegDistance * (row - 1)),
				   uPegOffset + (pegDistance * (col-1)),
				   0])	
			difference()
			{
				cylinder(h=uPegHeight, 
					r1=uPegMaxRadius, 
					r2=uPegMaxRadius,
					$fn=fn);
				translate([0,0,-1])	
				cylinder(h=uPegHeight+0.999, 
					r1=uPegMinRadius, 
					r2=uPegMinRadius,
					$fn=fn);
			}
		}
	}
	} else {
		assign (rad = (pegDistance - (pegRadius * 2))/2 - (0.1 * brickScale))
	    {
			if (rows > 1){

				for (row = [1:(rows - 1)]){
					translate(
						[uPegOffset + (pegDistance * (row - 1)),
					  	(brickUnit * brickScale)/2,
					  	0])	
					cylinder(h=uPegHeight, 
					 	r1=rad, 
					 	r2=rad,
						 $fn=fn);
				}

			} else if (cols > 1){
				for (col = [1:(cols - 1)]){
					translate(
						[(brickUnit * brickScale)/2,
					uPegOffset + (pegDistance * (col - 1)),
					  	0])	
					cylinder(h=uPegHeight, 
					 	r1=rad, 
					 	r2=rad,
						$fn=fn);
				}
			}
		}
	}

	// KnobHolders (underneath)
	if (rows > 1 && cols > 1){
		for (row = [0:(rows - 1)]){
			translate([khOffset + (pegDistance * row), shellThicknessSides, 0])	
				cube([khWidth, khDepth, uPegHeight]);

			translate([khOffset + (pegDistance * row),
				(cols * (brickUnit * brickScale)) - shellThicknessSides - khDepth - (0.2 * brickScale), 0])	
			cube([khWidth, khDepth, uPegHeight]);
		}

		for (col = [0:(cols - 1)]){
			translate([shellThicknessSides,
				khOffset + (pegDistance * col),
				0])	
			cube([khDepth, khWidth, uPegHeight]);

			translate([(rows * (brickUnit * brickScale)) - shellThicknessSides - khDepth - (0.2 * brickScale), khOffset + (pegDistance * col), 0])	
			cube([khDepth, khWidth, uPegHeight]);
		}
	}

	// Create the Pegs
	if(pegs) for (row = [0:(rows - 1)]){
		for (col = [0:(cols - 1)]){
			translate([pegOffset + (pegDistance * row),
					   pegOffset + (pegDistance * col),
					   brickHeight])	
			cylinder(h=pegHeight, 
				r1=pegRadius, 
				r2=pegRadius,
				$fn=fn);
		}
	}

}


//Usage examples:

LegoBrick();
translate([0,24,0]) LegoBrick(rows=6,cols=1,pegs=false,height=1/3);
translate([0,42,0]) LegoBrick(rows=2,cols=2,brickScale=2);

