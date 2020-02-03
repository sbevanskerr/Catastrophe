//Catastrophe!
//---------------------------------------//
//Coding, Planning - Sam Bevans-Kerr
//Art, Coding - Allie Pearson
//Name of Cat - Taylor Mattson
//---------------------------------------//

GameState gs;

PImage man;
PImage slice;
PImage bg;
PImage catSkeleton;
PImage door;
PImage sideDoorL;
PImage sideDoorR;
PImage title;
PImage textSlide;
PImage gameOver;
PImage win;

int startTime = 0;
int attackCooldown = 0;
int roomNum;
int screenNum;

int sliceX;
int sliceY;
int sliceW;
int sliceH;



PImage[] walking = new PImage[60];

public boolean isAttacking = false;
public boolean facingLeft = false;
public boolean isHurt;

boolean isMoving;
boolean gameStart = false;
boolean readText = true;
boolean roomChanging = false;
boolean hasWon = false;

void setup(){
  //size(1920, 1080);
  fullScreen();
  smooth(3);
  gs = new GameState();
  gs.setup();
  roomNum = 1;
  screenNum = 0;
  title = loadImage("title.png");
  textSlide = loadImage("textSlide.png");
  gameOver = loadImage("gameOver.png");
  win = loadImage("win.png");
  image(title, 0, 0);
}

void draw(){
 
  if(gameStart && gs.p.health > 0) 
    gs.draw();
  if(gs.p.health == 0){
    image(gameOver, 0, 0);
  }
  if(hasWon){
    image(win, 0, 0);
  }
  
}

void keyPressed() {
  gs.p.setMove(keyCode, true);
  
  if(key == 'j' && millis()>attackCooldown+600) {
    man = slice;
    startTime = millis();
    println(startTime);
    isAttacking = true;
    attackCooldown = millis();
  }
  
  if(key == 'a' || key == 'd' || key == 'w' || key == 's'){
    isMoving = true;
  }
  
  
  if(key == ' ' && screenNum == 0){
    image(textSlide, 0, 0);
      screenNum++;

  }
  
  if(key == 'j' && screenNum == 1){
        //println("oh no");
        gameStart = true;
  }
   
  if(key == 'y'){
    roomChanging = true;
    roomNum = 2;
  }
  
  if((key == 't' && gs.p.health == 0) || key == 't' && hasWon == true){
    println("nice");
    gs = new GameState();
    gs.setup();
    roomNum = 1;
    screenNum = 0;
    gameStart = false;
    roomChanging = false;
    hasWon = false;
    image(title, 0, 0);
    
  }
}
 
void keyReleased() {
  gs.p.setMove(keyCode, false);
  
  if(key == 'a' || key == 'd' || key == 'w' || key == 's'){
    isMoving = false;
  }
}
