class PlayerShip{ 
float x , y ;
PImage ship ;
PVector Ship ;
int lifeBar = 150 ;
int tone,rest,prevRest ;
PlayerShip(){
ship = loadImage("pirateship.png") ; 
x = width/2;
y = height/2 ;
Ship = new PVector(0.3,0) ;
}
void drawShip(float playerAngle){ 
pushMatrix() ; 
translate(x,y) ;
rotate(playerAngle) ; 
image(ship,-27.5,-27.5,80,55) ;
popMatrix() ; 
}
void updateStats(boolean isItOut){
       fill(0,255,0) ;
       rect(50,10,lifeBar,10,0,10,10,0) ; 
           if (isItOut){
       tone = millis() ;
       tone /=1000 ;
       rest = tone % 2 ;   
           if(prevRest != rest) { 
               if (rest == 0)
               {
               lifeBar -= 10 ;
               }
           }
           prevRest = rest ;
           } 
}
}
   
