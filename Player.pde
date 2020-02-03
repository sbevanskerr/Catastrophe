  public class Player {
 
  boolean isLeft, isRight, isUp, isDown;
  
  int x, y, prevX, prevY;
  int health = 3;
  int heartX = 300;
  int heartW = 30;

  
  PImage heart;
  PImage leftWalk;
  PImage rightWalk;

  int walkTimer = 0;
  
  int tempW = 60;
  int tempH = 140;
  
  
  int counter = 0;
  final int d, v;
 
  Player(final int xx, final int yy, final int dd, final int vv) {
    x = xx;
    y = yy;
    d = dd;
    v = vv;
  }  
  
  void setup() {
    heart = loadImage("heart.png");
    leftWalk = loadImage("leftWalk.png");
    rightWalk = loadImage("rightWalk.png");
    gameOver = loadImage("gameOver.png");
    
    for(int i=0; i<60; i++){
    if(i<30) {
      walking[i] = leftWalk;
    }
    else{
      walking[i] = rightWalk;
      }
    }
 
    sliceW = 70;
    sliceH = 50;

  }
 
  void display() {
    
    if(x<170){
      x=170;
    }
    if(x>width-300){
      x=width-300;
    }
    
    if(y<200){
      y=200;
    }
    if(y>830){
      y=830;
    }
    
    if(!facingLeft) {
      //rect(x, y, tempW, tempH);
      if(isMoving){
         if(frameCount >= 60) {
           frameCount = 0;
         }
         
         image(walking[frameCount], x, y);
          }
          
      else if(!isMoving) {
    image(man, x, y);
      }
    }
    
    if(facingLeft) {
      //rect(x+20, y, tempW, tempH);
      if(isMoving){
         if(frameCount >= 60) {
           frameCount = 0;
         }
         pushMatrix();
         scale(-1.0, 1.0);
         image(walking[frameCount], -x-100, y);
         popMatrix();
          }
          
      else if(!isMoving) {
      pushMatrix();
      scale(-1.0, 1.0);
      image(man, -x-100, y);
      popMatrix();
      }
      
    }
    
    
    if(isAttacking){
      if(!facingLeft) {
        
      //rect(x, y, tempW, tempH);

      sliceX = x+80;
      sliceY = y+40;
      //rect(sliceX, sliceY, sliceW, sliceH);

      }
      else if(facingLeft){
      
      //rect(x + 20, y, tempW, tempH);
      sliceX = x-60;
      sliceY = y+40;
      //rect(sliceX, sliceY, sliceW, sliceH);
      }
    }
    
    if(millis() > startTime + 300) {
      
      man = loadImage("man.png");
      isAttacking = false;
      sliceX = 0;
   }
   
   if(isHurt == true){
     //background(0, 0, 100);
     tint(100, 0, 0);
     image(man, x, y);
     if(facingLeft){
       x += 100;
     }
     if(!facingLeft){
       x -= 100;
     }
     tint(255);
 

     isHurt = false;
     health--;
   }
   
   drawHealth();
   
   
    
  }
 
  void move() {
    final int r = d >> 1;
    prevX = x;
    prevY = y;
    x = constrain(x + v*(int(isRight) - int(isLeft)), r, width  - r);
    y = constrain(y + v*(int(isDown)  - int(isUp)),   r, height - r);
  }
  
  void drawHealth() {
    
    if(health == 1) {
      image(heart, 300, 25);
    }
    if(health == 2) {
      image(heart, 300, 25);
      image(heart, 400, 25);
    }
    if(health == 3) {
      image(heart, 300, 25);
      image(heart, 400, 25);
      image(heart, 500, 25);
    }
  }
 
  boolean setMove(final int k, final boolean b) {
    switch (k) {
    case +'W':
    case UP:
      return isUp = b;
 
    case +'S':
    case DOWN:
      return isDown = b;
 
    case +'A':
    case LEFT:
      facingLeft = true;
      return isLeft = b;
 
    case +'D':
    case RIGHT:
      facingLeft = false;
      return isRight = b;
 
    default:
      return b;
    }
  }
}
