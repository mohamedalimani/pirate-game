class attack{
float x,y,FOE ;
float shotDirection = PI/2 ;
PVector shootDir ;
attack(){
shootDir = new PVector(1.3,0) ;
}
void aimShell(){
if (changeShot == false)
shotDirection = -PI/2 ;
shootDir.rotate(player.Ship.heading()+shotDirection) ;
x = player.x ;
y = player.y ;
}
void drawShell(){
pushMatrix() ;
translate(x+=shootDir.x,y+=shootDir.y) ;
fill(255) ;
circle(0,0,5) ;
popMatrix() ;
}
void checkEnemyShot(){
FOE = dist(x,y,player.x,player.y) ;
if (FOE <=40){
player.lifeBar -= 10 ;
}
}
}
