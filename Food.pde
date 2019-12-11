class Food {
  float x;
  float y;
  int size;
  
  Food() {
    init();
  }
  
  void init() {
    x = int(random(5, 1380));
    y = int(random(5, 830));
    size = int(random(5, 20));
  }
  
  void show() {
    fill(200);
    noStroke();
    circle(x, y, size);
  }
}
