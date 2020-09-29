// LetterBlock.scad - Basic usage of text() and linear_extrude()

// Module instantiation
translate([(i),0,0]) LetterBlock("J");
i = 25;
 
translate([(i+i),0,0]) LetterBlock("A");
translate([(i+i+i),0,0]) LetterBlock("N");
translate([i+i+i+i,0,0]) LetterBlock("K");
translate([i+i+i+i+i,0,0]) LetterBlock("!");
//MOB NIGGA
translate([0,-25,0]){
translate([0,-i+25,0]) LetterBlock("M");
union(){ color("Green"){ translate([0,-(i),-5]) cylinder(h=45, r= 5);}
translate([0,-(i),0]) LetterBlock("O");
}
translate([0,-(i+25),0]) LetterBlock("B");
translate([0,-(i+50),0]) LetterBlock("!");
}


translate([75,75,0]){
translate([0,-i+25,0]) LetterBlock("P");
translate([0,-(i),0]) LetterBlock("A");
translate([0,-(i+25),0]) LetterBlock("I");
}


//module pain() {
//A TRIANGLE FORMATION STD size A
translate([i+i,5,0])
   color("red") cylinder(h=30,r=5);
translate([i+i,3,0])
   color("red") cylinder(h=30,r=.5);
    
translate([i+i,1,0])
   color("red") cylinder(h=30,r=5);
    
    
//A TRIANGLE FORMATION STD size B
translate([i+i+i,50,0])
   color("red") cylinder(h=30,r=5);
translate([i+i,3,0])
   color("red") cylinder(h=30,r=.5);
    
translate([i+i,1,0])
   color("green") cylinder(h=30,r=.5);
    
    
//}
//}
// Module definition.
// size=30 defines an optional parameter with a default value.
module LetterBlock(letter, size=30) {
    difference() {
        translate([0,0,size/4]) cube([size,size,size/2], center=true);
        translate([0,0,size/6]) {
            // convexity is needed for correct preview
            // since characters can be highly concave
            linear_extrude(height=size, convexity=4)
                text(letter, 
                     size=size*22/30,
                     font="Bitstream Vera Sans",
                     halign="center",
                     valign="center");
        }
    }
}

scale([2,2,1]){
rotate([90,0,0])
translate([0,0,-100])
cylinder(h=200, r=10);
}
color("Black"){
rotate([0,0,-15])
translate([200,-75,0])
scale([3,1,1]){
cylinder(h=.25,r=200);
}
}
color("Cyan")
mirror([0,1,0]) 
rotate([0,0,20])
translate([360,30,0])
scale([2,.5,5 ]){
cylinder(h=.25,r=200);
}
module death(){
// BEGIN DEATH DEPOSITION
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
}

//
scale([1.5,1,1]){
    translate([80,-90,10]) rotate([0,720 * $t,50]) color("Red")death();
}

$vpt = [100, -55, 55];

$vpr = [0, 0, 45];

$vpd = 1500;


echo(version=version());
// Written by Marius Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

