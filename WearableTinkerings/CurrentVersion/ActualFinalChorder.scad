switchWidth = 13.9;
switchHeight = 13.9;
switchThickness = 11;



featherHoleRadius = 1;

//below are the variables used to help keep development at least semi-parametric *NOTE that the measurements are specific to my physiology
//distance across the back of the hand *when looking at your hand it goes from left to right/right to left
handWidth = 82;

//this is the distance from the bones of the wrist to below the knuckles * NOTE does not actually start at the wrist bones and instead is on the back of the hand
handHeight = 40;
//this is the height of the hand(from ground to ceiling) when palm down/up
handThickness = 38;
//meh some arbitrary value I used for something... probably 
bracketQuantity = 93;


//this is part of the iterative module scheme that I devised to get a perfectly symmetrical thumb configuraton this is only the first half
module thalfSockets(){
     cube([switchWidth+.2, switchHeight+.2, switchThickness],true);
     translate([switchWidth *1.5, -2,0]){ rotate([0,0,-13]){
	       cube([switchWidth+.2, switchHeight+.2, switchThickness],true);     
	  }
     }
}

//this is the "footprint" of where the thumb switches will reside.
module thumbSockets(){
     union(){
	  thalfSockets();
	  mirror([1,0,0]) thalfSockets();
     }
}

//the thumbplate module below was templating tool I designed to test the fitting and placement of the switches without wasting material as it is only 3mm tall 
module thumbPlate(){
     intersection(){
	  difference(){
	       cube([65, 30, 3], true);
	       thumbSockets();
	  }
	  translate([0,-4,0]){
	       rotate([0,0,90]){ 
		    scale([1.2,2.75,1]){
			 cylinder(r = 13.5, h =4, center = true);
		    }
	       }
	  }
     }
}
//part of my hand loop building process these should scale properly with updated measurements at the top of the program
module connectLoopPos(){
     intersection(){
	  cube([handWidth, handHeight+4, handThickness+6],true); 
	  rotate([90,0,0]){ 
	       scale([handWidth/handThickness,1,1.3]){ 
		    cylinder(h = handHeight, d = handThickness, center = true, $fn = 60);
	       }
	  }
     }
}
//etc
module connectLoopNeg(){
     
     translate([0, -20, 0]){
	  difference(){
	       scale([1.12, 1, 1.2]) connectLoopPos();
	       scale([1,3.1,1]) connectLoopPos();
       translate([7,0.1,-(handThickness/2)]){
//		    cube([handWidth*.7,56,handThickness], true);
		    
		    }
	  }
     }
}	  

//finger socket modules
module fingerSocketsPos(){
     thumbSockets();
     translate([-45,-20, 0]) rotate([0,0,12]) cube([switchWidth, switchHeight, switchThickness],true);
}

module featherFootprint(){
     mirror([0,0,1])
	    union(){
		        
			         scale([1.3,1.3,1]){
				       cube([.9*25.4,2*25.4,5],true);
				           }
				     
				     translate([0,0,2.5]){
					   scale([1.2,1.2,1]){
						      cube([.9*25.4,2*25.4,5],true);
						       }
					       }

				         translate([-14.5,0,-1]){
					       cube([12,15,1.5], true);
					           }
					     
					     translate([0,-30,-1]){
						   cube([12,8,8],true);
						       }
					         mirror([0,1,0])
						      translate([(.46*25.4),25.4-(.42*25.4),-1]){
						       cube([17,10,10],true);
						           }
						        }
		 // featherPosts();
			
	      rotate([0,90,0]){
		          scale([1,1.95,1]){
			  //         cylinder(r = ( 1.3* ((.9*25.4)/2)), h = (1.3*(2*25.4)), center = true);
				          }
			    }
     
}


//this is the module for the receiving body for the switches that the index through pinky fingers rest
module CyberDiskF(){
     difference(){
     scale([1.3,.55,.80]) sphere(handHeight);
     translate([-70,-50,.80]) cube(135);
          translate([-70,-50,-148]) cube(135);
     }
}
//this one is for the thumbs
module CyberDiskT(){
   difference(){
    translate([0,0,-1.52]) scale([1.5,1,1]) cylinder(h=switchHeight,d=48,center=true);
    translate ([0,8,0])  thumbSockets();
    translate([-50,-106,-50]) cube([100,100,100]);
    translate([-15,6,-5]) rotate([0,90,0]) cylinder(h=30,d=6);
    translate([14,38,-18])  rotate([-45,-14,-5]) fingerSocketsPos();
             translate([20,-12,22]) rotate([-180,-65,55])  cylinder(h=60,d=4);
}
}
//another module  this one is the *complete loop module that describes all of the intricacies.
//lots of holes punched into the design for a future cover mechanism I plan to develop *will be held to the main body with mechanical-elastic force
module connectLoopThumb(){
     difference(){
	  connectLoopNeg();
	  translate([47,-28,-6]) rotate([90,0,-45]) cylinder(h = 70, d = 32, center = true);
	   translate([47,-28,-13]) rotate([90,0,-45]) cylinder(h = 70, d = 32, center = true);
	       translate([-40,-4,0]) cylinder(h=200,d=4,center = true);
	  mirror(0,1,0) translate([-40,-4,0]) cylinder(h=200,d=4,center = true);    
	  mirror(0,1,0) translate([-38,-38,0]) cylinder(h=200,d=4,center = true);
	  translate([-40,-38,0]) cylinder(h=200,d=4,center = true);
	  mirror([0,0,0]) translate([-15,-20,23]) rotate([10,0,-90]) featherFootprint();
	  //Core of the radial mount
translate([28,-14,-20]) rotate([-102,20,0]) cylinder(h=80,d=4);
}





//two separate "mounting brackets" these essentially provide the support structure necessary for a 2part design
module BraceMounts(){
 
