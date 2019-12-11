class Bloop {
  FoodGenerator foodGenerator;
  int counter = 0;
  int healthCounter = 0;
  int scoreCounter = 0;
  int startCounter = 0;
  int score = 0;
  float health = 200;
  float x;
  float y;
  float size;  
  float maxSize = 92;
  float vel;
  float minVel = 8;
  int direction = 1;
  
  Bloop(float sizeNew, FoodGenerator foodGeneratorNew) {
    size = sizeNew;
    foodGenerator = foodGeneratorNew;
    init();
  }
  
  void init() {
    x = int(random(10, 1200));
    y = int(random(10, 600));
    vel = minVel/(size/maxSize);
  }
  
  void changeDirection() {
    if(counter == 75) {
      int rand = int(random(1, 8));
      direction = rand;
      counter = 0;
    }
    counter++;
  }
  void move() {
    if(direction == 1) {
      y -= vel;
    } else if(direction == 2) {
      y -= vel;
      x += vel/2;
    } else if(direction == 3) {
      x += vel;
    } else if(direction == 4) {
      y += vel;
      x += vel/2;
    } else if(direction == 5) {
      y += vel;
    } else if(direction == 6) {
      y += vel;
      x -= vel/2;
    } else if(direction == 7) {
      x -= vel;
    } else if(direction == 8) {
      y -= vel;
      x -= vel/2;
    }
  }
  
  void foodCollision() {
    for(int i = 0; i < foodGenerator.foodList.size(); i++) {
      Food food = foodGenerator.foodList.get(i);
      if(food.x+(food.size/2) >= x-(size/2) && food.x-(food.size/2) <= x+(size/2)) {
        if(food.y+(food.size/2) >= y-(size/2) && food.y-(food.size/2) <= y+(size/2)) {
          if(health < 180) {
            health += 20;
          }
          foodGenerator.foodList.remove(i);
        }
      }
    } 
  }
  
  void screenCollision() {
    if(y <= 0) {
      direction = 5;
    } else if (x >= 1400) {
      direction = 6;
    } else if(y >= 850) {
      direction = 1;
    } else if(x <= 0) {
      direction = 3;
    }
  }
  
  void updateScore() {
    if(scoreCounter == 30) {
      score += 1;
      scoreCounter = 0;
    }
    scoreCounter++;
  }
  void showScore() {
    fill(255);
    textSize(20);
    text(score, x-10, y-(size+10));
  }
  
  void updateHealth() {
    if(healthCounter == 120) {
      if(health > 0) {
        health -= 20*(maxSize/size);
      }
      healthCounter = 0;
    }
    healthCounter++;
  }
  void showHealth() {
    if(health > 0) {
      fill(0, 0, 244);
      noStroke();
      rect(x-(size/2), y-size, size*(health/200), 16);
    }
  }
  
  void setStartCounter() {
    if(startCounter < 510) {
      startCounter++;
    }
  }
  
  void show() {
    setStartCounter();
    changeDirection();
    move();
    screenCollision();
    foodCollision();
    updateScore();
    showScore();
    updateHealth();
    showHealth();
    fill(255);
    noStroke();
    circle(x, y, size);
  }
}
