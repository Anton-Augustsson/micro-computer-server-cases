$fn=90;  // accuracy

/* Server dimentions */

// one server unit
u1 = 44.45;  

// two server unit
u2 = u1*2;   

// total width
// The total with of the a server rack (19")
// this includes the mounting holes
tw  = 482.6; 

// Total inner width
// The distance between the mounting holes in the server rack
tiw = 450; // TODO: 432?  


/* Rack hole dimentions */

// width distance rack holes
wdrh = 465;

// height distance rack holes
hdrh = 33;


/* dell optiplex 7040 micro usff dimentions */

// dell optiplex 7040 height
do7040h = 36;

// dell optiplex 7040 width
do7040w = 182;

// dell optiplex 7040 depth
do7040d = 179;

// dell optiplex 7040 rubber feet width distance
do7040rfwd = 14.9;

// dell optiplex 7040 rubber feet back depth distance
do7040rfbdd = 9.9;


/* Case dimentions */

// case height outer 
// A small margin is included to so that the case does not 
// exide two server units
cho = u2-0.2; 

// case height inner
// The thickness of the walls can then be calculated as (cho-chi)/2
chi = cho-7*2;

// case width outer
// as there are three parts of the rack server case we just devide
// the total inner width with three 
cwo = tiw/3;

// case width inner
// 132 was calculated by defining by the desired with between each node, 
// i.e., 22. The first and last hole is 22/2 mm away from the side of the case.
// This gives us 22*5+(22/2)*2 = 22*6 = 132
cwi = 132;

// case depth thickness
// How thick the case should be. It should not be that important.
// Just know that it is enough for a screw to thread in the case 
cdt = 14;

// case inner side thickness
// The middle and the side case over lap so that a screw can be entered
// between the two cases. The cist is defined as the thickness of the part
// that does not overlap between the midle and side case.
cist = 3.5;

// nodes per case
npc = 6;

