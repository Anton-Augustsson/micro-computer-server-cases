/* wdMyPassportHolder
    Mount for WD My Passport to be installed in
    rack server node case
    
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
    hdbh: horizontal distance between holes
*/
module wdMyPassportHolder(chi,cho,cdt,hdbh){
  hwt = (cho-chi)/2; // horizontal wall thickness
  nhbpt = 3; // node holder base plate thickness

  wdmpw = 75+1; // WD My Passport width
  wdmpd = 107.2+1; // WD My Passport depth
  wdmpt = 19.2+1; // WD My Passport thickness. Note that this is for 5TB and 4TB

  nw = wdmpw+nhbpt;// Node width
  nd = wdmpd+nhbpt;// Node depth
  nt = wdmpt+nhbpt*2;// Node thickness
  ntt = wdmpt+nhbpt*4;// Node thickness (extra thickness for support)

  mwfp = sqrt(chi^2-nt^2)-3;  // max width for pivoting (the case)

  module mountHole(){
    translate([0,nhbpt/2,nt/2])
    rotate([90,0,0])
    #cylinder(h=nhbpt,d=3.1,center=true);
  } 

  difference() {
    union() {
      translate([-nhbpt,0,0])
      cube([nw, nd, nt]);

      translate([-hwt,0,-(ntt-nt)/2])
      cube([cho, 10, ntt]);
    }
    union() {
      // WD My Passport
      translate([0,0,nhbpt]) 
      cube([wdmpw, wdmpd, wdmpt]);

      // Remove potential small walls
      translate([0,nhbpt,nhbpt]) 
      cube([nw, cdt+4, wdmpt]);

      // Remove to fit in case
      translate([-hwt,nhbpt,-(ntt-nt)/2]) 
      cube([hwt, cdt+4, ntt]);

      // Remove to allow pivoting
      translate([mwfp,nhbpt,-(ntt-nt)/2]) 
      cube([cho-mwfp, cdt+4, ntt]);

      // Remove unnessesary parts
      translate([mwfp,nhbpt+cdt,0]) 
      rotate([0,0,25])
      #cube([nw,nd,nt]);

      translate([-hwt/2,0,10])
      mountHole();
      translate([-hwt/2,0,-10])
      mountHole();
      translate([-hwt/2+hdbh,0,10])
      mountHole();
      translate([-hwt/2+hdbh,0,-10])
      mountHole();
    }
  }
}

