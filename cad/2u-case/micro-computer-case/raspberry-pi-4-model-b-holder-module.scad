/* raspberryPi4ModelBHolder
    Mount for WD My Passport to be installed in
    rack server node case
    
    chi: case height inner
    cho: case height outer
    dbnh: distance between node holes
*/
module raspberryPi4ModelBHolder(chi,cho,dbnh){
  caseThickness = (cho-chi)/2;
  piHoleDiameter = 3.1;
  nodeHoleDiameter = 3.1;
  holerThickness = 2;
  piHeight = 17;
  holderHeight = 13;
  screwDiamter = 6;
  rpi4Depth = 85;
  rpi4Width = 56;
  holderDepth = 88;

  module nodeHoles() {
    translate([0,holerThickness,0])
    rotate([90,0,0])
    cylinder(h=holerThickness, d=nodeHoleDiameter);

    translate([dbnh,holerThickness,0])
    rotate([90,0,0])
    cylinder(h=holerThickness, d=nodeHoleDiameter);
  }

  module rpi4() {
    cylinder(h=holerThickness, d2=piHoleDiameter, d1=screwDiamter);
    translate([49,0,0])
    cylinder(h=holerThickness, d2=piHoleDiameter, d1=screwDiamter);
    translate([0,58,0])
    cylinder(h=holerThickness, d2=piHoleDiameter, d1=screwDiamter);
    translate([49,58,0])
    cylinder(h=holerThickness, d2=piHoleDiameter, d1=screwDiamter);

    m = 1; // Margin
    translate([-3.5-m,-23.5,holerThickness])
    cube([rpi4Width+m*2,rpi4Depth,piHeight]);
  }

  difference() {
    union() {
      cube([chi,holderDepth,holerThickness]);

      translate([0,0,holerThickness])
      cube([chi,18,holderHeight]);

      translate([-caseThickness,0,0])
      cube([cho,holerThickness,holderHeight+holerThickness]);
    }

    union() {
      translate([piHeight,23.5,0])
      #rpi4();

      translate([-caseThickness/2,0,holderHeight/2])
      #nodeHoles();
    }
  }
}

