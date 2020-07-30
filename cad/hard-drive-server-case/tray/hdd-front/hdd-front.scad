/*

    HDD Front
    
    By Anton Augustsson


*/

use <hdd-front-lock.scad>;
use <hdd-front-latch.scad>;

$fn=90;  // accuracy

module hddFront (
    thumbDepth,
    thumbHeight,
    sliderHeight,
    lockLength,
    thickness,
    thicknessFront,
    trayHeight,
    trayWidth,
    trayFrontLength,
    hddWidth,
    hddLenght,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/

barWidth = 2;
numberOfBars = 24;
betweenBars = (trayWidth-barWidth*numberOfBars)
       /(numberOfBars-1);



/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
difference () {
union () {
   
// front back
cube(size = [
    trayWidth,
    trayFrontLength,
    trayHeight]);
    
}
union () {
// Removar for bars
for(i = [barWidth:betweenBars+barWidth:trayWidth-1])
    translate([i,trayFrontLength-1,thickness]) 
    cube(size = [
        betweenBars,
        thicknessFront+2,
        trayHeight-thickness*2]);

hddLock (
    thumbDepth+1,
    thumbHeight,
    sliderHeight,
    trayWidth-thickness,
    thickness,
    thicknessFront,
    trayHeight,
    trayWidth,
    trayLenght,
    hddWidth,
    hddLenght,
    thickness,-1,thickness*2
    );

hddLatch (
    thumbDepth,
    thumbHeight,
    sliderHeight,
    lockLength,
    thickness,
    thicknessFront,
    trayHeight,
    trayWidth,
    trayFrontLength,
    hddWidth,
    hddLenght,
    thickness,0,0
    );
    
// remove extra
translate([
    thickness,
    -1,
    thickness*3]) 
cube(size = [
    trayWidth-thickness*2,
    trayFrontLength,
    trayHeight-thickness*6]);

}
}}


    
/*
    ---------- Example ---------- 
*/


thicknessBottom = 2; 
thicknessFront = 2;
thickness = 1.5;

hddHeight = 26.1; 
hddWidth = 101.6;  // 4 inches
hddLenght = 147.32; // 5.8

trayHeight = hddHeight+thicknessBottom;
trayFrontLength = 15+thicknessFront; 
trayWidth = 105;
trayLenght = hddLenght+trayFrontLength;

thicknessSide = (trayWidth-hddWidth)/2;


sliderHeight = trayHeight-thickness*2;
thumbDepth = trayFrontLength-thicknessFront;
thumbHeight = sliderHeight-(thickness*2);

lockLength = 15;


x=0;
y=0;
z=0;


hddFront  (
    thumbDepth,
    thumbHeight,
    sliderHeight,
    lockLength,
    thickness,
    thicknessFront,
    trayHeight,
    trayWidth,
    trayFrontLength,
    hddWidth,
    hddLenght,
    x,y,z
    );