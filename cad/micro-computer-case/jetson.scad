$fn=90;  // accuracy

/* jetMount
    Mount for nvidia jetson for rasbary pi to be installed on
    micro-computer-server-case

    n1:  node (ssd + extra) (~10)
    u2:  two server unit
    nw:  node width
    nmt: node mouting thickness

    chi: case height inner
    cho: case height outer
    nw:  node width
*
*/
module jetMount(chi,cho,nw){

    nmt = 3;           // node mouting thickness

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


    /*
      height:     How tall mount is
      thickness:  thickness of walls
      totalWidth: width including node mount
      width:      distance in x-axis
      depth:      distance in y-axis
    */
    module horizontalMount(height=chi,totalHeight=cho,thickness=nmt,width=100,depth=70){
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
            translate([nmt*2,0,(chi-totalSpacerH)/2])
            spacers(p=[hlsp, hrsp, hbp, hfp], h=totalSpacerH);
        }
        union(){
            translate([nmt*2,0,(chi-totalSpacerH-s2)/2])
            holes(p=[hlsp, hrsp, hbp, hfp], h=totalSpacerH+s2);
        }
    }
    
}

u1 = 44.45; // one server unit
npc = 6;
tiw = 450-1;  // Total iner width - margin 1
cwo = tiw/3;
cwi = cwo-8*2; // Side thinckness is 8

cho = u1*2-0.2; // two server unit - small margin
chi = cho-7*2; // Side thinckness is 7
//nw = 14; // cwi/npc-2; // -2 for margin
nw = chi; // cwi/npc-2; // -2 for margin

jetMount(chi,cho,nw);

