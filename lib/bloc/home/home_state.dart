abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  double result;
  String message;
  String text;

  HomeResponseState(this.result, this.message, this.text);
}
