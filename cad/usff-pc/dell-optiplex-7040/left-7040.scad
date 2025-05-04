include <../../utils/constants.scad>;

module usff7040(a_depth, a_isLeft) {
  m = 0.5; // margin
  bottomMargin = 4;

  sideMountHoleDiameter = 6.2; 
  sideMountWidth = (c_tw - c_tiw)/2;
  sideMountThickness = 4;
  sideThickness = 10;

  topHoleToFloor = 35;//-4;
  topHoleToBottom = topHoleToFloor-bottomMargin;
  topThickness = 5;
  topHoleToTop = topThickness+4;

  sideAttachersWidth = 2.8;
  sideAttachersThickness = 1.5;
  sideAttachersLeftHeight = 12;


  intersectionWidth = c_tiw-(c_do7040w*2+sideThickness*4);
  intersectionHoleDiameter = 6.2;

  height = topHoleToBottom+topThickness; //c_hdrh+topToMountHole;
  width = c_do7040w+sideThickness*2+intersectionWidth+sideMountWidth;


  difference() {
    cube([width, a_depth, height]);

    union() {
      if (a_isLeft) {
        translate([0,sideMountThickness,0])
        cube([sideMountWidth+m, a_depth, height]);

        translate([sideMountWidth+sideThickness,0,-topThickness])
        difference() {
          cube([c_do7040w+m, a_depth, c_do7040h]);

          union() {
            translate([c_do7040w+m-sideAttachersThickness,0,0])
            #cube([sideAttachersThickness, sideAttachersWidth, c_do7040h]);

            translate([0,0,c_do7040h-sideAttachersLeftHeight])
            #cube([sideAttachersThickness, sideAttachersWidth, sideAttachersLeftHeight]);
          }
        }
      }
      else {
        translate([0,-sideMountThickness,0])
        cube([sideMountWidth+m, a_depth, height]);

        translate([sideMountWidth+sideThickness,0,-topThickness])
        difference() {
          cube([c_do7040w+m, a_depth, c_do7040h]);

          union() {
            translate([0,a_depth-sideAttachersWidth,0])
            #cube([sideAttachersThickness, sideAttachersWidth, c_do7040h]);

            translate([c_do7040w+m-sideAttachersThickness,a_depth-sideAttachersWidth,c_do7040h-sideAttachersLeftHeight])
            cube([sideAttachersThickness, sideAttachersWidth, sideAttachersLeftHeight]);
          }
        }
      }

      translate([width-intersectionWidth,a_depth/2,0])
      #cube([intersectionWidth, a_depth, height]);

      translate([width-intersectionWidth/2, a_depth, height/4])
      rotate([90,0,0])
      #cylinder(d=intersectionHoleDiameter, h=a_depth);

      translate([width-intersectionWidth/2, a_depth, height*3/4])
      rotate([90,0,0])
      #cylinder(d=intersectionHoleDiameter, h=a_depth);

      translate([(c_tw-c_wdrh)/2,a_depth,height-topHoleToTop])
      rotate([90,0,0])
      #cylinder(d=sideMountHoleDiameter, h=a_depth);
    }
  }
}

translate([-1,-1,0])
usff7040(20,true);

//translate([c_tw,20,0])
//rotate([180,180,0])
//usff7040(20,false);
