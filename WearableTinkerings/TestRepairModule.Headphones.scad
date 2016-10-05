//Basic clip for broken headphones.

//this module is going to be used as a starting point for designing the rest of the clip, will include "bonus" led light diffuser
module BoxContentFootprints(){
//main body
       cube([50,19,13]);

//midsection connecting piece to the (now broken) clip
       translate([1.5,5.5,-2.5]) cube([8.7, 8.5, 2.5]);

//top part of the former clip (broken remaining artifact
       translate([1,4.5,-4]) cube([7.3,10,1.75]);

//placeholder for microphone hotzone
//"hotzone in this case is an area where I absolutely do not want material while designing additional pieces.
       translate([4.5,10,10]) cylinder(d=1,h=8);
}

BoxContentFootprints();
