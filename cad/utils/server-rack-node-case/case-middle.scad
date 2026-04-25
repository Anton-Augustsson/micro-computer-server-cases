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
    dbnh: distance between node holes
*/
module caseMiddle(cwi,cwo,chi,cho,cdt,npc,dbnh){
    caseGeneric(cwi,cwo,chi,cho,cdt,npc,dbnh,false);
}
 
