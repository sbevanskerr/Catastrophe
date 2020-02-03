public class GameState {
  
static final int DIAM = 48, SPD = 8, FPS = 60;
static final color BG = 0350;
 
GameState gs; 

Player p;
Wall Wall;
Enemy eCat, eCat2, eCat3;
Enemy kingKat;


int i = 180;
 
void setup() { 
 
  p = new Player(300, 800, DIAM, SPD);
  Wall = new Wall();
  eCat = new Enemy();
  eCat2 = new Enemy();
  eCat3 = new Enemy();
  kingKat = new Enemy();
  
  man = loadImage("man.png");
  slice = loadImage("manswing.png");
  bg = loadImage("background.png");
  door = loadImage("door.png");
  sideDoorL = loadImage("sideDoorL.png");
  sideDoorR = loadImage("sideDoorR.png");
  
  noFill();
  stroke(255);
  p.setup();
  eCat.setup(450, 450, p, 3, 113, 90, 2);
  eCat2.setup(width/2, 800, p, 4, 113, 90, 3);
  eCat3.setup(1200, 450, p, 4, 113, 90, 3);
  kingKat.setup(740, 415, p, 4, 200, 200, 5);
}
void draw() {
  if(p.health > 0 || !hasWon){
  if(roomNum == 1) {
    
    if(roomChanging) {
      frameRate(20);

      fill(i);
      i -= 20;
      println("Hello");
      //rect(0, 0, width, height);
      
      if(i<=0){
      roomChanging = false;
      i = 180;
      }
    }
    
  else if(!roomChanging) {
  frameRate(60);
  noFill();  
  background(bg);
  Wall.roomOne(p);
  
  image(door, 400, 195);

  p.move();
  p.display();
  eCat.display();
  //rect(400, 195, 96, 125);
  
  if(p.x >= 400 && p.x <= 496 && p.y <= 200 ){
    roomNum = 2;
    roomChanging = true;
    
      }
    }
 }
  
  if(roomNum == 2){  
    if(roomChanging) {

      fill(i);
      frameRate(20);
      i -= 20;
      println("Hello");
      rect(0, 0, width, height);
      
      if(i<=0){
        roomChanging = false;
      }
    }
    if(!roomChanging) {
    i = 180;
    frameRate(60);  
    noFill();
    background(bg);
    Wall.roomTwo(p);
    image(door, 410, 185);
    image(sideDoorR, 1640, 700);
    eCat2.display();
    eCat3.display();
    p.move();
    p.display();
    
    
    if(p.y >= 680 && p.y <= 730 && p.x >= 1620 ){
    roomNum = 3;
    roomChanging = true;
    i = 180;
      }
    }
  }
  
  if(roomNum == 3){
    
    if(roomChanging) {

      fill(i);
      frameRate(20);
      i -= 20;
      rect(0, 0, width, height);
      p.x = 220;
      
      if(i<=0){
        roomChanging = false;
      }
    }
    if(!roomChanging) {
    frameRate(60);  
    noFill();
    background(bg);
    Wall.roomThree(p);
    image(sideDoorL, 200, 700);
    image(door, 750, 185);
   
    p.move();
    p.display();
    kingKat.display();
    
    if(p.x >= 700 && p.x <= 800 && p.y <= 200 ){
    println("Onto 4");
    roomNum = 4;
    roomChanging = true;
    i = 180;
      }
    }
    
  }
  
  
  
  if(roomNum == 4){
    if(roomChanging) {

      fill(i);
      frameRate(20);
      i -= 20;
      rect(0, 0, width, height);
      
      if(i<=0){
        roomChanging = false;
        i = 180;
      }
    }
    if(!roomChanging && hasWon == false) {
    
    frameRate(30);  
    fill(i);
    rect(0, 0, width, height);
    background(bg);
    Wall.roomFour(p);
    p.move();
    p.display();
    i--;
    if(i == 0) {
    hasWon = true;
    }
    
    }
  }
  
 }
}
}
