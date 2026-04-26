/* linocellPremiumGanMultiladdarePd30100Wholder
  unt for WD My Passport to be installed in
    rack server node case
    
    chi: case height inner
    cho: case height outer
    dbnh: distance between node holes
    cdt: case depth thickness // TODO: remove ,c_cdt,c_cdt
*/
module linocellPremiumGanMultiladdarePd30100Wholder(chi,cho,dbnh){
  chargerWidth = 61+3;
  chargerDepth = 81;
  chargerThickness = 30;

  caseThickness = (cho-chi)/2;
  nodeHoleDiameter = 3.1;

  holderWallThickness = 2;
  holderThickness = chargerThickness+holderWallThickness*2;
  holderDepth = chargerDepth+holderWallThickness*2;


  module nodeHoles() {
    translate([0,holerThickness,0])
    rotate([90,0,0])
    cylinder(h=holerThickness, d=nodeHoleDiameter);

    translate([dbnh,holerThickness,0])
    rotate([90,0,0])
    cylinder(h=holerThickness, d=nodeHoleDiameter);
  }

  module linocellPremiumGanMultiladdarePd30100W() {
    difference(){
      cube([chargerThickness,chargerDepth,chargerWidth]);

      translate([0,-0.35,0])
      rotate([-22,0,0])
      #cube([chargerThickness,2.5,1]);
    }
  }

  difference() {
    union() {
      cube([holderThickness,holderDepth,chi]);

      translate([0,0,-caseThickness])
      cube([holderThickness,holderWallThickness,cho]);
    }

    union() {
      translate([holderWallThickness,0,4])
      linocellPremiumGanMultiladdarePd30100W();

      // Node holes
      translate([holderThickness/2+10,holderWallThickness,-caseThickness/2])
      rotate([90,0,0])
      cylinder(h=holderWallThickness, d=nodeHoleDiameter);

      translate([holderThickness/2+10,holderWallThickness,-caseThickness/2+dbnh])
      rotate([90,0,0])
      cylinder(h=holderWallThickness, d=nodeHoleDiameter);

      translate([holderThickness/2-10,holderWallThickness,-caseThickness/2])
      rotate([90,0,0])
      cylinder(h=holderWallThickness, d=nodeHoleDiameter);

      translate([holderThickness/2-10,holderWallThickness,-caseThickness/2+dbnh])
      rotate([90,0,0])
      cylinder(h=holderWallThickness, d=nodeHoleDiameter);

      // Air flow
      translate([0,20,chi])
      rotate([-40,0,0])
      cube([holderThickness,holderDepth+2,cho]);
    }
  }
}

