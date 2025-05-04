use <case-generic.scad>;
include <../utils/constants.scad>;

/* caseMiddle
    The rack case is in three parts left side case,
    middle case, and right side case.
    The middle case is the one without rack mounts on sides. 

    cwi: case width inner
    cwo: case width outer
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
    cist: case innner side thickness 
    npc: node per case
*/
module caseMiddle(cwi,cwo,chi,cho,cdt,cist,npc){
    // -2 since it wont fit otherwise
    cwoa = cwo-2; // case width outer actual
    cwia = cwi-2;
    cst = (cwoa-cwia)/2; // case side thickness
    emc = cst-cist; // extra for mounting cases 

    s = 1;
    s2 = s*2;

    hdc = 4; // hole diameter for mointing to middle case

    difference(){
        union(){
            caseGeneric(cwia,cwoa,chi,cho,cdt,npc,false);

            translate([-emc,0,0])
            cube([emc,cho,cdt/2]);

            translate([cwoa,0,0])
            cube([emc,cho,cdt/2]);
        }
        union(){
            translate([cwoa,cho/5*1,-s])
            cylinder(h=cdt+s2,d=hdc);
            translate([cwoa,cho/5*4,-s])
            cylinder(h=cdt+s2,d=hdc);

            translate([0,cho/5*1,-s])
            cylinder(h=cdt+s2,d=hdc);
            translate([0,cho/5*4,-s])
            cylinder(h=cdt+s2,d=hdc);

            translate([cwoa-cst+cist,-s,cdt/2])
            cube([cst-cist+s,cho+s2,cdt/2+s]);
            translate([-s,-s,cdt/2])
            cube([cst-cist+s,cho+s2,cdt/2+s]);
        }
    }
}
 
caseMiddle(c_cwi,c_cwo,c_chi,c_cho,c_cdt,c_cist,c_npc);