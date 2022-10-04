int highScore;
void gameover() {
  background(0);
  

  music.pause();


  textSize(150);
  text("GAME OVER", 400, 200);
  textSize(75);
  text("Score:" + score, 400, 400);
  text("High Score:" + highScore, 400, 500);
  if (score > highScore) {
    highScore = score;
  }
}

void gameoverClicks() {
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
    mode = INTRO;
  }
  if (mode == INTRO) { 
    score = 0;
    guess = 3;
    timer = 0;
    randomPuzzle();
    colorY = 0;
  }
}
