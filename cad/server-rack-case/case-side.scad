use <case-generic.scad>

/* caseSide
    case with have rack mounts. One on eatch side

    cwi: case width inner
    cwo: case width outer
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
    cist: case innner side thickness 
*/
module caseSide(cwi,cwo,chi,cho,cdt,cist){
    // TODO: change all values

    cst = (cwo-cwi)/2; // case side thickness
    csw = 20; // case side mount width
    csmt = 3; // case side mount thickness
    emc = cst-cist; //extra for mounting cases 
    
    s = 1;
    s2 = s*2;

    hds = 6; // hole diameter for serer rack
    hdc = 4; // hole diameter for mointing to middle case

    difference(){
        union(){
            caseGeneric(cwi,cwo,chi,cho,cdt);

            translate([-csw,0,0])
            cube([csw,cho,csmt]);

            translate([cwo,0,0])
            cube([emc,cho,cdt/2]);

        }
        union(){
            translate([cwo-cst+cist,-s,cdt/2]) // TODO: change to correct possition
            cube([emc+s,cho+s2,cdt/2+s]);

            translate([cwo,cho/5*1,-s])
            cylinder(h=cdt+s2,d=hdc);
            translate([cwo,cho/5*4,-s])
            cylinder(h=cdt+s2,d=hdc);

            translate([-csw/2,cho/5*1,-s]) // TODO: change to correct possition
            cylinder(h=csmt+s2,d=hds);
            translate([-csw/2,cho/5*4,-s]) // TODO: change to correct possition
            cylinder(h=csmt+s2,d=hds);
        }
    }
}

// Server dimentions
u1 = 44.45; // one server unit
tw  = 482.6;// total width
tiw = 450-1;  // Total iner width - margin 1

// Case dimentions
cho = u1*2-0.2; // two server unit - small margin
chi = cho-7*2; // Side thinckness is 7
cwo = tiw/3;
cwi = cwo-8*2; // Side thinckness is 8
cdt = 14;
emc = (((cwo-cwi)/2)/3)*2; // 2/3 extra
cist = 3;

caseSide(cwi,cwo,chi,cho,cdt,cist);