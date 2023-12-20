PFont font;
PImage bg;
PGraphics pg;

void setup() {
  size(800, 800, P2D);
  font = createFont("BlenderPro-Medium.otf", 600);
  bg = loadImage("bg.jpeg");
  pg = createGraphics(800, 800, P2D);
  pg.beginDraw();
  //pg.background(255); 
  pg.endDraw();
}

void draw() {
 
    background(bg);
  pg.beginDraw();
  pg.fill(255);
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
