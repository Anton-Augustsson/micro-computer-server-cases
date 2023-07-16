use <threadlib/threadlib.scad>

/* caseGeneric
    Used by `caseSide` and `caseMiddle` to generate 
    a basic case with monting holes, e.g., for ssd or Pi.

    cwi: case width inner
    cwo: case width outer
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
    npc: node per case
*/
module caseGeneric(cwi,cwo,chi,cho,cdt,npc){
    nt = cwi/npc;  // Node thicknes

    wt = (cho-chi)/2; // wall thickness top and bottom
    wts = (cwo-cwi)/2; // wall thickness on left and right side

    s=0.1; // Small number just to render correctly
    s2=s*2; 

    module nodeMountingHoles(){
        for(i=[1:2:npc*2]){
            // Buttom holes
            translate([wts+(nt/2)*i,wt/2,0])
            bolt("M3", turns=16, higbee_arc=30);

            // Top holes 
            translate([wts+(nt/2)*i,cho-wt/2,0])
            bolt("M3", turns=16, higbee_arc=30);
        }
    }
    
    difference(){
        union(){
            cube([cwo,cho,cdt]);
        }
        union(){
            translate([wts,wt,-s])
            cube([cwi,chi,cdt+s2]);

            //nodeMountingHoles(); // Comment out to render faster
        }
    }
}