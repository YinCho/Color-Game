void keyPressed() {
  if (keyCode == LEFT) {
    left = true;
  } 
  if (keyCode == RIGHT) {
    right = true;
  }
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}

boolean touchingRect(int x, int y, int w, int h) {
  if (mouseX >x && mouseX<x+w&& mouseY > y && mouseY<y+h) {
    return true;
  } else {
    return false;
  }
}

boolean touchingCircle(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r/2) {
    return true;
  } else {
    return false;
  }
}

void tactileRect(int x, int y, int w, int h, color f) {
  fill(f);
  if (touchingRect(x, y, w, h)) {
    stroke(255);
  } else {
    stroke(0);
  }
  rect(x, y, w, h);
}

void tactileCircle(int x, int y, int r, color f) {
  fill(f);
  if (touchingCircle(x, y, r)) {
    stroke(255);
  } else {
    stroke(0);
  }
  circle(x, y, r);
}