    //Ulnal Side differences
     difference(){
     translate([-46,-44,0]) rotate([-115,0,0]) scale([1,1.5,1]) cylinder(h=89,d=8);
        translate([-46,-44,0]) rotate([-115,0,0]) cylinder(h=92,d=4);
		  // translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
	
//radial side
//translate([28,-14,-20]) rotate([-102,20,0]) cylinder(h=80,d=8);
}


//Everything below this is what is being actively rendered by the openSCAD program

     // end of above difference
     	  translate([-13,-22,16]){
	       rotate([-194,0,90]){
		    translate([(0.45*25.4),-(0.9*25.4),-4]){cylinder(h = 8 ,r = featherHoleRadius, center = true,$fn = 20);}
		    //bottom left
		    translate([-(0.25*25.4),-(0.9*25.4),-4]){cylinder(h = 8 ,r = featherHoleRadius, center = true,$fn = 20);}
		    //top right
		    translate([(0.45*25.4),(0.9*25.4),0]){cylinder(h = 6 ,r = featherHoleRadius, center = true,$fn = 20);}
		    //top left
		    translate([-(0.25*25.4),(0.9*25.4),0]){cylinder(h = 6 ,r = featherHoleRadius, center = true,$fn = 20);}
	       }
	  }


}


	difference(){

	translate([28,-14,-20]) rotate([-104,20,0]) scale([1,1.5,1]) cylinder(h=75,d=8);
//Core of the radial mount
translate([28,-14,-20]) rotate([-102,20,0]) cylinder(h=80,d=4);
   translate([44,10,-15]) rotate([0,125,0]) thumbSockets();
   	     	translate([14,43,-25.5])  rotate([-45,-14,3]) fingerSocketsPos();
		//translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
}






//CYBERDISK F DIFF

difference(){
	translate([-3,40, -21])  rotate([-46,-6,11]) CyberDiskF();
	translate([14,43,-25.5])  rotate([-45,-14,3]) fingerSocketsPos();
	//cascade transformations are translate(0,5,-10) rotate(0,0,8)
	    	
      translate([12,10,-20]) rotate([-46,-10,11])  scale([3.5,1.5,.75]) cylinder(h = handHeight, d =20 );

translate([35,22,-12]) rotate([90,90,30]) cylinder(h=20,d=5,center=true);
       translate([-35,30,-25]) rotate([0,90,10]) cylinder(h=70, d=5);

       //Core excavation for the ulnal side bracemount
              translate([-46,-42,0]) rotate([-115,0,0]) cylinder(h=92,d=4);
	           translate([48,-9,0]) rotate([-110,20,0])  cylinder(h=62,d=4);
		          translate([20,-12,22]) rotate([-180,-65,55])  cylinder(h=60,d=4);
			  //Core of the radial mount
translate([28,-14,-20]) rotate([-102,20,0]) cylinder(h=80,d=4);
//	    translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
//translate ([-55,-92,-50]) rotate([0,0,11]) cube([150,100,100]);

}
}


//CYBERDISK T DIFF
difference(){
	translate([44,2,-15]) rotate([0,125,0]) CyberDiskT();

	     translate([40,0,-12]) rotate([90,90,-50]) cylinder(h=20,d=5,center=true);
        translate([48,-9,0]) rotate([-110,20,0])  cylinder(h=62,d=4);
	//for render one
//		    translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
	//opposite of above
//	translate ([-55,10,-50]) cube([150,100,100]);

       			      //Core of the radial mount
       translate([28,-14,-20]) rotate([-102,20,0]) cylinder(h=80,d=4);
			//String/cover hole top right
	       mirror(0,1,0)  translate([-40,-4,0]) cylinder(h=40,d=4,center = true);    
	     //  	    translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
//	     translate ([-55,-92,-50]) rotate([0,0,11]) cube([150,100,100]);
}

difference(){
connectLoopThumb();
//!CyberDiskF();
//	    translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
//translate ([-55,10,-50]) cube([150,100,100]);
       //Core excavation for the ulnal side bracemount
              translate([-46,-44,0]) rotate([-115,0,0]) cylinder(h=94,d=4);
//	      	    translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
//translate ([-55,-92,-50]) rotate([0,0,11]) cube([150,100,100]);
}

//difference(){
BraceMounts();
//	    translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
//translate ([-55,10,-50]) cube([150,100,100]);
//translate ([-55,-92,-50]) rotate([0,0,11]) cube([150,100,100]);

//}

//hint* you totally have to go into each module above and make sure to uncomment/add the proper differences as posted below
//uncomment to remove the farthest piece
//	    translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);

//uncomment to remove the base pieces
//translate ([-55,-92,-50]) rotate([0,0,11]) cube([150,100,100]);


difference(){
translate([44,23,-12]) rotate([-105,0,9]) difference(){
		    cylinder(h=16, d=10);
		    cylinder(h=18,d=5);
		    	
}
		translate([14,43,-25.5])  rotate([-45,-14,3]) fingerSocketsPos();
//			    //translate ([-55,10,-50]) rotate([0,0,11]) cube([150,100,100]);
			    //translate ([-55,-92,-50]) rotate([0,0,11]) cube([150,100,100]);
}
