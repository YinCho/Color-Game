float randomMix = (float) random(0, 10);
int randomWord = (int) random(0, 7);
int randomColor = 0;

String[] words = {"RED", "YELLOW", "GREEN", "ORANGE", "BLUE", "GREY", "PURPLE"};
color[] colors = {red, yellow, green, orange, blue, grey, purple};


int score;



void game() {

  colorY = colorY + 3;
  //interface
  fill(black);
  rect(0, 0, 400, 800);
  fill(white);
  rect(400, 0, 400, 800);

  //PUZZLE
  fill(colors[randomColor]);
  text(words[randomWord], width/2, colorY);

  fill(blue);
  text("Score:" + score, 600, 100);
  fill(0);
  text("MATCH", 600, 700);
  fill(255);
  text("DON'T MATCH", 200, 700);

  guessingColors();

  colorY = colorY + timer;

  if (colorY > 800) {

    gameover();
  }
}

//FUNCTIONS

void gameClicks() {
  if (mouseX>0 && mouseX < 400 && mouseY>0 && mouseY<800) {
    guess = 2;
  } else if (mouseX>400 && mouseX <800 && mouseY>0 && mouseY<800) {
    guess = 1;
  }
}

void guessingColors() {
  if (randomWord == randomColor) {
    if (guess == MATCH || right) {
      randomPuzzle();
      points();
      right = false;
    }
    if (guess == NOMATCH|| left) {
      lose();
    }
    guess = 3;
  }
  if (randomWord != randomColor) {
    if (guess== NOMATCH || left) {
      randomPuzzle();
      points();
      left = false;
    }
    if (guess == MATCH || right) {
      lose();
      right = false;
    }
    guess = 3;
  }
}

void randomPuzzle() {
  randomMix = (float) random(0, 7);
  randomWord = (int) random(0, 7);

  if (randomMix <= 5) {
    randomColor = randomWord;
  }
  while (randomMix > 5 && randomColor == randomWord) {
    randomColor = (int) random(0, 7);
  }
}

void points() {
  score++;
  point.rewind();
  point.play();
  colorY = 0;
  timer= timer + 0.5;
}

void lose() {
  lose.rewind();
  lose.play();
  mode = GAMEOVER;
}
