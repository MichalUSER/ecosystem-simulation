class FoodGenerator {
  int counter = 0;
  int maxFood = 15;
  ArrayList<Food> foodList = new ArrayList<Food>();
  
  void generateFood() {
    if(counter == 20) {
      if(foodList.size() < maxFood) {
        foodList.add(new Food());
      }
      counter = 0;
    }
    counter++;
  }
  
  void showFood() {
    for(Food food : foodList) {
      food.show();
    }
  }
  
  void show() {
    generateFood();
    showFood();
  } 
}
