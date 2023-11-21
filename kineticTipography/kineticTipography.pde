PFont font;
PImage bg;
PImage resizedBG;
PGraphics pg;

void setup() {
  size(800, 800, P2D);
  font = createFont("BlenderPro-Medium.otf", 600);
  bg = loadImage("bg.png");
  resizedBG = bg.get(); // Make a copy of the original background image
  resizedBG.resize(400, 200); // Resize the copy
  
  pg = createGraphics(800, 800, P2D);
  pg.beginDraw();
  pg.background(255); // Set the background color of the PGraphics canvas
  pg.endDraw();
}

void draw() {
  image(resizedBG, 0, 0);
  
  pg.beginDraw();
  pg.background(255); // Clear the PGraphics canvas
  pg.fill(0);
  pg.textFont(font);
  pg.textSize(210);
  pg.pushMatrix();
  pg.translate(0, height / 2 - 215);
  pg.textAlign(LEFT, LEFT);
  pg.text("2av\n2023\nrecap", 0, 0);
  pg.popMatrix();
  pg.endDraw();
  
  int tilesX = 50;
  int tilesY = 50;
  
  int tileW = int(width / tilesX);
  int tileH = int(height / tilesY);
  
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      int wave = int(sin(frameCount % width * 0.00005 * (x * y)) * 35);
      
      int sx = x * tileW + wave;
      int sy = y * tileH;
      int sw = tileW;
      int sh = tileH;
      
      int dx = x * tileW;
      int dy = y * tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
    }
  }
}
