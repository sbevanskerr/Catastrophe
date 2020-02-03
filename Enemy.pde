
class Enemy {
  int health;
  
  int startingX, startingY;
  int movingScale;
  int damageCooldown;
  
  int x, y;
  int eneW;
  int eneH;
  
  PImage sprite;
  PImage sprite2;
  PImage sprite3;
  
  Player player;
  
  int prevHit = 0 ;
  int currentHit = 0;
    
   void setup(int catX, int catY, Player p, int scale, int widthE, int heightE, int healthE) {
    x = catX;
    y = catY;
    
    player = p;
    
    movingScale = scale;
    
    startingX = x;
    startingY = y;
    
    eneW = widthE;
    eneH = heightE;
    
    health = healthE;
    
    sprite = loadImage("catSkeleton.png");
    sprite2 = loadImage("catSkeleton2.png");
    sprite3 = loadImage("kingKat.png");
  }
  
  void display() {
    if (health != 0) {
      
    if(roomNum == 3){
        image(sprite3, x, y);  
    }else if(movingScale < 0) {
      image(sprite, x, y);
    }
    else if(movingScale > 0) {
      image(sprite2, x, y);
    }

    catBehavior();
    
    if((sliceX + sliceW >= x) &&
        (sliceY + sliceH >= y) &&
        (sliceX <= x + eneW) &&
        (sliceY <= y + eneH)){
          
         
         currentHit = millis();
         
         if(currentHit >= prevHit + 300) {
         prevHit = currentHit;
 
         
         tint(100, 0, 0);

         if(facingLeft){
           x -= 100;
         }
         if(!facingLeft){
           x += 100;
         }
         
         if(x > startingX+200) {
           x = startingX+200;
         }
         if(x < startingX-200){
           x = startingX-200;
         }
         
         image(sprite, x, y);
         health--;
         damageCooldown = millis();
         tint(255);
           }
         }
        
     if((player.x + player.tempW >= x) &&
        (player.y + player.tempH >= y) &&
        (player.x <= x + eneW) &&
        (player.y <= y + eneH)){
          isHurt = true;
  
          int newVar = 10;
          while(newVar>0){
            newVar--;
          }
          player.x=player.x-20;
        }
    }

  }
  
  void catBehavior(){
    x += movingScale;
    if(x <= startingX-200 || x>= startingX+200){
      movingScale *= -1;
    }
  }
}
