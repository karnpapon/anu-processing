class Texts extends Scene {
  PFont font;
  float opacity = 0;
  float fadeAmount;
  boolean high;
  int num = 70;
  int index = 0;
  int posY = 50;
  int offsetY = 10;
  String[] words = {"อนุภาค","อนุพันธ์","อนุชน","อนุวัต", "อนุกรม", "อนุชา", "อนุตร","อนุมูล","อนุศาสน์"};
  
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
    fill(255, 255, 255, opacity);
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