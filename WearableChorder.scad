switchWidth = 13.9;
switchHeight = 13.9;
switchThickness = 11;

handWidth = 82;
handHeight = 40;
handThickness = 38;

bracketQuantity = 93;

featherHoleRadius = 1;



module thalfSockets(){
     cube([switchWidth, switchHeight, switchThickness],true);
     translate([switchWidth *1.5, -2,0]){ rotate([0,0,-13]){
	       cube([switchWidth, switchHeight, switchThickness],true);     
	  }
     }
}

module thumbSockets(){
     union(){
	  thalfSockets();
	  mirror([1,0,0]) thalfSockets();
     }
}

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

module connectLoopNeg(){
     translate([0, -20, 0]){
	  difference(){
	       scale([1.13, 1, 1.2]) connectLoopPos();
	       scale([1,3.1,1]) connectLoopPos();
	       translate([7,0.1,-(handThickness/2)]){
		    cube([handWidth*.7,56,handThickness], true);
		    }
	  }
     }
}

module fingerSocketsPos(){
     thumbSockets();
     translate([-45,-20, 0]) rotate([0,0,12]) cube([switchWidth, switchHeight, switchThickness],true);
}

module featherPosts(){
     //when looking at board with the adafruit logo on bottom and usb port closest to yourself
     
     //bottom right
     translate([(0.45*25.4),-(0.9*25.4),-2]){cylinder(h = 4 ,r = featherHoleRadius, center = true);}
     //bottom left
     translate([-(0.45*25.4),-(0.9*25.4),-2]){cylinder(h = 4 ,r = featherHoleRadius, center = true);}
     //top right
     translate([(0.45*25.4),(0.9*25.4),-2]){cylinder(h = 4 ,r = featherHoleRadius, center = true);}
     //top left
     translate([-(0.45*25.4),(0.9*25.4),-2]){cylinder(h = 4 ,r = featherHoleRadius, center = true);}
}

module featherFootprint(){
     intersection(){  
	    union(){
		        difference(){
			         scale([1.3,1.3,1]){
				       cube([.9*25.4,2*25.4,13],true);
				           }
				     
				     translate([0,0,2.5]){
					   scale([1.2,1.2,1]){
						      cube([.9*25.4,2*25.4,13],true);
						       }
					       }

				         translate([14.5,0,-1]){
					       cube([2,13,1.5], true);
					           }
					     
					     translate([0,-30,-1]){
						   cube([12,8,8],true);
						       }
					         
					         translate([-(.46*25.4),25.4-(.42*25.4),-1]){
						       cube([10,10,10],true);
						           }
						        }
			  featherPosts();
			    }
	      rotate([0,90,0]){
		          scale([1,1.95,1]){
			           cylinder(r = ( 1.3* ((.9*25.4)/2)), h = (1.3*(2*25.4)), center = true);
				          }
			    }
     }
}

module batteryFootprint(){
     difference(){
	  translate([-2,2,-1]) scale([1.1,1.1,1.7]) cube([29,36,4.75]);
	  cube([29,36,4.75]);
	  
	  }
}

module fingerPlate1(){
     	  union(){
	       intersection(){
		    difference(){
			 translate([-12,-10,0]){
			      cube([90,45,3] , true );
			 }
			 //fingerSocketsPos();
		    }
		    translate([-38,-13,0]){ 
			 rotate([0,0,-50]) {
			      scale([1,1.75,1]) { 
				   cylinder(r = 13.5, h =4, center = true);
			      }
			 }
		    }
	       }
	       intersection(){
		    difference(){
			 translate([-12,-10,0]){ 
			      cube([90,45,3] , true );
			 }
			 //fingerSocketsPos();
		    }
		    translate([-4.5,-5,0]){ 
			 rotate([0,0,97]){
			      scale([1.3,2.95,1]){
				   {
					cylinder(r = 13.5, h =3, center = true);
				   }	   
			      }
			 }
			 
		    }
	       }
	  }
}

module fingerPlate0(){
     	  union(){
	       intersection(){
		    difference(){
			 translate([-12,-10,0]){
			      cube([90,45,3] , true );
			 }
			 fingerSocketsPos();
		    }
		    translate([-38,-13,0]){ 
			 rotate([0,0,-50]) {
			      scale([1,1.75,1]) { 
				   cylinder(r = 13.5, h =4, center = true);
			      }
			 }
		    }
	       }
	       intersection(){
		    difference(){
			 translate([-12,-10,0]){ 
			      cube([90,45,3] , true );
			 }
			 fingerSocketsPos();
		    }
		    translate([-4.5,-5,0]){ 
			 rotate([0,0,97]){
			      scale([1.3,2.95,1]){
				   {
					cylinder(r = 13.5, h =3, center = true);
				   }	   
			      }
			 }
			 
		    }
	       }
	  }
}

module fingerBucket(){
     union(){
	  scale([1,1,4]){ 
	       fingerPlate();
	       }
	  translate([-38,-13,-4.5]){
	       rotate([0,0,-50]){ 
		    scale([1,1.75,1]){
			 {
			      cylinder(r = 13.5, h =3, center = true);
			 }
		    }
	       }
	  }
	  translate([30,8.3,0]){ 
	       rotate([0,0,97]){ 
		    scale([1.3,2.95,1]){ 
			 cylinder(r = 13.5, h =3, center = true);
		    }
	       }
	  }
     }
}


