/*

    Door
    
    By Anton Augustsson


*/

$fn=90;  // accuracy

module hddMount (
    thicknessBottom,
    thicknessFront,
    thicknessSide,
    trayHeight,
    trayWidth,
    hddWidth,
    hddLenght,
    x,y,z,
    ){
/*
    ---------- Local varibles ---------- 
*/

sideWidth = 10;
crossWidth = 10;
frontWidth = sideWidth;

frontScrewDiameter= 3.1;
frontScrewCounterSinkDiameter=7;
hddScrewDiameter=3.1;
hddScrewCounterSinkDiameter=7;
pinDiameter=5;


positionHole1 = 60;
positionHole2 = positionHole1+44.5;
positionBetweenHole = 95;

/*
    ---------- Code ---------- 
*/

translate([
    x,
    y,
    z]) 
union () {

difference () {
union () {
// Left side 
translate([
    0,
    0,
    0]) 
cube(size = [
    thicknessSide,
    hddLenght,
    trayHeight]);

// Right side 
translate([
    trayWidth-thicknessSide,
    0,
    0]) 
cube(size = [
    thicknessSide,
    hddLenght,
    trayHeight]);

// Left Front
translate([
    0,
    -thicknessFront,
    0]) 
cube(size = [
    frontWidth,
    thicknessFront,
    trayHeight]);

// Right Front
translate([
    trayWidth-frontWidth,
    -thicknessFront,
    0]) 
cube(size = [
    frontWidth,
    thicknessFront,
    trayHeight]);

}


union () {
// no.1
union () {
translate([
    thicknessSide
    +(frontWidth-thicknessSide)/2,
    -(thicknessFront+1),
    trayHeight/2
    ])  
rotate([-90,0,0])
cylinder(
    h = thicknessFront+2,
    r2 = frontScrewCounterSinkDiameter/2,
    r1 = frontScrewDiameter/2
    );
}

// no.2
union () {
translate([
    trayWidth-thicknessSide
    -(frontWidth-thicknessSide)/2,
    -(thicknessFront+1),
    trayHeight/2
    ])  
rotate([-90,0,0])
cylinder(
    h = thicknessFront+2,
    r2 = frontScrewCounterSinkDiameter/2,
    r1 = frontScrewDiameter/2
    );
}
}}
    
// ---------- Bottom---------- 

difference () {
union () {
// Bottom 1
translate([
    thicknessSide,
    0,
    0]) 
cube(size = [
    hddWidth,
    crossWidth,
    thicknessBottom]);

// Bottom 2
translate([
    thicknessSide,
    positionHole1-crossWidth/2,
    0]) 
cube(size = [
    hddWidth,
    crossWidth,
    thicknessBottom]);

// Bottom 3
translate([
    thicknessSide,
    positionHole2-crossWidth/2,
    0]) 
cube(size = [
    hddWidth,
    crossWidth,
    thicknessBottom]);


// Bottom Left
translate([
    thicknessSide,
    0,
    0]) 
cube(size = [
    sideWidth,
    hddLenght,
    thicknessBottom]);

// Bottom Right
translate([
    thicknessSide+hddWidth-sideWidth,
    0,
    0]) 
cube(size = [
    sideWidth,
    hddLenght,
    thicknessBottom]);
}

// ---------- Holes ----------
union () {
    
// no.1    
union () {
translate([
    trayWidth/2
    -positionBetweenHole/2,
    positionHole1,
    -1
    ])  
cylinder(
    h = thicknessBottom+2,
    r1 = hddScrewCounterSinkDiameter/2,
    r2 = hddScrewDiameter/2
    );
}    

// no.2    
union () {
translate([
    trayWidth/2
    +positionBetweenHole/2,
    positionHole1,
    -1
    ])  
cylinder(
    h = thicknessBottom+2,
    r1 = hddScrewCounterSinkDiameter/2,
    r2 = hddScrewDiameter/2
    );
}

// no.3    
union () {
translate([
    trayWidth/2
    -positionBetweenHole/2,
    positionHole2,
    -1
    ])  
cylinder(
    h = thicknessBottom+2,
    r1 = hddScrewCounterSinkDiameter/2,
    r2 = hddScrewDiameter/2
    );
}

// no.4
union () {
translate([
    trayWidth/2
    +positionBetweenHole/2,
    positionHole2,
    -1
    ])  
cylinder(
    h = thicknessBottom+2,
    r1 = hddScrewCounterSinkDiameter/2,
    r2 = hddScrewDiameter/2
    );
}

}
}}}


    
/*
    ---------- Example ---------- 
*/


thicknessBottom = 2; 
thicknessFront = 2;

hddHeight = 26.1; 
hddWidth = 101.6;  // 4 inches
hddLenght = 147.32; // 5.8

trayHeight = hddHeight+thicknessBottom;
trayFrontLength = 15+thicknessFront; 
trayWidth = 105;
trayLenght = hddLenght+trayFrontLength;

thicknessSide = (trayWidth-hddWidth)/2;


x=0;
y=thicknessFront;
z=0;


hddMount (
    thicknessBottom,
    thicknessFront,
    thicknessSide,
    trayHeight,
    trayWidth,
    hddWidth,
    hddLenght,
    x,y,z
    );