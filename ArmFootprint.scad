/* A note from the creator. Be prepared to read a bunch of stuff before you get to anything special.. namely this. Let's get to it. This will be the first of a series of attempts to make  robust, full featured, wearable septambic keyer. I fully intend to use this for the purpse of wearable computing. 
The technology I will be using for fabrication are 
1. 3d printing
2. DIY circuit construction (populating a pcb and soldering it.)
3. possibly others? To Be Determined

My idea for this is to be something I can put into and take out of a storage mode with one hand (I have a goal of near instant interactional speed in mind.)

First I will get the measurements of my forearm and use it to create templates. After that is finished and I am satisfied with the results I will start drafting the rotational mechanism that will be placed around or near the two protruding bones in the wrist. finally I will draft the actual key-switch assembly that will serve as the part I actually interact with.

Bonus goals? 
embed the computer and battery in the bracer itself (small port for the 3.5mm Auxillary cable to connect.)
include a removable cover to protect the computer's headers (enabling mobile development of hardware gizmos) yes gizmos is the technical term.(probably). 
*/

//NOTE all measurements are in millimeters.

//This will be the starting point for my cyborg wrist apparatus configuration. Multiple values will be used.

//The values are as follows

//the offset is located after the "WristBoneFootprintX" where X is the current offset.

//Offset 1 will be 50mm closer to my elbow.
//Offset 2 will be 100mm closer to my elbow. (note this is about halfway to my elbow. a comfortale distance that I am also comfortable printing for)

//The first prints will be templates no more than 2 mm thick.
//"rapid prototyping" at it's finest.

//Variable Legend below. (as well as their declarations).
//W = Wrist; B = Bone; O = Offset; W/H = Width/Height (respectively) 

//Please note these variables are unique to myself and will be very different for each individual. I also tried to allow for a bit of slop with the measurements for comfort (this is my first attempt at anything like this).
use </home/hylianhalo/EXPORT/Backup/Resources/Code/Physibles/Replicated/Projects/AxLatches.scad>

WBO0W = 53;
WBO0H = 40;
WBO1W = 55;
WBO1H = 52;
WBO2W = 65;
WBO2H = 68;
echo(WBO0W/WBO0H);
echo(WBO1W/WBO1H);
echo(WBO2W/WBO2H);

//Below you'll see some guess work on the actual cross-section dimensions of my arm.  Basically I took the  approach of having the height of the forearm (when palm is facing the ground) and divided it by the width to find what number to scale the (currently flattened) sphere by (using the x vector)

module WristBoneFootprint0(){
     scale(v = [WBO0W/WBO0H,0.10,1]){
     sphere(d = WBO0H);	  }
     }

module WristBoneFootprint1(){
     scale(v = [WBO1W/WBO1H,0.10,1]){
     sphere(d = WBO1H);	  }
     }

module WristBoneFootprint2(){
     scale(v = [WBO2W/WBO2H,0.10,1]){
     sphere(d = WBO2H);	  }
     }

//below are the footprints I have attempted to create spaced 50mm apart (as per my predetermined measurement scheme

/*
translate([0,100,0]){
WristBoneFootprint0();
}

translate([0,50,0]){
WristBoneFootprint1();
}

translate([0,0,0]){
WristBoneFootprint2();
}
*/


// I think it looks good in it's current revision.
//my next goal is to form the entire bracer (I will probably use a union of two cylinders, stacking them vertically to create a seamless footprint of the forearm section I intend to  play with.

//I will be leaving this as is until I print out and test some templates to see if it even fits my arm

//below is some test placement of a rough latch fooprint I devised. 
module WB0() {
     scale(v = [WBO0W/WBO0H,1,1]){
	  cylinder(h = 50, d = WBO0H);
	  }
}

//Taking a crack at union between a cylinder that has the wide base of WB1 and coming up to join WB0
module WB1(){
     scale(v = [WBO1W/WBO1H,1,1]){
	  cylinder(h = 50, d1 = WBO0H, d2 = WBO1H);
     }
}

