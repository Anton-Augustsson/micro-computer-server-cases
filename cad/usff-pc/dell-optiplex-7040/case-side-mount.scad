include <../../utils/constants.scad>;

/* caseSideMount
    ew: extended width, is the the width from the end of the rack mount to the usff-pc
    height: should be the same as usff-pc height
    mt: mount thickness
    ct: case thickness
*/
module caseSideMount(ew, height, mt, ct) {
  mw = (tw-tiw)/2; // Mount width
  hpw1 = mw-(wdrh-tiw); // Hole position width 1
  hpw2 = mw-(wdrh-tiw); // Hole position width 2
  hph1 = hdrh*3/2; // Hole height width 1
  hph2 = hdrh/2; // Hole height width 2

  difference() {
    union() {
      cube([mw,mt,height]);

      translate([mw,0,0])
      cube([ew,ct,height]);
    }

    union() {
      translate([hpw1,mt,hph1])
      rotate([90,0,0])
      cylinder(d=4, h=mt);

      translate([hpw2,mt,hph2])
      rotate([90,0,0])
      cylinder(d=4, h=mt);
    }
  }
}

caseSideMount(20, u1, 3, 14);
