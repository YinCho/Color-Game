
void intro() {
  gifs();

  //INTERFACE
  textSize(100);
  strokeWeight(2);
  fill(#DBC7BE);
  text("COLOUR GAME", 400, 200);
  tactileCircle(600, 600, 150, #D3AB9E);
  textSize(40);
  fill(#C1F7DC);
  text("START!", 600, 600);
}

void introClicks() {
  if (dist(600, 600, mouseX, mouseY) < 75) {
    mode = GAME;
  }
}

void gifs() {
  image(gif[f], 0, 0, width, height);
  f= f+1;

  if ( f == numberOfFrames) f=0;
}
