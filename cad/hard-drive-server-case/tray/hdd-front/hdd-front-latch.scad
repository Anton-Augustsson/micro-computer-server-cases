/*

    latch
    
    By Anton Augustsson


*/

$fn=90;  // accuracy

module hddLatch (
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


latchWidth = trayWidth;

latchThicnkess = thumbDepth-thickness*2;
lockWidth = 8;
lockLenght = 4;
        
rodDiameter = 4;
        
/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
rotate ([0,0,0])
difference () {
union () {
    
// Latch
translate([
    0,
    0,
    0]) 
cube(size = [
    latchWidth+lockWidth,
    latchThicnkess+lockLenght,
    trayHeight]);

/* Rod
translate([
    trayWidth-lockWidth*7/2,
    (latchThicnkess+lockLenght)/2,
    0])
cylinder(
    h = trayHeight,
    r = rodDiameter/2
    );
*/    
}

union () {
    
// Remove middle
translate([
    -1,
    thickness,
    thickness]) 
cube(size = [
    latchWidth+lockWidth+2,
    latchThicnkess+lockLenght,
    trayHeight-thickness*2]);

// Remove for lock
translate([
    latchWidth,
    -1,
    -1]) 
cube(size = [
    lockWidth+1,
    latchThicnkess+1,
    trayHeight+2]);

// Remove extra
translate([
    -1,
    latchThicnkess,
    -1]) 
cube(size = [
    latchWidth-lockWidth*2+1,
    lockLenght+1,
    trayHeight+2]);

// Removal triangle 1
translate([
    latchWidth-lockWidth,
    latchThicnkess+lockWidth,
    -1]) 
rotate ([0,0,180]) 
difference () {
cube(size = [
    lockWidth,
    lockWidth,
    trayHeight+2]);
translate([
    0,
    0,
    -1]) 
rotate ([0,0,45]) 
cube(size = [
    lockWidth*sqrt(2),
    lockWidth,
    trayHeight+4]);    
}

// Removal triangle 2
translate([
    latchWidth-latchThicnkess,
    0,
    -1]) 
difference () {
cube(size = [
    latchThicnkess,
    latchThicnkess,
    trayHeight+2]);
translate([
    0,
    0,
    -1]) 
rotate ([0,0,45]) 
cube(size = [
    latchThicnkess*sqrt(2),
    latchThicnkess,
    trayHeight+4]); 
}

// Remove Rod
translate([
    trayWidth-lockWidth*7/2,
    (latchThicnkess+lockLenght)/2,
    -1])
cylinder(
    h = trayHeight+2,
    r = rodDiameter/2
    );

}}}


    
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
thumbDepth = trayFrontLength
    -thicknessFront;
thumbHeight = sliderHeight-(thickness*2);

lockLength = 15;


x=0;
y=0;
z=0;


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
    x,y,z
    );