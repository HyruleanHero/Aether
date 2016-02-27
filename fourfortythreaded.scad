thickness = 25
;
//# of twists = the degree per mm length at a ratio of 30 * 360 per 18 mm.
//so... 10800/18 so 600 degrees per m of height.
module FourForty(){
union(){
cylinder (h = thickness, r = 1.5, $fn = 50);
linear_extrude(height = thickness, center = false, convexity = 10, twist = (thickness*600))
translate([1.8, 0, 0])
circle(r = 1);
}
}
FourForty();
