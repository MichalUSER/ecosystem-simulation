class Genetic {
  ArrayList<HashItem> data = new ArrayList<HashItem>();
  HashItem bestHashItem = new HashItem(0, 0);
  
  void setBestHashItem() {
    int bestFitness = 0;
    float bestValue = 0;
    if(data.size() != 0) {
      for(HashItem hashItem : data) {
        if(hashItem.fitness > bestFitness) {
          bestFitness = hashItem.fitness;
          bestValue = hashItem.value;
        }
      }
    }
    bestHashItem.fitness = bestFitness;
    bestHashItem.value = bestValue;
  }
  
  float mutate() {
    int ranNum = int(random(1, 2));
    float bestValue = bestHashItem.value;
    if (ranNum == 1) {
        bestValue += (bestValue * random(0.1, 0.3));
    } else if(ranNum == 2) {
        bestValue -= (bestValue * random(0.1, 0.3));
    }
    return bestValue;
  }
}
