// TODO: See readme for the messurments
include <../utils/constants.scad>;

/* horizontalNodeCase
    Two mount a node horizontaly you can use two of these, one on each side.
    It has in total 8 holes that can be used to create any type of horizontal 
    case you want.

    cwi: case width inner
    cwo: case width outer
    chi: case height inner
    cho: case height outer
    cdt: case depth thickenss
*/
module horizontalNodeCase(cwi,cwo,chi,cho,cdt){
    dbh = 20; // Distance between hole
    dbsrmh = 83; // Distance between server rack mounting hole
    hh = 4; // hole hight
    w = 10; // width
    t = 4; // thickness
    pw = chi; // plate width
    pd = t+cdt+11+dbh+11; // plate depth
    pt = 4; // plate thickness

    // mounting holes (make a module for 4 holes with each are 20 appart)
    module mountingHoles(dbh, hh){
        hd = 3.2; // hole diameter

        cylinder(h=hh,d=hd);

        translate([0,dbh,0])
        cylinder(h=hh,d=hd);

        translate([dbh,0,0])
        cylinder(h=hh,d=hd);

        translate([dbh,dbh,0])
        cylinder(h=hh,d=hd);
    }

    // mounting hole plate 
    module mountingHolePlate(){
        difference(){
            cube([pt,pw,pd]);

            union(){
                translate([-1,11,dbh+t+cdt+11])
                rotate([0,90,0])
                mountingHoles(dbh, hh+2);

                translate([-1,11+20+13,dbh+t+cdt+11])
                rotate([0,90,0])
                mountingHoles(dbh, hh+2);
            }
        }
    }

    // rack server case mount
    module rackServerCaseMount(){
        hd = 3.2; // hole diameter

        difference(){
            cube([w,cho,t]);

            union(){
                translate([w/2,cho/2-dbsrmh/2,-1])
                cylinder(h=hh+2,d=hd);

                translate([w/2,cho/2+dbsrmh/2,-1])
                cylinder(h=hh+2,d=hd);
            }
        }
    }

    union(){
        rackServerCaseMount();

        translate([w/2-pt/2,cho/2-pw/2,0])
        mountingHolePlate();
    }
}

horizontalNodeCase(cwi,cwo,chi,cho,cdt);