module fingerBucketR1(){
     translate([0,0,5]){    
	  scale([1,1,3]){
	       union(){
		    intersection(){
			 difference(){
			      translate([-12,-10,0]){
				   cube([90,45,3] , true );
			      }
			      fingerSocketsPos();
			 }
			 translate([-38,-13,0]){ 
			      rotate([0,0,-50]) {
				   scale([1,1.75,1]) { 
					cylinder(r = 13.5, h =4, center = true);
				   }
			      }
			 }
		    }
		    intersection(){
			 difference(){
			      translate([-12,-10,0]){ 
				   cube([90,45,3] , true );
			      }
			      fingerSocketsPos();
			 }
			 translate([-4.5,-5,0]){ 
			      rotate([0,0,97]){
				   scale([1.3,2.95,1]){
					{
					     cylinder(r = 13.5, h =3, center = true);
					}	   
				   }
			      }
			      
			 }
		    }
	       }
	  }
     }
}

module fingerBucketR0(){
     union(){
	  difference(){
	       fingerBucketR1();
	       translate([-15,-8,3]){
		    rotate([0,90,20]){
			 cylinder(r=2,h=75,$fn=8,center = true);
		    }
	       }
	  }
	  fingerPlate1();
     }
}

module thumbBucket(){
     union(){
	  scale([1,1,4]){
	       thumbPlate();
	  }
	  translate([0,-4,-5]){
	       intersection(){
		    rotate([0,0,90]){ 
			 scale([1.2,2.75,1]){
			      cylinder(r = 13.5, h =4, center = true);
			 }
		    }
		    cube([65, 22, 3], true);
	       }
	  }
     }
}

module thumbBucketR(){
     difference(){
	  thumbBucket();
	  translate([0,0,-2]){
	       rotate([0,90,0]){
		    cylinder(r=3, h=35, center = true);
	       }
	  }
     }
}


module supportL(){
     cube(5);
}

module supportR(){
}


module mountingBrackets(bracketHeight){
     for(i = [0:bracketQuantity]){
	       difference(){
		    cube([10,i,8], true);
		    rotate([90,0,0]){
			 cylinder(r=2,h=i+2,center = true);
			 {
			 }
		    }
	       }
     } 
}


//MODULE FOR LEFT ARM ULNAL SIDE CONNECTION LOOP



//handbrace w/Thumb hole
module connectLoopR0(){
     difference(){
	  translate([0,-55,0]){
	      scale([1,1,1.2]){ 
		   connectLoopNeg();
	      }
	  }
	  translate([55,-70,-15]){
	       rotate([80,0,-35]){
		    cylinder(h=75,d=34,center=true);
	       }
	  }
     }
}

module wireRoute1(){     difference(){
	  cylinder(r=3.4, h=20, center= true);
	  cylinder(h = 50, r = 3, center = true);
     }
}

module wireRoute0(){
	  cylinder(h = 20, r = 3, center = true);
     
}
//RENDERS
// FINAL RENDER
//this final render will be specially structured as such 
//union(){..translate(){moduleName(); .. translate(){moduleName();}.... repeat as needed... }}

module finalHandBase(){
     union(){
	  translate([0,0,0]){connectLoopR0();}
	  
	  translate([20,-80,29]){rotate([15,0,90]){featherFootprint();}}
	  translate([-15,-95,30]){rotate([-30,1,90]){batteryFootprint();}}
	  
	  difference(){
	       translate([12,17.5,-22]){ rotate([-20,-8,3]){fingerBucketR0();}}
	       translate([43,-20,-10]){ rotate([80,15,0]){ scale([1,1,3.9]){wireRoute0();}}}
	      // translate([0,27,0]){ rotate([0,0,-7]){cube([150,150,150],true);}}
	  }
	  difference(){
	       translate([40,(23+(-55)),-25]){ rotate([-20,127,-25]){ thumbBucketR();}}
	       translate([45,-22,-10]){ rotate([80,15,0]){ scale([1,1,3.9]){wireRoute0();}}}
	       //translate([0,27,0]){ rotate([0,0,-7]){cube([150,150,150],true);}}
	  }
	  difference(){
	       translate([43,-18,-10]){ rotate([80,15,0]){ scale([1,1,3.9]){wireRoute1();}}}
	       translate([44,-20,-10]){ rotate([80,15,0]){ scale([1.1,1,3.9]){wireRoute0();}}}
	       //translate([0,27,0]){ rotate([0,0,-7]){cube([150,150,150],true);}}
	  }
	  difference(){
	       translate([49,-20,-4]){ rotate([-14,-2,0]){mountingBrackets();}}
	      // translate([0,27,0]){ rotate([0,0,-7]){cube([150,150,150],true);}}
	  }
	  difference(){
	       translate([-47,-49,-11]){ rotate([-15,-10,2.5]){mountingBrackets();}}
	    //   translate([0,27,0]){ rotate([0,0,-7]){cube([150,150,150],true);}}
	  }
     
     }
}
difference(){
     rotate([90,0,0]){
	  translate([0,95,20]){
	       finalHandBase();
	  }
     }
     
     translate([-55,-80,80]){
//	  #cube([120,120,120]);
     }
     translate([-55,-80,40]){
//	  #cube([125,125,40]);
     }
     translate([-55,-80,-80]){
//	  #cube([120,120,120]);
     }
}
/*
module knifeSlice0(){
     difference(){
	  connectLoopR0();
	  translate([0,-13,-50]){
	       cube([150,150,150],true);
	  }
     }
}

module knifeSlice1(){
     difference(){connectLoopR0();
	  translate([-50,-130,-25]) cube([150,50,50]);
     }
}

knifeSlice0();
*/

