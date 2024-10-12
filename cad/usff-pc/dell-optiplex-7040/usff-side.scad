include <../../utils/constants.scad>;

/* caseSideMount
    height: should be the same as usff-pc height
    ct: case thickness
    power_switch: ture/false
*/
module usffSide(ew, height, ct, power_switch) {
  m = 1; // margin
  hd = 5.2; // hole diameter
  pscpfb = 11; // power switch center position from bottom
  psd = 12; // power switch diameter
  tbt = (height-do7040h)/2;// Top/bottom thickness
  hph1 = (height-hdrh)/2; // Hole height width 1
  hph2 = hph1+hdrh; // Hole height width 2
  hpw = 7; // Hole posistion width

  difference() {
    cube([do7040d+ct*2,ct,height]);

    union() {
      translate([ct,0,tbt])
      cube([do7040d+m,ct,do7040h+m]);

      translate([hpw,ct,hph1])
      rotate([90,0,0])
      #cylinder(d=hd, h=ct);

      translate([hpw,ct,hph2])
      rotate([90,0,0])
      #cylinder(d=hd, h=ct);

      translate([(do7040d+ct*2)-hpw,ct,hph1])
      rotate([90,0,0])
      #cylinder(d=hd, h=ct);

      translate([(do7040d+ct*2)-hpw,ct,hph2])
      rotate([90,0,0])
      #cylinder(d=hd, h=ct);

      if (power_switch) {
        translate([0,ct-9,pscpfb+tbt])
        rotate([0,90,0])
        #cylinder(d=psd, h=ct);
      }
    }
  }
}

usffSide(20, u1, 14, true);

