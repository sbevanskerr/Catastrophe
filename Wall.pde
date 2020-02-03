

class Wall{

  PImage room, room2, room3, room4;
  
  PImage log;
 

    
  Wall(){
    room = loadImage("startRoom.png");
    room2 = loadImage("room2.png");
    room3 = loadImage("room3.png");
    room4 = loadImage("room4.png");
    log = loadImage("log.png");
  }
  
  
   void drawLogs(Player player, int startPosX, int startPosY, int numLogs, int xChange, int yChange){ 
     
    PImage temp = log;
    int logX = startPosX;
    int logY = startPosY; 
    
    for(int i = 0; i < numLogs; i++){
      image(log, logX, logY);
      //rect(logX, logY, 60, 100);
      

       if((player.x + player.tempW > logX) &&
        (player.x < logX + 60) && 
        (player.y + player.tempH > logY) &&
         (player.y < logY + 100)){

           
           if((player.x + player.tempW > logX) && (player.x < logX + 60)){
             player.x = player.prevX;
           }
           
           if((player.y < logY + 100) && (player.y + player.tempH > logY)){
             player.y = player.prevY;
           }
         
     }
       
        PImage log2 = loadImage("log.png");
        logX += xChange;
        logY += yChange;
        temp = log2;
       }
   
   }
   //player, starting positions, no. logs, amount of change in x and y 
  void roomOne(Player player){
    image(room, 200, 120);
    drawLogs(player, 200, 700, 9, 100, 0); 
    drawLogs(player, 1100, 650, 2, 0, 50);
    //drawLogs(player, 1200, 500, 0, -60, 0);
    }
    
  void roomTwo(Player player){
    image(room2, 200, 120);
    drawLogs(player, 1250, 550, 4, -60, 60);
    drawLogs(player, 750, 350, 4, -60, 60);
    
  }
  
  void roomThree(Player player){
    image(room3, 200, 120);
  }
  
  void roomFour(Player player){
    image(room4, 200, 120);
  }
    
    
}
    
  //left, right, top, and bottom wall
  //number of doors
  //Floor tiles, possibly
  //recalibrate collision with walls for each Walls
  
  //do we want to deal with spawning items/enemies here or? 
  //Make enemies drop
  
  
  /*
  
  Possible game plan:
  Have this Wall class 
  Have the character within the bounds of the current Wall
  figure out a way for them to interact with the doors of the Wall
  once they hit a certain door, make if statements like if(door exists && interacted with)
  then based on that, make more if statements like if(current Wall == Wall1) or something, then make the next Wall the proper one by calling a Wall constructor
  Then redraw based on new Wall background
  */
