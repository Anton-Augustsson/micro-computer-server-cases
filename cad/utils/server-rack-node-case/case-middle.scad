use <case-generic.scad>;

/* caseMiddle
    The rack case is in three parts left side case,
    middle case, and right side case.
    The middle case is the one without rack mounts on sides. 

    cwi: case width inner
    cwo: case width outer
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
    npc: node per case
*/
module caseMiddle(cwi,cwo,chi,cho,cdt,npc){
    // -2 since it wont fit otherwise
    cwoa = cwo-2; // case width outer actual
    cwia = cwi; // case width inner actual
    cst = (cwoa-cwia)/2; // case side thickness

    hdc = 4; // hole diameter for mointing to middle case

    caseGeneric(cwi,cwo,chi,cho,cdt,npc,false);
}
 
