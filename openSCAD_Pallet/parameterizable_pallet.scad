scaleFactor = 1/48;

palletLength			= 1200;
palletWidth				= 1000;

plankWidth            = 150;
plankHeight           = 22;
numberOfPlanks        = 5;
plankLength           = palletWidth;
distanceBetweenPlanks = (palletLength - (plankWidth*numberOfPlanks))/(numberOfPlanks-1);

supportBeamWidth = 50;
supportBeamHeight = 100;
numberOfSupportBeams = 3;
supportBeamLength = (numberOfPlanks*plankWidth) + ((numberOfPlanks-1)*distanceBetweenPlanks);
distanceBetweenBeams = (palletWidth - (numberOfSupportBeams*supportBeamWidth))/(numberOfSupportBeams-1);


module plank(scale, offsety)
{
	translate([(-plankLength/2)*scale,offsety*scale,0*scale])
		cube([plankLength*scale,plankWidth*scale,plankHeight*scale]);
}

module beam(scale, offsetx)
{
	translate([offsetx*scale,0*scale,plankHeight*scale])
		cube([supportBeamWidth*scale,supportBeamLength*scale,supportBeamHeight*scale]);
}

module pallet()
{
	//determine how far the model needs to be translated (in Y) to align with the origin in x-y
	palletTranslateValue = -((numberOfPlanks*plankWidth)/2)*scaleFactor +
                          -(((numberOfPlanks-1)*distanceBetweenPlanks)/2)*scaleFactor;


	beamTranslateValue = -((numberOfSupportBeams*supportBeamWidth)/2)*scaleFactor +
                        -(((numberOfSupportBeams-1)*distanceBetweenBeams)/2)*scaleFactor;

	translate([0,palletTranslateValue,0])
	{
		//generate "top" planks (on bottom of model)
		for(plankCount = [0 : numberOfPlanks-1])
		{
			plank(scaleFactor, distanceBetweenPlanks*plankCount + plankWidth*plankCount);
		}

		translate([beamTranslateValue, 0, 0])
		{
			//generate support beams
			for(supportBeamCount = [0 : numberOfSupportBeams-1])
			{
				beam(scaleFactor, supportBeamCount*(distanceBetweenBeams + supportBeamWidth));
			}
		}
	}
}

pallet();