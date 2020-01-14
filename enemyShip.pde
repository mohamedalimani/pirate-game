class enemyShip{
PImage Eship ;
float xShell,yShell,Dirproba,x,y,shipDist,sideGun ;
float angle = radians(PI/45) ;
boolean commenceAttack = true ;
PVector enemySpeed,enShotDir ; 
int Etone,Erest,EprevRest,rest ; 
enemyShip(){      
  enemySpeed = new PVector(random(0.2,0.3),0) ;// constructor
 Eship =loadImage("enemyship.png") ;
    x = random(37.5,762.5) ;
y = random(25,675) ;
enShotDir = new PVector(1,0) ;
sideGun = random(-0.34,0.34) ;
}

void moveEnemy(){
x += (enemySpeed.x)/1.6 ;
y += (enemySpeed.y)/1.6 ; 
DirTimer() ;
checkBounds() ;
}

void drawMe(){
   moveEnemy() ;
  pushMatrix() ;
  translate(x,y) ;
   rotate(enemySpeed.heading()) ;
 image(Eship,-25,-37.5,75,50) ;
 popMatrix() ;
 }

void DirTimer(){
 Etone = millis() ;
 Etone /=1000 ;
 Erest = Etone % 2 ;   
 if(Dirproba > 0.8)
   enemySpeed.rotate(angle+radians(PI/25)) ;
        if(Dirproba > 0.5)
   enemySpeed.rotate(-angle) ;
else if(Dirproba < 0.3)
  enemySpeed.rotate(angle) ;
 if(EprevRest != Erest) { 
   if (rest == 0)
      {
      Dirproba = random(0,1) ;
      }
 }
 EprevRest = Erest ;
}

boolean enemyScan(){
shipDist = dist(x,y,player.x,player.y) ;
//println("shipDist =",shipDist) ;
if(shipDist < 500)
 return true ;
 return false ;
}

boolean aimEnemy(){
if(((enemySpeed.heading()-0.349066 < player.Ship.heading())
&&(player.Ship.heading() < enemySpeed.heading()+-0.349066))||
((-enemySpeed.heading()-0.349066<player.Ship.heading())&&
(0.349066-enemySpeed.heading()>player.Ship.heading())))
return  true ;
return false ;
}
void enemyAttack(){
if ((enemyScan())&&(aimEnemy()&(commenceAttack))){
    enShotDir.rotate(enemySpeed.heading()+sideGun+PI/2) ;
    xShell = x ; 
    yShell = y ;
commenceAttack =! commenceAttack ;  
}
if(commenceAttack == false){
xShell += enShotDir.x  ;
yShell += enShotDir.y  ;
pushMatrix() ; 
translate(xShell,yShell) ;
fill(255) ;
circle(0,0,5) ;
popMatrix() ;
}
}

void stopAttack(){
if ((xShell>width)||(xShell<0)||
(yShell>height)||(yShell<0)){
  commenceAttack =! commenceAttack ;
  xShell = x ; 
  yShell = y ;
}
println("xShell =",xShell) ;
println("yShell =",yShell) ;
}

void checkBounds(){
 if (x-37.5>width) 
    x=-37.5 ;
 if (x+37.5<0)
    x = width+37.5 ;
 if (y-25>height)
    y = -25 ;
 if (y+25<0)
    y = height+25 ; 
}

}
