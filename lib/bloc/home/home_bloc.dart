import 'package:bmi_calculator/bloc/home/home_event.dart';
import 'package:bmi_calculator/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  String? message;
  String? text;
  HomeBloc() : super(HomeInitState()) {
    on<HomeCalulateEvent>(
      (event, emit) {
        emit(HomeLoadingState());

        double result = (event.weight / (event.height * event.height)) * 10000;
        if (result <= 18.5) {
          message = "شما کمبود وزن دارید";
          text =
              "تلاش کنید تا وزن خود را به وزن ایده آل برسانید زیرا در غیر این صورت ممکن است دچار سوی تغذیه و مشکلاتی به دلیل نرسیدن غذای کافی به بدن شوید.";
        }
        if (result >= 18.5 && result < 25) {
          message = "وزن شما مناسب است";
          text =
              """داشتن نمره BMI در محدوده وزن سالم، نشانه خوبی است که شما وزن مناسبی برای قد خود دارید. اما همیشه به یاد داشته باشید که BMI چیزی در مورد آرایش بدنتان به شما نمی گوید - مانند اینکه چقدر عضله یا چربی دارید، چقدر فعالیت بدنی انجام می دهید یا نوع بدن شما.""";
        }
        if (result >= 25 && result < 30) {
          message = "شما اضافه وزن دارید";
          text =
              "اگر BMI شما در محدوده اضافه وزن باشد، ممکن است بیشتر در معرض خطر ابتلا به بیماری هایی مانند دیابت نوع 2، بیماری قلبی، سنگ کیسه صفرا و سرطان باشید.";
        }
        if (result >= 30 && result < 60) {
          message = "شما چاقی مفرط دارید !";
          text =
              "احتمال ابتلا به مشکلات سلامتی مرتبط با اضافه وزن می تواند افزایش یابد. موسسه ملی سرطان دریافته است که چاقی شدید می تواند امید به زندگی را بین 6 تا 13 سال کاهش دهد. شما باید با پزشک خود در مورد چگونگی کاهش وزن و پایین آوردن BMI خود به سطح سالم صحبت کنید.";
        }
        emit(HomeResponseState(result, message!, text!));
      },
    );
  }
}
