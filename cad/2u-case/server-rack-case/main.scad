use <case-middle.scad>;
use <case-side.scad>;
include <../../utils/constants.scad>;

translate([0,0,c_cho])
rotate([-90,0,0]){
    cst = (c_cwo-c_cwi)/2;
    translate([c_cwo*2-cst*2+2,0,0])
    caseSide(c_cwi,c_cwo,c_chi,c_cho,c_cdt,c_npc);
    color("red")
    translate([c_cwo-cst*2+1,c_cho,c_cdt+1])
    rotate([180,0,0])
    caseMiddle(c_cwi,c_cwo,c_chi,c_cho,c_cdt,c_npc);
    translate([c_cwo,c_cho,0])
    rotate([0,0,180])
    caseSide(c_cwi,c_cwo,c_chi,c_cho,c_cdt,c_npc);
    
    // Extra
    //translate([10,6.9,0])
    //#cube([7,74.8,15]);
}
