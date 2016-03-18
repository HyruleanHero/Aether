DiameterEndEdge = 18;
DiameterEndInner = 14;

//I am thinking of implementing a spiral system to aid in assembly of some pieces.
module testCore(){
rotate([0,180,0]){
	union(){

		translate([0,0,-4]) cylinder(h = 46, d = DiameterEndInner, center = true);

		translate([0,0,36]) cylinder(h = 46, d1 = DiameterEndEdge+3,d2 = DiameterEndEdge +.05, center = true);

		}
}
}
testCore();
translate([30, 0, 0]){testCore();}