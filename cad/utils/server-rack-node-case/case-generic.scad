/* caseGeneric
    Used by `caseSide` and `caseMiddle` to generate 
    a basic case with monting holes, e.g., for ssd or Pi.

    cwi: case width inner
    cwo: case width outer
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
    npc: node per case
    isSide: 
*/
module caseGeneric(cwi,cwo,chi,cho,cdt,npc, isSide=true){
    nt = cwi/npc;  // Node thicknes

    hwt = (cho-chi)/2; // horizontal wall thickness
    vwt = (cwo-cwi)/2; // vertical wall thickness
    vwtt = vwt*2; // vertical wall thickness total
    cwt = cwo+vwt*2; // case width total
    dnmh = 4; // diameter node mounting hole
    hnmh = 12; // height node mounting hole
    dcmh = 4; // diameter case mounting hole

    module nodeMountingHoles(){
        for(i=[1:2:npc*2]){
            // Buttom holes
            translate([vwtt+(nt/2)*i,hwt/2,0])
            cylinder(d=dnmh, h=hnmh);

            // Top holes 
            translate([vwtt+(nt/2)*i,cho-hwt/2,0])
            cylinder(d=dnmh, h=hnmh);
        }
    }
    
    difference(){
        union(){
            if (isSide)
            {
              cube([cwt-vwt,cho,cdt]);
            }
            else
            {
              cube([cwt,cho,cdt]);
            }
        }
        union(){
            translate([vwtt,hwt,0])
            cube([cwi,chi,cdt]);
            
            translate([0,0,cdt/2])
            cube([vwtt,cho,cdt/2]);

            translate([vwt,cho/5,0])
            cylinder(d=dcmh, h=cdt);
            translate([vwt,cho/5*4,0])
            cylinder(d=dcmh, h=cdt);

            if (isSide)
            {
                nodeMountingHoles();
            }
            else
            {
                translate([0,0,cdt-hnmh])
                nodeMountingHoles();

                translate([cwo,0,cdt/2])
                cube([vwtt,cho,cdt/2]);

                translate([cwt-vwt,cho/5,0])
                cylinder(d=dcmh, h=cdt);
                translate([cwt-vwt,cho/5*4,0])
                cylinder(d=dcmh, h=cdt);
            }
        }
    }
}
