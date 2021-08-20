use <threadlib/threadlib.scad>

$fn=90;  // accuracy
m  =1;   // margin
ms =0.2; // margin small

// Fundemental
tw  = 482.6;// total width
tiw = 450-m;  // Total iner width
rhd = 465; // rack holde distance
u1 = 44.45; // one server unit
u2 = u1*2-ms;  // two server unit
u25 = u1*25; // 25 server units
m4 = 4.2;   // screw
wmm4 = 7;   // m4 mutter width
hmm4 = 3.2; // height mutter m8
    
// Fundational
wt  = 7;    // wall thickness 
wts = 8;    // wall thickness side
ct  = 14;   // case thickenss
mt  = 6;    // mount tikness
mw  = (tw-tiw)/2;   // mount width
mhp = (rhd-tiw)/2;// Mounting hole position
mhr = 6;    // mounting holes rack (d)
mhc = 4;    // mounting holes case (d)
mhn = 3;    // mounting holes node (d)
npc = 6;    // nodes per case
fs  = 20.5;   // from side
s   = 0.1;  // smale number
s2  = s*2;  // smalle numer extra lenght
    
// Spesific
cw  = (tw-mw*2)/3; // case width
//cw  = (tiw)/3; // case width
icw = cw-wts*2;    // inner case width
nt  = npc*3;       // nodes per case
n1  = icw/npc;     // node (ssd + extra) (~10)
n3  = n1*3;        // node (pi + extra)
nw  = u2-wt*2;     // node width
nmt = 3;           // node mouting thickness
cs  = m4+3;        // counter sink
csd = 3;           // counder sink depth
    

/* generalMount
    This is the general mount

    height:     How tall mount is
    thickness:  thickness of walls
    totalWidth: width including node mount
    width:      distance in x-axis
    depth:      distance in y-axis
*/
module generalMount(height=n1,
                    thickness=nmt,
                    totalWidth=u2,
                    width=nw, depth){
    hd = 3.2;        // hole diameter
    pm = -(u2-nw)/2;  // position mount

    s=0.1;     // Small number
    s2=s*2;   // Small number *2

    sw = 18; // stableser width
    m = 1; // margin

    module hole(x){
        translate([x,s,(height-m)/2])
        rotate([90,0,0])
        cylinder(h=thickness+s2,d=hd);
    }

    difference(){
        union(){
            // bottom plate
            cube(size = [width,depth,thickness]);
            // Stabelisers
            cube(size = [width,sw,height-m]);
            // Mount
            translate([pm,-thickness,0])
            cube(size = [totalWidth,thickness,height-m]);
        }
        union(){
            translate([thickness,-thickness-s,thickness])
            cube(size = [width-thickness*2,sw+thickness+s2,n1-thickness+s]);
            hole(pm/2);
            hole(totalWidth+pm/2*3);
        }
    }

}

module holes(p=[0,0,0,0],h=12,d=3.2){
    module hole(x,y){
        translate([x,y,0])
        cylinder(h=h,d=d);
    }
    hole(p[0],p[2]);
    hole(p[1],p[2]);
    hole(p[0],p[3]);
    hole(p[1],p[3]);
}

module spacers(p=[0,0,0,0], h=12, d=(3.2*2)){
    module spacer(x,y){
        translate([x,y,0])
        cylinder(h=h,d=d);
    }
    spacer(p[0],p[2]);
    spacer(p[1],p[2]);
    spacer(p[0],p[3]);
    spacer(p[1],p[3]);
}


/* ssdMount
    Mount for ssd to be installed on
    micro-computer-server-case
    
    n1:  node (ssd + extra) (~10)
    u2:  two server unit
    nw:  node width
    nmt: node mouting thickness
*/
module ssdMount(n1,u2,nw,nmt){
    w = 69.9; // width
    d = 100; // depth
    h = 10+nmt;  // height
   
    hsp = 4+nw-w; // hole side position
    hbp = 14; // hole back position
    hfp = d-10; // hole front position
   
    hd = 3; // hole diameter
    hde = hd+3;// hole diameter extra
   
    s=0.1;
    s2=s*2; 
    e=1;
   
    sw = 20; // stableser width

    module ssdHole(x,y){
        translate([x,y,-0.1])
        cylinder(h=nmt+0.2,d2=hd,d1=hde);
    }
    module mountHole(x){
        translate([x,-nmt/2-0.1,nmt*2+0.3])
        rotate([90,0,0])
        cylinder(h=nmt+0.3,d=hd,center=true);

    } 

    difference(){
        union(){
            cube([nw,d,nmt]);
            cube([nw,sw,h]);
            translate([(nw-u2)/2,-nmt,0])
            cube([u2,nmt,h]);
        }
        union(){
            ssdHole(hsp,hbp);
            ssdHole(nw-hsp,hbp);
            ssdHole(hsp,hfp);
            ssdHole(nw-hsp,hfp);
            mountHole(u2-ct/4*3);
            mountHole(-ct/4);
        }
        translate([(nw-w)/2,-(nmt+s),nmt])
        cube([w+e,d,nw]);
   }
}



