use <case-generic.scad>;

/* caseSide
    case with have rack mounts. One on eatch side

    cwi: case width inner
    cwo: case width outer
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
    npc: node per case
*/
module caseSide(cwi,cwo,chi,cho,cdt,npc){
    cst = (cwo-cwi)/2; // case side thickness
    csw = 20; // case side mount width
    csmt = 3; // case side mount thickness
    dfcetmh = 7.56; // distance from case end to mounting hole
    
    s = 1;
    s2 = s*2;

    hds = 7; // hole diameter for serer rack

    module serverMountingHoles() {
        #cylinder(h=csmt,d=hds);
        translate([0,-hds/2,0])
        #cube([csw-7.56,hds,csmt]);
    }

    difference(){
        union(){
            caseGeneric(cwi,cwo,chi,cho,cdt,npc, true);

            translate([cwo+cst,0,0])
            cube([csw,cho,csmt]);
        }
        union(){
            translate([cwo+cst+dfcetmh,cho/5,0]) // TODO: change to correct possition
            serverMountingHoles();
            translate([cwo+cst+dfcetmh,cho/5*4,0]) // TODO: change to correct possition
            serverMountingHoles();

            // Remove 1mm to allow some margin
            translate([cwo+cst-1,0,csmt])
            cube([1,cho,cdt-csmt]);
        }
    }
}

