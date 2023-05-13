use <case-middle.scad>
use <case-side.scad>

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


translate([0,0,cho])
rotate([-90,0,0]){
    caseSide(cwi,cwo,chi,cho,cdt,cist);
    color("red")
    translate([cwo,cho,cdt])
    rotate([180,0,0])
    caseMiddle(cwi,cwo,chi,cho,cdt,cist);
    translate([cwo*3,cho,0])
    rotate([0,0,180])
    caseSide(cwi,cwo,chi,cho,cdt,cist);
}