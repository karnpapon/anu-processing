abstract class Scene {
  String name;

  String getName() {
    return name;
  }

  void init(String oldSceneName) {
  }

  void draw() {
    hint(ENABLE_DEPTH_TEST);
    draw3d();
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
    hint(DISABLE_DEPTH_TEST);
    draw2d();
    postDraw();
  }

  void draw2d() {
  }

  void draw3d() {
  }
  
  void postDraw(){
  }

  void hit(HitData data) {
  }


}