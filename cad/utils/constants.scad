$fn=90;  // accuracy

/* Server dimentions */

// one server unit
c_u1 = 44.45;  

// two server unit
c_u2 = c_u1*2;   

// total width
// The total with of the a server rack (19")
// this includes the mounting holes
c_tw  = 482.6; 

// Total inner width
// The distance between the mounting holes in the server rack
c_tiw = 450; // TODO: 432?  


/* Rack hole dimentions */

// width distance rack holes
c_wdrh = 465;

// height distance rack holes
c_hdrh = 33;


/* dell optiplex 7040 micro usff dimentions */

// dell optiplex 7040 height
c_do7040h = 36;

// dell optiplex 7040 width
c_do7040w = 182;

// dell optiplex 7040 depth
c_do7040d = 179;

// dell optiplex 7040 rubber feet width distance
c_do7040rfwd = 14.9;

// dell optiplex 7040 rubber feet back depth distance
c_do7040rfbdd = 9.9;


/* Case dimentions */

// case height outer 
// A small margin is included to so that the case does not 
// exide two server units
c_cho = c_u2-0.2; 

// case height inner
// The thickness of the walls can then be calculated as (cho-chi)/2
c_chi = c_cho-7*2;

// case width outer
// as there are three parts of the rack server case we just devide
// the total inner width with three 
c_cwo = c_tiw/3;

// case width inner
// 132 was calculated by defining by the desired with between each node, 
// i.e., 22. The first and last hole is 22/2 mm away from the side of the case.
// This gives us 22*5+(22/2)*2 = 22*6 = 132
c_cwi = 132;

// case depth thickness
// How thick the case should be. It should not be that important.
// Just know that it is enough for a screw to thread in the case 
c_cdt = 14;

// case inner side thickness
// The middle and the side case over lap so that a screw can be entered
// between the two cases. The cist is defined as the thickness of the part
// that does not overlap between the midle and side case.
c_cist = 3.5;

// nodes per case
c_npc = 6;

