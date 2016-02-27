
//Necessary variables for basic replication.
//height variable is increased y 1 mm for clean intersection.
height = 29;

radius  = 5.25;      
module MainBody(){
cylinder(h = height, r = radius);
}

module ActuatorReceiver(){
// we must translate the entire module on the z axis for propper intersection later.
     translate ([0,0,23]){
	  cylinder(h = 6 , r1 = 8.5, r2 = 7.5, $fn = 240);
     }
}

module redButton(){
     translate([0,0,29]) color("red")  cylinder(h = 3.9, r = 6);
}
//ActuatorReceiver();
/*BasicActuatorReceiver();
MainBody();
*/
//I am going to do a union of the main body and the actuator reciever
module threads(){
     translate([0,0,13.42])
	  linear_extrude(height = 8.83, center = false, convexity = 10, twist = 2880)
	  translate([5.35, 0, 0])
	  circle(r = 1); 
}

union(){
     MainBody();
     ActuatorReceiver();
     redButton();
     threads();

}



//Toggle switch footprint complete.