/* piMount
    Mount for rasbary pi to be installed on
    micro-computer-server-case

    n1:  node (ssd + extra) (~10)
    u2:  two server unit
    nw:  node width
    nmt: node mouting thickness
*/
module piMount(n1,u2,nw,nmt){
    w = 56;    // width of rassbary pi
    d = 85;    // depth of rassbary pi
    h = 20;    // height of rassbary pi
    hlsp = 3.5;     // hole left side position from pi
    hrsp = hlsp+49; // hole right side position from pi
    hbp  = d-3.5;   // hole back position from pi
    hfp  = hbp-58;  // hole front position from pi

    difference(){
        union(){
            generalMount(depth=d);
            translate([15,0,nmt])
            spacers(p=[hlsp,hrsp,hbp,hfp], h=nmt);
        }
        union(){
            translate([15,0,0])
            holes(p=[hlsp,hrsp,hbp,hfp], h=nmt*2);
        }
    }
}

/* jetMount
    Mount for nvidia jetson for rasbary pi to be installed on
    micro-computer-server-case

    n1:  node (ssd + extra) (~10)
    u2:  two server unit
    nw:  node width
    nmt: node mouting thickness
*/
module jetMount(n1,u2,nw,nmt){
    w = 87.4;    // width of nvidiea jetson
    d = 67.4;     // depth of nvidiea jetson
    h = 30;  // height of nvidiea jetson
    hd = 3; // hole diameter
    hde = hd+3;// hole diameter extra

    s=0.1;
    s2=s*2;
    e=1;

    sw = 20; // stableser width

    hlsp = 3; // hole left side position from pi
    hrsp = w-3; // hole right side position from pi
    hbp  = d-5;     // hole back position from pi
    hfp = 3;   // hole front position from pi
    spacerH = 12;
    totalSpacerH = spacerH*2+nmt;

    /*
      height:     How tall mount is
      thickness:  thickness of walls
      totalWidth: width including node mount
      width:      distance in x-axis
      depth:      distance in y-axis
    */
    module horizontalMount(height=nw,totalHeight=u2,thickness=nmt,width=100,depth=70){
        pm = -(totalHeight-height)/2; // position mount

        rch = (height-thickness*3)/2; // removal cube hight
        rcw = width-thickness*2; // removal cube width
        rcd = depth+thickness+s2; // removal cube depth

        module hole(z){
            translate([width/2,s,z])
            rotate([90,0,0])
            cylinder(h=nmt+s2,d=hd);
        }

        difference(){
            union(){
                // cube
                cube(size=[width,depth,height]);
                // front mount
                translate([0,-thickness,pm])
                cube(size=[width,thickness,totalHeight]);
            }
            union(){
                // remove bottom
                translate([thickness,-thickness-s,thickness])
                cube(size=[rcw,rcd,rch]);
                // remove top
                translate([thickness,-thickness-s,height-rch-thickness])
                cube(size=[rcw,rcd,rch]);
                // Holes for case mount top
                hole(pm/2);
                // Holes for case mount bottom
                hole(height-pm/2);


            }
        }
    }


    difference(){
        union(){
            horizontalMount();
            translate([nmt*2,0,(nw-totalSpacerH)/2])
            spacers(p=[hlsp, hrsp, hbp, hfp], h=totalSpacerH);
        }
        union(){
            translate([nmt*2,0,(nw-totalSpacerH-s2)/2])
            holes(p=[hlsp, hrsp, hbp, hfp], h=totalSpacerH+s2);
        }
    }
    
}



/* case
    The case is divided and printed out in 3 parts
    left | middle | rigt. The left and rigt has
    rack mount on there respective side.

    icw: inner case width
    cw:  case width
    u2:  two server unit
    nw:  node width
    ct:  case thickenss
*/
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
    
            translate([wts/2,u2/2,0])
            bolt("M3", turns=16, higbee_arc=30);

            translate([cw-wts/2,u2/2,0])
            bolt("M3", turns=16, higbee_arc=30);

            for(i=[1:2:npc*2]){ // npc*2
                translate([wts+(n1/2)*i,wt/2,0])
                //cylinder(h=20,d=3.2);
                bolt("M3", turns=16, higbee_arc=30);
    
                translate([wts+(n1/2)*i,u2-wt/2,0])
                //cylinder(h=20,d=3.2); // ph
                bolt("M3", turns=16, higbee_arc=30);
            }
        }
    }
}

