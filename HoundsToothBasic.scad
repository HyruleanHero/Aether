//individual relational test basic remodeling.
//main object will be composed of three pieces
//the first part are the 'incisors and those are the smaller more jagged protrusions at the lower left parts when looking top down.
//the second part is the central most piece and on paper it is viewed as a two dimensional square.
//the third and final part are the "fangs" that protrude out of the upper right most section.... maybe I'll dive deep if people actually care.


//rough size allocation for incisor prototype
square(size = [3,3], center = true);

//rough size allocation for the square
square(size = [10,10]);

//rough size allocation for fangs
translate ([0,7]) square(size = [7,7]);
translate ([7,0]) square(size = [7,7]);

//w h e w
//getting there.
//until next time~