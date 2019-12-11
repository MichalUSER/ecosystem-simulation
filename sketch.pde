FoodGenerator foodGenerator;
BloopGenerator bloopGenerator;
void setup() {
  foodGenerator = new FoodGenerator();
  bloopGenerator = new BloopGenerator(foodGenerator);
  size(1400, 850);
}

void draw() {
  background(0);
  bloopGenerator.show();
  foodGenerator.show();
}
