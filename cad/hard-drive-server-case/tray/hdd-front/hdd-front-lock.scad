/*

    Lock
    
    By Anton Augustsson


*/

$fn=90;  // accuracy

module hddLock (
    thumbDepth,
    thumbHeight,
    sliderHeight,
    lockLength,
    thickness,
    thicknessFront,
    trayHeight,
    trayWidth,
    trayLenght,
    hddWidth,
    hddLenght,
    x,y,z
    ){
/*
    ---------- Local varibles ---------- 
*/




/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
difference () {
union () {

// thumb lock
translate([
    0,
    0,
    0]) 
cube(size = [
    lockLength,
    thumbDepth,
    thumbHeight]);

// slider
translate([
    0,
    thumbDepth,
    -(sliderHeight-thumbHeight)/2]) 
cube(size = [
    lockLength,
    thickness,
    sliderHeight]);
}
union () {
// removal thum
translate([
    thickness*2,
    -1,
    thickness*2]) 
cube(size = [
    lockLength-thickness*4,
    thumbDepth+1,
    thumbHeight-thickness*4]);
    
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
thumbDepth = trayFrontLength
    -thicknessFront;
thumbHeight = sliderHeight-(thickness*2);

lockLength = 15;


x=0;
y=0;
z=0;


hddLock (
    thumbDepth,
    thumbHeight,
    sliderHeight,
    lockLength,
    thickness,
    thicknessFront,
    trayHeight,
    trayWidth,
    trayLenght,
    hddWidth,
    hddLenght,
    x,y,z
    );