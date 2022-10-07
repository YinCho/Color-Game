int highScore;
void gameover() {
  background(0);
  music.pause();
  tactileRect(450, 600, 300, 100, blue);
  fill(255);
  textSize(150);
  text("GAME OVER", 400, 200);
  textSize(75);
  text("Score:" + score, 400, 400);
  text("High Score:" + highScore, 400, 500);
  text("continue", 600, 650);
  if (score > highScore) {
    highScore = score;
  }
}

void gameoverClicks() {
  if (mouseX > 450 && mouseX < 750 && mouseY > 600 && mouseY < 700) {
    mode = INTRO;
    reset();
  }

}

void reset() {
  guess = 3;
  timer = 0;
  randomPuzzle();
  colorY = 0;
  score = 0;
}
