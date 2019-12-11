class BloopGenerator {
  ArrayList<Bloop> bloops = new ArrayList<Bloop>();
  Genetic genetic = new Genetic();
  FoodGenerator foodGenerator;
  int reproduceCounter = 0;

  BloopGenerator(FoodGenerator foodGeneratorNew) {
    foodGenerator = foodGeneratorNew;
    init();
  }
  
  void init() {
    for(int i = 0; i < 15; i++) {
      bloops.add(new Bloop(int(random(35, 100)), foodGenerator));
    }
  }
  
  void reproduce() {
    if(reproduceCounter == 480) {
      ArrayList<Bloop> newBloobs = new ArrayList<Bloop>();
      for(int i = 0; i < bloops.size(); i++) {
        Bloop bloop = bloops.get(i);
        if(bloop.startCounter == 510) {
          if(bloop.health > 140) {
            if(bloops.size() > 0) {
              for(Bloop bloop1 : bloops) {
                genetic.data.add(new HashItem(bloop1.score, bloop1.size));
              }
              genetic.setBestHashItem();
              genetic.data.clear();
              println("Best value: " + genetic.bestHashItem.value + ", Best fitness: " + genetic.bestHashItem.fitness);
              newBloobs.add(new Bloop(genetic.mutate(), foodGenerator));
            } else {
              newBloobs.add(new Bloop(int(random(35, 100)), foodGenerator)); 
            }       
            bloop.health -= 10;
            bloop.score += 10;
          }
        }
      }
      for(Bloop bloop : newBloobs) {
        bloops.add(bloop);
      }
      reproduceCounter = 0;
    } else if(bloops.size() == 0) {
      bloops.add(new Bloop(int(random(35, 100)), foodGenerator));
    }
    reproduceCounter++;
  }
  
  void showBloops() {
    for(Bloop bloop : bloops) {
      bloop.show();
    }
  }
  
  void checkBloopsHealth() {
    for(int i = 0; i < bloops.size(); i++) {
      Bloop bloop = bloops.get(i);
      if(bloop.health <= 0) {
        bloops.remove(i);
      }
    }
  }
  
  void show() {
    checkBloopsHealth();
    reproduce();
    showBloops();
  }
}
