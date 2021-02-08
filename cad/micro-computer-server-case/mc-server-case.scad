use <threadlib/threadlib.scad>

$fn=90;  // accuracy

// Fundemental
tw = 482.6; // total width
u1 = 44.45; // one server unit
u2 = u1*2;  // two server unit
m4 = 4.2;   // screw
wmm4 = 7;   // m4 mutter width
hmm4 = 3.2; // height mutter m8
    
// Fundational
wt  = 7;    // wall thickness 
wts = 8;    // wall thickness side
ct  = 14;   // case thickenss
mt  = 4;    // mount tikness
mw  = 12;   // mount width
mhr = 6;    // mounting holes rack (d)
mhc = 4;    // mounting holes case (d)
mhn = 3;    // mounting holes node (d)
npc = 13;   // nodes total 
fs  = 20;   // from side
s   = 0.1;  // smale number
s2  = s*2;  // smalle numer extra lenght
    
// Spesific
cw  = (tw-mw*2)/3; // case width
icw = cw-wts*2;    // inner case width
nt  = npc*3;       // nodes per case
n1  = icw/npc;     // node (ssd + extra) (~10)
n3  = n1*3;        // node (pi + extra)
nw  = u2-wt*2;     // node width
nmt = 3;           // node mouting thickness
cs  = m4+3;        // counter sink
csd = 3;           // counder sink depth
    
    
module ssdMount(n1,u2,nw,nmt){
   w = 69.9; // width
   d = 100; // depth
   h = 7;  // height
   
   hsp = 4+nw-w; // hole side position
   hbp = 14; // hole back position
   hfp = d-10; // hole front position
   
   hd = 3; // hole diameter
   hde = hd+3;// hole diameter extra
   
   s=0.1;
   s2=s*2; 
   e=1;
   
   sw = 20; // stableser width
     
   difference(){
   union(){
   cube([nw,d,nmt]);
       
   cube([nw,sw,n1]);
       
   translate([(nw-u2)/2,-nmt,0])
   cube([u2,nmt,n1]);
   
   }
   union(){    
   translate([hsp,hbp,-0.1])
   cylinder(h=nmt+0.2,d2=hd,d1=hde);
   translate([nw-hsp,hbp,-0.1])
   cylinder(h=nmt+0.2,d2=hd,d1=hde);    
   translate([hsp,hfp,-0.1])
   cylinder(h=nmt+0.2,d2=hd,d1=hde);
   translate([nw-hsp,hfp,-0.1])
   cylinder(h=nmt+0.2,d2=hd,d1=hde);    
   
   translate([(nw-w)/2,-(nmt+s),nmt])
   cube([w+e,d,nw]);
   }
   }
 
}

module case(icw,cw,u2,nw,ct){
    w = cw;
    iw = icw;
    d = u2;
    id = nw;
    h = ct;
    ph = -ct-s; // position holes
    s=0.1;
    s2=s*2; 
    
    module mountHole(){
        
    }
    
    difference(){
    union(){
    cube([w,d,h]);
        
    }
    
    union(){
    translate([(w-iw)/2,(d-id)/2,-s])
    cube([iw,id,h+s2]);
    
    translate([wts/2,u2/2,ph])
    cylinder(h=20,d=3.2);
    
    translate([cw-wts/2,u2/2,ph])
    cylinder(h=20,d=3.2);
        
    for(i=[1:2:npc*2]){
    translate([wts+(n1/2)*i,wt/2,ph])
    cylinder(h=20,d=3.2);
    //bolt("M3", turns=16, higbee_arc=30);
    
    translate([wts+(n1/2)*i,u2-wt/2,ph])
    cylinder(h=20,d=3.2);
    //bolt("M3", turns=16, higbee_arc=30);    
    }
    
    }}
}

module caseHole(y,z){
    
    rotate([0,90,0])
    translate([-ct/2,y,z]) //icw
    cylinder(h=20,d=m4);
}

module fhex(wid,height){
    hull(){
    cube([wid/1.7,wid,height],center = true);

    rotate([0,0,120])
    cube([wid/1.7,wid,height],center = true);

    rotate([0,0,240])
    cube([wid/1.7,wid,height],center = true);
}}


module caseSide(icw,cw,u2,nw,ct,mw,mt){
    
    module m(y){
    space = cw-(cw-icw)/2+hmm4/2-0.1;
    rotate([0,90,0])
    translate([-ct/2,y,space])
    fhex(wmm4,hmm4);
    }
    
    module mh(y){
    translate([-mw/2,y,-0.1])
    cylinder(h=mt+0.2,d=6.2);
    }
    
    difference(){
    union(){
    case(icw,cw,u2,nw,ct);
        
    translate([-mw,0,0])
    cube([mw,u2,mt]);
    }
    
    union(){
    m(fs);
    m(u2-fs);
    caseHole(fs,icw);
    caseHole(u2-fs,icw);    
    mh(fs); //change
    mh(u2-fs);    
    }}
}

module caseMiddle(icw,cw,u2,nw,ct){
    
    depth = (cw-icw)/2-csd;
    
    module h(y){
    rotate([0,90,0])
    translate([-ct/2,y,-s])
    cylinder(h=cw+s2,d=m4);
    }
    
    module c(y,z,d1,d2){
    rotate([0,90,0])
    translate([-ct/2,y,z])
    cylinder(h=csd+s,d1=d1,d2=d2);
    }
    
    difference(){
    case(icw,cw,u2,nw,ct);
        
    union(){
    caseHole(fs,icw);
    caseHole(u2-fs,icw);
    caseHole(fs,-s);
    caseHole(u2-fs,-s);
    c(fs,depth,m4,cs);
    c(u2-fs,depth,m4,cs);
    c(fs,cw-depth-csd-s,cs,m4);
    c(u2-fs,cw-depth-csd-s,cs,m4);
    }}
}

//ssdMount(n1,u2,nw,nmt);
//case(icw,cw,u2,nw,ct);


translate([0,0,u2])
rotate([-90,0,0])
union(){
caseSide(icw,cw,u2,nw,ct,mw,mt);
translate([cw,0,0])
caseMiddle(icw,cw,u2,nw,ct);
translate([cw*3,u2,0])
rotate([0,0,180])
caseSide(icw,cw,u2,nw,ct,mw,mt);
}
