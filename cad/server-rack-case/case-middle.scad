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
    cst = (cwo-cwi)/2; // case side thickness
    emc = cst-cist; // extra for mounting cases 

    s = 1;
    s2 = s*2;

    hdc = 4; // hole diameter for mointing to middle case

    difference(){
        union(){
            caseGeneric(cwi,cwo,chi,cho,cdt,npc);

            translate([-emc,0,0])
            cube([emc,cho,cdt/2]);

            translate([cwo,0,0])
            cube([emc,cho,cdt/2]);
        }
        union(){
            translate([cwo,cho/5*1,-s])
            cylinder(h=cdt+s2,d=hdc);
            translate([cwo,cho/5*4,-s])
            cylinder(h=cdt+s2,d=hdc);

            translate([0,cho/5*1,-s])
            cylinder(h=cdt+s2,d=hdc);
            translate([0,cho/5*4,-s])
            cylinder(h=cdt+s2,d=hdc);

            translate([cwo-cst+cist,-s,cdt/2]) // TODO: change to correct possition
            cube([cst-cist+s,cho+s2,cdt/2+s]);
            translate([-s,-s,cdt/2]) // TODO: change to correct possition
            cube([cst-cist+s,cho+s2,cdt/2+s]);
        }
    }
}
 
caseMiddle(cwi,cwo,chi,cho,cdt,cist,npc);