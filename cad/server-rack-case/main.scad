use <case-middle.scad>;
use <case-side.scad>;
include <../utils/constants.scad>;

translate([0,0,cho])
rotate([-90,0,0]){
    caseSide(cwi,cwo,chi,cho,cdt,cist,npc);
    color("red")
    translate([cwo,cho,cdt])
    rotate([180,0,0])
    caseMiddle(cwi,cwo,chi,cho,cdt,cist,npc);
    translate([cwo*3,cho,0])
    rotate([0,0,180])
    caseSide(cwi,cwo,chi,cho,cdt,cist,npc);
    
    // Extra
    translate([10,6.9,0])
    #cube([7,74.8,15]);
}