$fn=90;  // accuracy

// Fundemental
tw = 482.6; // total width
u1 = 44.45; // one server unit
u2 = u1*2;  // two server unit

// Fundational
wt  = 7;  // wall thickness 
wts = 8;  // wall thickness side
ct  = 10; // case thickenss
mt  = 4; // mount tikness
mw  = 12; // mount width
mhr = 6;  // mounting holes rack (d)
mhc = 4;  // mounting holes case (d)
mhn = 3;  // mounting holes node (d)
nt  = 3*13; // nodes total 

// Spesific
cw  = (tw-mw*2)/3; // case width
icw = cw-wts*2;  // inner case width
npc = nt/3;  // nodes per case
n1  = icw/npc;   // node (ssd + extra) (~10)
n3  = n1*3;      // node (pi + extra)
nw  = u2-wt*2; // node width
nmt = 3; // node mouting thickness

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
    
    s=0.1;
    s2=s*2; 
    
    difference(){
    cube([w,d,h]);
     
    translate([(w-iw)/2,(d-id)/2,-s])
    cube([iw,id,h+s2]);
    }
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
    wmm4 = 7; // m4 mutter width
    hmm4 = 3.2; // height mutter m8
    fs = 20; // from side
    // possiotion of 
    m4 = 4.2; //screw
    cs = m4+3; // counter sink
    csd = 3;//counder sink depth
    s=0.1;
    s2=s*2;
    depth = (cw-icw)/2-csd;
    
    module h(y){
    rotate([0,90,0])
    translate([-ct/2,y,icw])
    cylinder(h=20,d=m4);
    }
    
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
    h(fs);
    h(u2-fs);
    mh(fs); //change
    mh(u2-fs);    
    }}
}

module caseMiddle(icw,cw,u2,nw,ct){
    m4 = 4.2; //screw
    fs = 20; // from side
    cs = m4+3; // counter sink
    csd = 3;//counder sink depth
    s=0.1;
    s2=s*2;
    depth = (cw-icw)/2-csd;
    
    module h(y){
    rotate([0,90,0])
    translate([-ct/2,y,-s])
    cylinder(h=cw+s2,d=m4);
    }
    
    module c(y,z,d1,d2){
    rotate([0,90,0])
    translate([-mt/2,y,z])
    cylinder(h=csd+s,d1=d1,d2=d2);
    }
    
    difference(){
    case(icw,cw,u2,nw,ct);
        
    union(){
    h(fs);    
    h(u2-fs);
    c(fs,depth,m4,cs);
    c(u2-fs,depth,m4,cs);
    c(fs,cw-depth-csd-s,cs,m4);
    c(u2-fs,cw-depth-csd-s,cs,m4);
    }}
}

//ssdMount(n1,u2,nw,nmt);
//case(icw,cw,u2,nw,ct);
caseSide(icw,cw,u2,nw,ct,mw,mt);
//caseMiddle(icw,cw,u2,nw,ct);
