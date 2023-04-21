class Column {
  int x;
  int rectWidth;
  int rectHeight;
  int numberOfrects;
  
  public Column(int x, int rectWidth) {
    this.x = x;
    this.rectWidth = rectWidth;
    // this.rectHeight = rectHeight;
    // this.numberOfrects = numberOfrects;
  }

  public void randomCol(int rectHeight, int numberOfrects){
    this.rectHeight = rectHeight;
    this.numberOfrects = numberOfrects;
  }
  
  public void display(float opacity){
    for (int i=0; i<numberOfrects; i++) {
      fill(255, 255, 255, opacity);
      rect(x, random(height), rectWidth, rectHeight);
    }  
  }
}

public class Lines extends Scene {
  float opacity = 255;
  float fadeAmount;
  Column column;
  boolean high;
  int numberOfRectsPerColumn = 1;
  int numberOfColumns = 1;

  Lines() {
    reconfigure();
  }

  String getName() {
    return "lines";
  }

  void init(String oldSceneName) {
    background(0); 
  }

  void reconfigure() {
   for(int i = 1; i<=numberOfColumns; i++){
      int x1 = width/numberOfColumns * (i-1);
      int x2 = width/numberOfColumns;
      column = new Column(x1, x2);
    } 
  }

  void draw2d() {
    if (opacity <= 0) {
      noStroke();
      noFill();
    }
    reconfigure();
    column.randomCol((int)random(height/10), numberOfRectsPerColumn);
    column.display(opacity);
    opacity -= (1 - fadeAmount) * 40;
  }

  void postDraw(){ }

  void hit(HitData data) {
    float hitVal = data.oscHit;
    float a = data.oscA;
    float b = data.oscB;
    float c = data.oscC;
    float d = data.oscD;
    float fade = data.oscFade;

    high = hitVal > 0.5;
    numberOfColumns = 1;
    numberOfRectsPerColumn = (int) map(a, 0.0,1.0, 5,20);
    reconfigure();

    opacity = 255;
    fadeAmount = fade;
  }
}

// public class Lines2 extends Scene {
//   float opacity = 255;
//   float fadeAmount;
//   boolean high;
//   int t = 1;

//   String getName() {
//     return "lines2";
//   }

//   void init(String oldSceneName) {
//     frameRate(30);
//     // fullScreen();
//     // background(255); 
//   }

//   void draw2d() {
//     float x = 10 * abs(sin(radians(t)));
//     float y = 10 * abs(cos(radians(t)));
//     for (int i = 0; i < width; i++)  {
//           stroke(x*(sin(sin(t+i))));
//           line(i,0,i,height/2);
//           // stroke(y*(cos(t*sin(t+i))));
//           // line(i,height/2,i,height);
//     }
//     t++;
//   }

//   void postDraw(){
//   }

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
