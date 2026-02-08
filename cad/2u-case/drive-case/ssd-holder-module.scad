/* ssdHolder
    Mount for ssd to be installed on
    server rack node case
    
    chi: case height inner
    cho: case height outer
*/
module ssdHolder(chi,cho){
    hwt = (cho-chi)/2; // horizontal wall thickness
    nhbpt = 3; // node holder base plate thickness
    chim = chi-0.4; // case height inner - margin
    nhw = 14; // node holder width
    nhd = 30; // node holder depth

    ssdw = 69.9; // sdd width
    ssdd = 100; // ssd depth
   
    dbhd = 76.6; // distance between holes depth
    dbhw = 61.72; // distance between holes width
   
    hd = 3; // hole diameter
    hde = hd+3;// hole diameter extra
   
    module ssdHole(x,y){
        translate([x,y,0])
        cylinder(h=nhbpt,d2=hd,d1=hde);
    }
    module mountHole(x){
        translate([x,nhbpt/2,nhw/2])
        rotate([90,0,0])
        cylinder(h=nhbpt,d=hd,center=true);
    } 

    difference(){
        union(){
            cube([chim,ssdd,nhbpt]); // Base plate

            // For mount to case
            translate([-hwt,0,0])
            cube([cho,nhbpt,nhw]); 
            cube([chim,nhd,nhw]);
        }
        union(){
            // Make space for SSD
            translate([(chim-ssdw)/2,0,nhbpt])
            cube([ssdw,ssdd,nhw]);

            // SSD mount holes
            translate([(chim-dbhw)/2,10,0]){
                ssdHole(0,0); // bottom left
                ssdHole(dbhw,0); // bottom right
                ssdHole(0,dbhd); // top left
                ssdHole(dbhw,dbhd); // top right
            }

            // Mount holes to case
            mountHole(-hwt/2);
            mountHole(cho-hwt/2-hwt);
        }
   }
}
