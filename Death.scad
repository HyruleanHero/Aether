foreheadWidth = 130;
//Inter Pupillary Distance
IPD = 45;
EyeholeDiameter = 32;
BreathHoleDiameter = EyeholeDiameter*.66;
//Primary Spike Distance
PSD = 100;
EBW = 52;

difference(){
rotate([180,0,0]){
     difference() {
	  scale([1,1,.5]) sphere(r = (foreheadWidth + 10)/2, h = 60, $fn = 60);
	  scale([1,1,.3]) sphere(r = (foreheadWidth + 10)/2, h = 60, $fn = 60);
	 
	  translate([-75,-75,0]) cube([150,150,70]);

     }
}

translate([0,-18,0])GuidePillars();
translate([0,36,10]) BandMounts();
}

module GuidePillars(IPD){
     translate([-(foreheadWidth)/4,foreheadWidth/8,0]) cylinder(h=200,d=35,center = true);
     translate([(foreheadWidth)/4,foreheadWidth/8,0]) cylinder(h=200,d=35,center = true);
     translate([0,-EyeholeDiameter/4,0]) cylinder(h=200,d=EyeholeDiameter*.8,center =true);
}

module DeathSpikes(PSD){
	mirror([0,0,0]){
		rotate([90,90,0]){
			cylinder(h = PSD, d1 =50, d2 =1, $fn =30);
			translate([0,25,0]){
				scale([1,1,.85]){
						cylinder(h = PSD, d1 =50, d2 = 1, $fn=30);
				}	
			}
		}
	}	
}

module BandMounts(){
	cube([200,EBW,2], center = true);
}

difference(){
translate([0,-45,-3]){


	DeathSpikes(PSD);
	mirror([1,0,0]){

	DeathSpikes(PSD);
	}
}

mirror ([0,0,1]) translate([-75,-168,0]) cube([150,150,70]);
rotate([180,0,0])   scale([1,1,.2]) sphere(r = (foreheadWidth + 10)/2, h = 60, $fn = 60);


}

//GuidePillars();

