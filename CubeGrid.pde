class CubeGrid extends Scene {

  int rows = 5;
  int cols = 5;
  int slots = 5;
  int minCols = 1;
  int maxCols = 9;
  int minRows = 1;
  int maxRows = 9;
  int minSlots = 1;
  int maxSlots = 9;
  int currentRow = 0, currentCol = 0, currentSlot = 0, shapeSize = 85;
  boolean reset = false;
  boolean high = false;
  float currentScale = 1;
  float fadeAmount = 0;

  Scene2Cell[][][] table;

  CubeGrid() {
    name = "cubeGrid";
    buildTable();
  }

  void init(String oldSceneName) {
    if (oldSceneName != "cubeGrid") {
      reset = true;
      //cam.reset(0);
    }
  }

  void buildTable() {
    currentRow = 0;
    currentCol = 0;
    currentSlot = 0;
    table = new Scene2Cell[cols][rows][slots];

    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        for (int s = 0; s < slots; s++) {
          table[c][r][s] = new Scene2Cell();
        }
      }
    }
  }

  void hit(HitData data) {

    float hitVal = data.oscHit;
    float a = data.oscA;
    float b = data.oscB;
    float c = data.oscC;
    float d = data.oscD;

    reset = true;

    int newCols = int(map(a, 0, 1, minCols, maxCols));
    int newRows = int(map(b, 0, 1, minRows, maxRows));
    int newSlots = int(map(c, 0, 1, minSlots, maxSlots));

    if (newCols != cols || newRows != rows || newSlots != slots) {
      rows = newRows;
      cols = newCols;
      slots = newSlots;
      buildTable();
    }

    if (currentRow == 0 && currentCol == 0 && currentSlot == 0) {
      buildTable();
    }

    high = hitVal > 0.5;
    fadeAmount = d;
    currentScale = 1;
  }

  void draw3d() {    
    if (currentScale < 0) return;
    if (reset) { reset = false; }
   
    background(0);
    directionalLight(126, 126, 126, 0, 0, -1);
    ambientLight(102, 102, 102);

    if (table == null) { return; }

    noStroke();
    translate(-cols/2*shapeSize + 500.0, -rows/2*shapeSize + 500.0, -slots/2*shapeSize);

    for (int slot = 0; slot < slots; slot++) {
      for (int col = 0; col < cols; col++) {
        for (int row = 0; row < rows; row++) {

          // safety!
          if (col >= cols || row >= rows || slot >= slots) return;

          noStroke();
          translate(col * shapeSize, row * shapeSize, slot * shapeSize);

          if (high) {
            fill(255);
            box(shapeSize *0.8 * currentScale);
          } else {
            fill(0, 255, 0);
            box(shapeSize * 0.8 * currentScale);
          } 

          translate(-col * shapeSize, -row * shapeSize, -slot * shapeSize);
        }
      }
    }
    translate(cols/2*shapeSize + 500.0, rows/2*shapeSize + 550.0, slots/2*shapeSize);
    currentScale -= fadeAmount*0.1;
  }
}

class Scene2Cell {


  Scene2Cell() {
  }
}