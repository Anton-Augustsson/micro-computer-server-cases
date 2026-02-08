$fn=90;  // accuracy

/* Server dimentions */

// one server unit
c_1u = 44.45;  

// two server unit
c_2u = c_1u*2; // 88.9

// total width
// The total with of the a server rack (19")
// this includes the mounting holes
c_tw  = 482.6; 

// Total inner width
// The distance between the mounting holes in the server rack
c_tiw = 450;


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
c_2ucho = c_2u-0.2; 

// case height inner
// The thickness of the walls can then be calculated as (cho-chi)/2
c_2uchi = 78;

// case width outer
// as there are three parts of the rack server case we just devide
// the total inner width with three 
c_cwo = c_tiw/3; // 150

// case width inner
// Needs to be less than case width outer
c_cwi = 140;

// case depth thickness
// How thick the case should be. It needs to be thicker than the hight
// of the threaded insert.
c_cdt = 40;

// case inner side thickness
// The middle and the side case over lap so that a screw can be entered
// between the two cases. The cist is defined as the thickness of the part
// that does not overlap between the midle and side case.
c_cist = 3.5;

// nodes per case
c_npc = 7;

