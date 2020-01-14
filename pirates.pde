/*
ANY NEW MODIFICATIONS AND OTHER STUFF ARE NOTED HERE :
- first things first 
- ship stops immediatly when keyboard released  
                                                14/05/19         
- set lifeBar (player) for enemy hits 
                                                23/05/19
- took me 3 weeks exactly to reach this point it's the second game i make in my life
  dlilek mlak was the first one using openGl library and i wrote it in c or c++ i dunno
  still missing alot but i want to move on to other stuff now
  it was an awesome experience 
                             03/05/2019    to      24/05/2019
                                                
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*/
boolean isitDone = false  ;
int lifeBarE = 600 ;
float playerShot ;
int ShipsNum = 4 ;
ArrayList<enemyShip> ships= new ArrayList<enemyShip>() ;
boolean outOfAmmo = false ;
boolean changeShot = true ;
int shellNum ;
attack shell ;
PlayerShip player ;
boolean keyTable[] ;
float playerAngle ;
float angle = radians(PI/25) ;
PImage speech,fuckface, BG1,seaNigga; 
int textDelay,textRest,textprevRest,prevTextNum,textNum ; 
String s[] ; 
ArrayList <attack> shells = new ArrayList <attack>() ;

void setup(){
  size(800,700) ;
  frameRate(60) ;
  player = new PlayerShip() ;
  shell =new attack() ;
  keyTable = new boolean[128] ;
  playerAngle = 0 ;
  BG1 = loadImage("1.jpg") ;
  speech = loadImage("text.png") ;
  fuckface = loadImage("fuckface.jpg") ;
  seaNigga = loadImage("seanigga.jpg") ;
  shellNum = 0 ;
   for(int i = 0 ;i<ShipsNum;i++){
   ships.add(new enemyShip()) ;
   }
}

void draw(){
//image(BG1,0,0,width,height) ;
background(0,0,100) ;
for(int j = 0 ; j<shellNum ;j++){
  shells.get(j).drawShell() ;
 if ((shells.get(j).x>width)||(shells.get(j).x<0)||
(shells.get(j).y>height)||(shells.get(j).y<0)){
shells.remove(j) ;
shellNum-- ;
}
if (shells.size()>3){
  outOfAmmo = true ;
}
  else outOfAmmo = false ;
}
movePlayer() ;
player.drawShip(playerAngle) ;
image(fuckface,10,10,40,40) ; 
image(seaNigga,width-60,height-60,50,50) ; 
offScreen() ; 

player.updateStats(offScreen()) ;
 for(int h = 0; h<ShipsNum;h++){
  ships.get(h).drawMe() ;  
  ships.get(h).enemyAttack() ;
  ships.get(h).stopAttack() ;
  }
  checkHits() ;
}

void movePlayer(){
if (keyTable['z'])
{
player.x +=player.Ship.x ;
player.y +=player.Ship.y ;
}
if (keyTable['s']){ 
player.x -=(player.Ship.x)/1.8 ;
player.y -=(player.Ship.y)/1.8 ;
}
if (keyTable['d']){  
  player.Ship.rotate(angle)   ;
  playerAngle +=angle ;
}
if (keyTable['q']){  
  player.Ship.rotate(-angle)  ;
  playerAngle -=angle ;
}
}

void keyPressed(){                          
keyTable[key] = true ; 
}
void keyReleased(){
keyTable[key] = false ;
}
void keyTyped(){
  if (keyTable['f'])
changeShot =! changeShot ; 
  if (outOfAmmo == false ){
if (keyTable[32]){  
  shells.add(new attack()) ;
  shells.get(shellNum).aimShell() ;
  shellNum++ ;
} } }

boolean offScreen(){
boolean isItOut = false ; 
  if ((player.x>width)||(player.x<0)||
(player.y>height)||(player.y<0)) 
{
textSize(25) ;
fill(255,0,0) ;
text("COME BACK YOU COWARD !",300,40) ;
isItOut = true ;
}
return isItOut ;
}
void checkHits(){
   for(int j = 0 ;j <ShipsNum ; j++){
  for(int q = 0 ;q <shellNum ; q++){
playerShot = dist(shells.get(q).x,shells.get(q).y,ships.get(j).x,ships.get(j).y) ;
if (playerShot<= 35){
  if (isitDone == false){
lifeBarE -= 0.1 ;
isitDone =! isitDone ;   
}
if (playerShot <= 20 ){
shells.get(q).x = width+1 ;
  shells.get(q).y = height+1 ;
  }}
  else isitDone = false ;
//for (int p = 0 ; p<ShipsNum ; p++){
//}
}}
updateStatsE() ;
}
void updateStatsE(){
       fill(0,255,0) ;
       rect(width-lifeBarE-70,height-25,600-(600-lifeBarE),10) ;     
       if( lifeBarE <=0){
         pushMatrix() ; 
         translate(500,400) ;
         fill(255,0,0);
         textSize(60) ;
       text("VICTORY",-200,-100) ;
       delay(3000) ;
       popMatrix() ;
       }
           } 