module WB2(){
     scale(v = [WBO2W/WBO2H,1,1]){
	       cylinder(h = 50, d1 = WBO1H * 1.10, d2 = WBO2H);
	       }
}
/*
translate([100,100,0]) rotate([90,0,0]){
     WB0();
}

translate([100,50,0]) rotate([90,0,0]){
     WB1();
}
*/
module FP(){
union(){
     translate([0,100,0]) rotate([90,0,0]){
	  union(){
	       WB0();
	       WB1();
	  }
     }
     translate([0,50,0]) rotate([90,0,0]){
	  WB2();
     }
}
}

module FP1(){
     union(){
	  scale([1.15,1,1]){
	       translate([0,96,0]){
		    Screwceiver0();
	       }
	       
	       translate([0,50,0]){
		    Screwceiver1();
	       }
	       translate([0,4,0]){
		    Screwceiver2();
	       }
	  }
     }
     scale([1.15,1,1.15]){
	  FP();
     }
}








//each slice is going to need a hole with diameter of 4mm. Depth of 9mm.
//each side needs a width of > 6 mm 8 is appealing.






//Below is a set of 3 modules that represent the temporary fastening bits on the edges of the print

//the different numbers at the end of each name again indicates it's offset from the wrist section
Screwceiver0D = 69;
Screwceiver1D = 71;
Screwceiver2D = 81;
module Screwceiver0(){
     difference(){
	  rotate([0,0,90]){
	       cube([8,Screwceiver0D,9], true);
	  }
	  holes0();
     }
}

module holes0(){
     translate([30.5,0,-4.5]){
	  cylinder(h=9, d=4);
     }
     translate([-30.5,0,-4.5]){
	  cylinder(h=9, d=4);
     }
}


module Screwceiver1(){
     difference(){
	  rotate([0,0,90]){
	       cube([8,Screwceiver1D,9], true);
	  }
	  holes1();
     }
}

module holes1(){
     translate([31.5,0,-4.5]){
	  cylinder(h=9, d=4);
     }
     translate([-31.5,0,-4.5]){
	  cylinder(h=9, d=4);
     }
}


module Screwceiver2(){
     difference(){
	  rotate([0,0,90]){
	       cube([8,Screwceiver2D,9], true);
	  }
	  holes2();
     }
}

module holes2(){
     translate([36.5,0,-4.5]){
	  cylinder(h=9, d=4);
     }
     translate([-36.5,0,-4.5]){
	  cylinder(h=9, d=4);
     }
}

//Finally the wrist arc template is completed below.
module WristArc0(){
     difference(){
	  FP1();
	  FP();
//Cube to slice the whole object in two, bisection	  
translate([-150,-1,0]){
  cube([300,300,300]);
  }

//The order is now inverted before I was working from the elbow out well I'll be printing slices of this object so it makes sense to change
//the one at the bottom will be used for WristArc0

  translate([-40,8,-40]){
  cube([80,38,80]);
  }
  
  translate([-40,54,-40]){
  cube([80,38,80]);
  }

}
}


//The above was a good place to stop however it is a nightmare to print.
//rotate([0,180,0]) { FinalWristArc();}
//Again if this sizes well on my arm I will be printing the module without the screw mounts and instead with sizings for a set of 3 latches and some hinges.


//TEST RENDER
//DESIRED RESULT ACHIEVED
//MODULE CREATION . . .
module HalfTorus (){
     translate([0,0,100]){
	  rotate([-90,0,180]){
	       WristArc0();
	  }
     }
} 

//Slicing the half torus shape by differencing cubes.

//LOL EASY REPLICATION FOR BUILD PLATE SHIZ
module SledgeHammer(){
translate ([0,97,-92]){HalfTorus();}
translate ([0,122,-92]){HalfTorus();}

translate ([0,72,-46]){HalfTorus();}
translate ([0,47,-46]){HalfTorus();}

translate ([0,23,0]){HalfTorus();}
translate ([0,0,0]){HalfTorus();}
}

difference(){
     SledgeHammer();
     translate([-75,0,-150]) cube([150,170,150]);
     translate([-75,0,8]) cube([150,120,160]);
}
