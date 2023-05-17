// Andres Montano | 4/26/23 | Pong

Puck puck;

Paddle left;
Paddle right;
 int leftscore = 0;
int rightscore = 0;
String gameState;

void setup() {
  size(600, 400);
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
  gameState= "START";
  gameReset(); 
   
}

void draw() {
  clearBackground();
  if (gameState == "START") {
    startGame();
  } else if (gameState == "PLAY") {
    playGame();
  } else if (gameState == "LWIN") {
    leftWins();
  } else if (gameState == "RWIN") {
    rightWins();
  }
}

void startGame() {
  textAlign(CENTER);
  textSize(25);
  fill(255, 0, 0);
  text("WELCOME\nClick Anywhere to Play!", width/2, height/2- 100);
  textSize(20);
  fill(#0998D8);
  text("Player 1 Use (W/S)\n Player 2 Use (I/K)\n\n First to score 5 wins!", width/2, height/2 );

  if (mousePressed == true) {
    gameState = "PLAY";
  }
}

void playGame() {
  background(0, 0, 255);


  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);

  left.show();
  right.show();
  left.update();
  right.update();

  puck.update();
  puck.edges();
  puck.show();

  fill(255);
  textSize(50);
  text(leftscore, width/2 - 70, 50);
  text(rightscore, width/2 + 60, 50);

  if (leftscore == 5) {
    //Left paddle wins
    gameState = "LWIN";
  }
  if (rightscore == 5) {
    //Right paddle wins
    gameState = "RWIN";
  }
}

void leftWins () {
  clearBackground();
  fill(255, 255, 255);
  textAlign(CENTER);
  textSize(50);
  text( "Player 1 Wins!", width/2, height/ 2 - 30);
  fill(0, 0, 255);
  textSize(30);
 text( "Press (M) for Main Menu", width/2, height/ 2 + 65);
  //key press
  

  if(key == 'M' == true|| key == 'm' == true) {
     gameReset();
    gameState = "START"; 
  }
}

void rightWins() {
  clearBackground();
  fill(255, 255, 255);
  textSize(50);
  textAlign(CENTER);
  text( "Player 2 Wins!", width/2, height/ 2 - 30);
  fill(0, 0, 255);
  textSize(30);
  text( "Press (M) for Main Menu", width/2, height/ 2 + 65);
  //key press

  if(key == 'M' == true|| key == 'm' == true) {
   gameReset(); 
    gameState = "START"; 
  }
}


void gameReset() {
   size(600, 400);
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
  rightscore = 0;
  leftscore = 0; 
} 


void clearBackground() {
  fill(0);
  rect(0, 0, 50000, 50000);
}



void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 'W' || key == 'w') {
    left.move(-10);
  } else if (key == 'S' || key == 's') {
    left.move(10);
  }

  if (key == 'I' || key == 'i') {
    right.move(-10);
  } else if (key == 'K' || key == 'k')
    right.move(10);
}
