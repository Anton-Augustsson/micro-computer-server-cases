
include <../utils/constants.scad>;
use <../utils/server-rack-node-case/case-middle.scad>;
use <../utils/server-rack-node-case/case-side.scad>;
use <drive-case/ssd-holder-module.scad>;
use <drive-case/wd-my-passport-holder-module.scad>;

translate([0,0,c_2ucho])
rotate([-90,0,0]){
    cst = (c_cwo-c_cwi)/2;
    translate([c_cwo*2-cst*2+2,0,0])
    caseSide(c_cwi,c_cwo,c_2uchi,c_2ucho,c_cdt,c_npc,c_2udbnh);
    color("red")
    translate([c_cwo-cst*2+1,c_2ucho,c_cdt+1])
    rotate([180,0,0])
    caseMiddle(c_cwi,c_cwo,c_2uchi,c_2ucho,c_cdt,c_npc,c_2udbnh);
    translate([c_cwo,c_2ucho,0])
    rotate([0,0,180])
    caseSide(c_cwi,c_cwo,c_2uchi,c_2ucho,c_cdt,c_npc,c_2udbnh);
    
    // Node holders
    translate([3,5.5,-4])
    rotate([90,0,90])
    ssdHolder(c_2uchi,c_2ucho);
    translate([23,5.5,-4])
    rotate([90,0,90])
    ssdHolder(c_2uchi,c_2ucho);
    translate([73,c_2uchi+5,-4])
    rotate([90,0,-90])
    wdMyPassportHolder(c_2uchi,c_2ucho,c_cdt,c_2udbnh);
}
