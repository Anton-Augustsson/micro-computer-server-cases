// TODO: This is not completed and unsure if I need this 
include <../../../utils/constants.scad>;

module usff7040Case(a_depth, a_isLeft) {
  m = 0.5; // margin, for usff7040 to fit?
  bottomMargin = 4;

  sideMountHoleDiameter = 6.2; 
  sideMountWidth = (c_tw - c_tiw)/2;
  sideMountThickness = 6;
  sideThickness = 10;

  holeDistance = 31.75;

  topHoleToFloor = 35;//-4;
  topHoleToBottom = topHoleToFloor-bottomMargin;
  topThickness = 5;
  topHoleToTop = topThickness+4;

  sideAttachersWidth = 2.8;
  sideAttachersThickness = 1.5;
  sideAttachersLeftHeight = 12;

  intersectionWidth = c_tiw-(c_do7040w*2+sideThickness*4);
  intersectionHoleDiameter = 6.2;

  height = c_1u-0.2; //c_hdrh+topToMountHole;
  width = c_do7040w+sideThickness*2+intersectionWidth+sideMountWidth;

  module usff7040() {
    difference() {
      // TODO: should translate in main
      // USFF7040
      translate([0,0,(c_1u-c_do7040h)/2])
      cube([c_do7040w+m, c_do7040d, c_do7040h]);

      //
      translate([c_do7040w+m-sideAttachersThickness,0,0])
      #cube([sideAttachersThickness, sideAttachersWidth, c_do7040h]);

      // 
      translate([0,0,c_do7040h-sideAttachersLeftHeight])
      #cube([sideAttachersThickness, sideAttachersWidth, sideAttachersLeftHeight]);
    }
  }

  module caseConnector() {
    // Cut out for for connecting sides
    translate([0,a_depth/2,0])
    cube([intersectionWidth, a_depth, height]);

    // Hole 1 for connecting sides
    translate([intersectionWidth/2, a_depth, height/4])
    rotate([90,0,0])
    cylinder(d=intersectionHoleDiameter, h=a_depth);

    // Hole 2 for connecting sides
    translate([intersectionWidth/2, a_depth, height*3/4])
    rotate([90,0,0])
    cylinder(d=intersectionHoleDiameter, h=a_depth);
  }

  module serverRackMount() {
    // Side mount
    cube([sideMountWidth+m, a_depth-sideMountThickness, height]);

    // Hole 1 for mounting to server rack
    translate([(c_tw-c_wdrh)/2,a_depth,(height+holeDistance)/2])
    rotate([90,0,0])
    #cylinder(d=sideMountHoleDiameter, h=a_depth);

    // Hole 2 for mounting to server rack
    translate([(c_tw-c_wdrh)/2,a_depth,(height-holeDistance)/2])
    rotate([90,0,0])
    #cylinder(d=sideMountHoleDiameter, h=a_depth);
  }

  difference() {
    cube([width, a_depth, height]);

    serverRackMount();

    translate([sideMountWidth+sideThickness,0,0])
    usff7040();

    translate([width-intersectionWidth,0,0])
    caseConnector();


    /*
    union() {
      if (a_isLeft) {
        translate([0,sideMountThickness,0])
        cube([sideMountWidth+m, a_depth, height]);

        translate([sideMountWidth+sideThickness,0,-topThickness])
        difference() {

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
    */
  }
}

translate([-1,-1,0])
usff7040Case(20,true);

//translate([c_tw,20,0])
//rotate([180,180,0])
//usff7040(20,false);
