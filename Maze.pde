public class Maze extends Scene {

  int rows = 50;
  int cols = 50;
  int maxRows = 75;
  int maxCols = 75;
  int minRows = 1;
  int minCols = 1;
  float cellHeight, cellWidth;
  boolean[][] cells;
  boolean[][] mahCells;
  float opacity = 255;
  float fadeAmount;
  boolean high;

  Maze() {
    cellHeight = height / (rows * 0.8);
    cellWidth = width / (cols * 0.8);
    reconfigure(0);
  }

  String getName() {
    return "maze";
  }

  void reconfigure(float mod) {
    //int count = 0;
    cells = new boolean[cols][rows];
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        //count++;
        cells[c][r] = random(0, 1) < mod;
      }
    }
  }

  void hit(HitData data) {

    float hitVal = data.oscHit;
    float a = data.oscA;
    float b = data.oscB;
    float c = data.oscC;
    float d = data.oscD;
    float fade = data.oscFade;

    high = hitVal > 0.5;
    //c = random(0, 1);
    cols = int(map(a, 0, 1, minCols, maxCols));
    rows = int(map(b, 0, 1, minRows, maxRows));
    cellHeight = height / (rows * 0.9);
    cellWidth = width / (cols * 0.9);

    reconfigure(0.5);
    opacity = 255;
    fadeAmount = fade;

    
  }


  void draw2d() {
    if (opacity <= 0) { return; }

    fill(255, 255, 255, opacity);
    strokeWeight(0);
    mahCells = cells.clone();

    for (int c = 0; c < mahCells.length; c++) {
      for (int r = 0; r < mahCells[c].length; r++) {
        boolean val = mahCells[c][r];
        if (val) {
          translate(c*cellWidth, r * cellHeight);
          drawThing();
          translate(-c*cellWidth, -r * cellHeight);
        }
      }
    }
    opacity -= (1 - fadeAmount) * 40;
  }

  void drawThing() {
    rect(-cellWidth/2, -cellHeight/2, cellWidth, cellHeight);
  }
}

// public class MazeB extends Maze {

//   MazeB() {
//     cellHeight = height / (rows * 0.8);
//     cellWidth = width / (cols * 0.8);
//     reconfigure(0);
//   }


//   String getName() {
//     return "mazeB";
//   }

//   void hit(HitData data) {

//     float hitVal = data.oscHit;
//     float a = data.oscA;
//     float b = data.oscB;
//     float c = data.oscC;
//     float d = data.oscD;
//     float fade = data.oscFade;

//     high = hitVal > 0.5;
//     // c = 1; //random(0, 1);
//     cols = int(map(a, 0, 1, minCols, maxCols));
//     rows = int(map(b, 0, 1, minRows, maxRows));
//     cellHeight = height / (rows * 0.9);
//     cellWidth = width / (cols * 0.9);

//     // fade = 1;
//     // d = 0.5; //random(0, 1);
//     reconfigure(c);
//     opacity = 255;
//     fadeAmount = fade;
//   }

//   void drawThing() {
//     textSize(cellHeight*0.75);

//     if (high) {
//       text("111", 0, 0, cellWidth, cellHeight);
//     } else {
//       text("000", 0, 0, cellWidth, cellHeight);
//     }
//   }
// }