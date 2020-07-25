/*

    Lock
    
    By Anton Augustsson


*/

$fn=90;  // accuracy

module hddLock (
    thumbDepth,
    sliderDepth,
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
union () {


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

thumbDepth = trayLenght/3*2;
sliderDepth = trayLenght/3;



x=0;
y=thicknessFront;
z=0;


hddLock (
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