/* caseHole
    Creates m4 holes to be use for "caseSide" 
    and "caseMiddle".

    y: position on the y-axies
    z: position on the z-axies
*/
module caseHole(y,z){
    rotate([0,90,0])
    translate([-ct/2,y,z]) //icw
    cylinder(h=20,d=m4);
}

/* fhex
    generate a hexagon, wich can be used for 
    screwing together "caseSide" and "caseMiddle"

    wid:    the width of the hexagon bult
    height: the height of the bult 
*/
module fhex(wid,height){
    hull(){
    cube([wid/1.7,wid,height],center = true);

    rotate([0,0,120])
    cube([wid/1.7,wid,height],center = true);

    rotate([0,0,240])
    cube([wid/1.7,wid,height],center = true);
}}

/* caseSide
    case with have rack mounts. One on eatch side

    icw: inner case width
    cw:  case width
    u2:  two server unit
    nw:  node width
    ct:  case thickenss
    mw:  mount width
    mt:  mount tikness
*/
module caseSide(icw,cw,u2,nw,ct,mw,mt,mhp){
    
    module m(y){
        space = cw-(cw-icw)/2+hmm4/2-0.1;
        rotate([0,90,0])
        translate([-ct/2,y,space])
        fhex(wmm4,hmm4);
    }
    
    module mh(y){
        translate([-mhp,y,-0.1])
        cylinder(h=mt+0.2,d=7);
    }
    
    difference(){
        union(){
            // the case itself
            case(icw,cw,u2,nw,ct);
            // For the mounting
            translate([-mw,0,0])
            cube([mw,u2,mt]);
        }
    
        union(){
            // Screwhole for connecting with middle case
            m(fs);
            m(u2-fs);
            caseHole(fs,icw);
            caseHole(u2-fs,icw);
            // Holes for mounting to server rack
            mh(fs);
            mh(u2-fs);    
        }   
    }
}

/* caseMiddle
    Case with dose not have rack mounts. 
    Only in middle.

    icw: inner case width
    cw:  case width
    u2:  two server unit
    nw:  node width
    ct:  case thickenss
*/
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
        }
    }
}

module demo(){
    module serverRack(){
        holeDistW = 465;  // distance width
        holeDistH = 15.9022*3; // Distance height

        totalDist = 483;
        innerDist = 450;

        width     = (totalDist-innerDist)/2;
        thickness = 3;
        height    = u25;

        holeDia   = 6;
        holeStart = holeDia*3+2.5;
        holePW = (holeDistW-innerDist)/2;

        difference(){
            union(){
                translate([-width,0,0])
                    cube(size=[width,thickness,height]);

                translate([innerDist,0,0])
                    cube(size=[width,thickness,height]);
            }
            union(){
                    translate([-holePW,+thickness+s,holeStart])
                        rotate([90,0,0])
                        cylinder(h=thickness+s2,d=holeDia);
                     translate([-holePW,+thickness+s,holeStart+holeDistH])
                        rotate([90,0,0])
                         cylinder(h=thickness+s2,d=holeDia);
                /*
                for(i=[holeStart:holeDistH:holeDistH*25]){
                    translate([-holePW,+thickness+s,i])
                        rotate([90,0,0])
                        cylinder(h=thickness+s2,d=holeDia);
                }
                */
            }
        }
    }

    startNodeSSD = 25.5+n1;
    startNodePI  = 52.17-n1;

    translate([343.5,0,ct/2])
    jetMount(n1,u2,nw,nmt);

    translate([startNodePI+n1*4,0,ct/2])
    rotate([0,-90,0])
    piMount(n1,u2,nw,nmt);

    translate([startNodePI+n1*2,0,ct/2])
    rotate([0,-90,0])
    piMount(n1,u2,nw,nmt);

    translate([startNodePI,0,ct/2])
    rotate([0,-90,0])
    piMount(n1,u2,nw,nmt);

    translate([startNodeSSD+n1*4,0,ct/2])
    rotate([0,-90,0])
    ssdMount(n1,u2,nw,nmt);

    translate([startNodeSSD+n1*2,0,ct/2])
    rotate([0,-90,0])
    ssdMount(n1,u2,nw,nmt);

    translate([startNodeSSD,0,ct/2])
    rotate([0,-90,0])
    ssdMount(n1,u2,nw,nmt);

    translate([0,0,u2])
    rotate([-90,0,0])
    union(){
        caseSide(icw,cw,u2,nw,ct,mw,mt,mhp);
        translate([cw,0,0])
        caseMiddle(icw,cw,u2,nw,ct);
        translate([cw*3,u2,0])
        rotate([0,0,180])
        caseSide(icw,cw,u2,nw,ct,mw,mt,mhp);
    }

    color("Snow")
    translate([-m/2,6,0])
    serverRack();
}

//translate([0,20,0])
//demo();

caseSide(icw,cw,u2,nw,ct,mw,mt,mhp);
