// class Texts extends Scene {
//   PGraphics pg;
//   PFont font;
//   int tiles = 12;
//   int tilesX = 12;
//   int tilesY = 12;
//   float opacity = 255;
//   float fadeAmount;
//   boolean high;
  
//   int tileW = int(width/tilesX);
//   int tileH = int(height/tilesY);

//   String getName() {
//     return "texts";
//   }

//   public void settings() {
//     size(width, height, P2D);
//   }

//   void init(String oldSceneName) {
//     font = createFont("data/Taviraj-Black.ttf",250);
//     pg = createGraphics(width,height,P2D);
//     background(0);
//     pg.beginDraw();
//     pg.textFont(font);
//     pg.textSize(180);
//     pg.pushMatrix();
//     pg.translate(40,height / 3 + 50);
//     pg.fill(255, 0, 0);
//     pg.text("อนุ",0, 0);
//     pg.popMatrix();
//     pg.endDraw();
//   }

//   void draw2d() {
//     if (opacity <= 0) { return; }
//     pg.fill(255, 0, 0, opacity);
//     for (int x=0;x<tilesX;x++){
//       for (int y=0;y<tilesY;y++){
//         int waveX = int(sin(frameCount * 0.1 + (x*y)) * 30 );
//         // int waveY = int(cos(frameCount * 0.1 + (x*y)) * 30 );
//         // source
//         int sx = x * tileW + waveX;
//         int sy = y * tileH;
//         int sw = tileW * waveX;
//         int sh = tileH;
        
//         // dest
//         int dx = x * tileW;
//         int dy = y * tileH;
//         int dw = tileW;
//         int dh = tileH;
        
//         copy(pg,sx,sy,sw,sh,dx,dy,dw,dh);
//       }
//     }

//     opacity -= (1 - fadeAmount) * 40;
//   }

//   void postDraw(){}

//   void hit(HitData data) {
//     float hitVal = data.oscHit;
//     float a = data.oscA;
//     float b = data.oscB;
//     float c = data.oscC;
//     float d = data.oscD;
//     float fade = data.oscFade;

//     high = hitVal > 0.5;

//     opacity = 255;
//     fadeAmount = fade;
//   }
// }


class Texts extends Scene {
  PFont font;
  float opacity = 255;
  float fadeAmount;
  boolean high;
  int num = 70;
  int index = 0;
  int posY = 50;
  int offsetY = 10;
  String[] words = {"อนุภาค","อนุพันธ์","อนุชน","อนุวัต","อนุทิศ","อนุตร","อนุมูล","อนุศาสน์"};
  
  public void settings() {
    size(width, height, P2D);
  }

  String getName() {
    return "texts";
  }

  void init(String oldSceneName) {
    font = createFont("data/Taviraj-Black.ttf",250);
    textFont(font);
    textSize(200);
    fill(0, 0, 0);
    text(words[index],0, 0);
  }

  void draw2d() {
    if (opacity <= 0) { return; }
    fill(0, 255, 0, opacity);
    text(words[index],50, posY); 
    text(words[index],50, ( posY ) * offsetY + posY); 
    text(words[index],50, ( posY ) * offsetY * 2 - posY); 
    opacity -= (1 - fadeAmount) * 40;
  }

  void postDraw(){}

  void hit(HitData data) {
    float hitVal = data.oscHit;
    float a = data.oscA;
    float b = data.oscB;
    float c = data.oscC;
    float d = data.oscD;
    float fade = data.oscFade;

    high = hitVal > 0.5;

    index = (index + 1) % words.length;

    opacity = 255;
    fadeAmount = fade;
  }

}