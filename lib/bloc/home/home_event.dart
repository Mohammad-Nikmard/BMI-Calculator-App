abstract class HomeEvent {}

class HomeCalulateEvent extends HomeEvent {
  int weight;
  int height;
  int age;

  HomeCalulateEvent(this.weight, this.height, this.age);
}
