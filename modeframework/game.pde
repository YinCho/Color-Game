float randomMix = (float) random(0, 7);
int randomWord = (int) random(0, 7);
int randomColor = 0;

String[] words = {"RED", "YELLOW", "GREEN", "ORANGE", "BLUE", "GREY", "PURPLE"};
color[] colors = {red, yellow, green, orange, blue, grey, purple};

int score;

void game() {
  if (randomMix <= 4) {
    randomColor = randomWord;
  }
  while (randomMix > 4 && randomColor == randomWord) {
    randomColor = (int) random(0, 7);
  }


  fill(black);
  rect(0, 0, 400, 800);

  fill(white);
  rect(400, 0, 400, 800);

  colorY= colorY +3;

  fill(colors[randomColor]);
  text(words[randomWord], width/2, colorY);

  if (randomWord == randomColor) {
    if (guess== 1) {

      score++;
      randomPuzzle();
      point.rewind();
      point.play();

      colorY = 0;
      timer= timer + 0.5;
    }
    if (guess == 2) {
      lose.rewind();
      lose.play();

      mode = GAMEOVER;
    }
    guess = 3;
  }
  if (randomWord != randomColor) {
    if (guess==2) {
      randomPuzzle();
      score++;
      point.rewind();
      point.play();

      colorY = 0;
      timer= timer + 0.5;
    }
    if (guess == 1) {
      lose.rewind();
      lose.play();

      mode = GAMEOVER;
    }

    guess = 3;
  }
  fill(blue);
  text("Score:" + score, 600, 100);

  fill(0);
  text("MATCH", 600, 700);
  fill(255);
  text("DON'T MATCH", 200, 700);
  colorY = colorY + timer;
  if (colorY > 800) {

    gameover();
  }
}

void gameClicks() {
  if (mouseX>0 && mouseX < 400 && mouseY>0 && mouseY<800) {
    guess = 2;
  } else if (mouseX>400 && mouseX <800 && mouseY>0 && mouseY<800) {
    guess = 1;
  }
}

void randomPuzzle() {
  randomMix = (float) random(0, 7);
  randomWord = (int) random(0, 7);
}
