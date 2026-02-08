/* ssdHolder
    Mount for ssd to be installed on
    micro-computer-server-case
    
    chi: case height inner
    cho: case height outer
*/
module ssdHolder(chi,cho){
    ct = (cho-chi)/2; // case thickness
    nmt = 3; // node mouting thickness
    chim = chi-0.4; // case height - margin
    nw = 14;

    w = 69.9; // width sdd
    d = 100; // depth ssd
   
    dbhd = 76.6; // distance between holes depth
    dbhw = 61.72; // distance between holes width
   
    hd = 3; // hole diameter
    hde = hd+3;// hole diameter extra
   
    s=0.1;
    s2=s*2; 
   
    module ssdHole(x,y){
        translate([x,y,-0.1])
        cylinder(h=nmt+0.2,d2=hd,d1=hde);
    }
    module mountHole(x){
        translate([x,nmt/2,nw/2])
        rotate([90,0,0])
        cylinder(h=nmt+s2,d=hd,center=true);

    } 

    difference(){
        union(){
            cube([chim,d,nmt]); // Base plate

            translate([-ct,0,0])
            cube([ct,nmt,nw]); // For mount to case

            translate([chim,0,0])
            cube([ct,nmt,nw]); // For mount to case

            // TODO: remove, just for development
            //translate([(chim-w)/2,0,nmt])
            //#cube([w,d,10]); // For mount to case

            cube([(chim-w)/2-0.4,d/4,nw]); // For mount to case
            translate([chim-((chim-w)/2-0.4),0,0])
            cube([(chim-w)/2-0.4,d/4,nw]); // For mount to case
        }
        union(){
            translate([(chim-dbhw)/2,10,0]){
                ssdHole(0,0); // bottom left
                ssdHole(dbhw,0); // bottom right
                ssdHole(0,dbhd); // top left
                ssdHole(dbhw,dbhd); // top right
            }
            mountHole(-ct/2);
            mountHole(cho-ct/2-ct);
        }
   }
}
