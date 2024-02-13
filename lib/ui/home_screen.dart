import 'package:bmi_calculator/bloc/home/home_bloc.dart';
import 'package:bmi_calculator/bloc/home/home_event.dart';
import 'package:bmi_calculator/bloc/home/home_state.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/ui/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final TextEditingController weightController = TextEditingController();
final TextEditingController heightController = TextEditingController();
final TextEditingController ageController = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeResponseState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    result: state.result,
                    message: state.message,
                    text: state.text,
                  ),
                ),
              );
              weightController.text = "";
              heightController.text = "";
              ageController.text = "";
            }
          },
          builder: (cotnext, state) {
            if (state is HomeInitState) {
              return MainBody();
            }

            if (state is HomeResponseState) {
              return MainBody();
            }
            return Text("");
          },
        ),
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 40,
              ),
              headerSection(),
              const SizedBox(
                height: 40,
              ),
              GenderSection(),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenUtil().setHeight(175),
                    width: ScreenUtil().setWidth(150),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "وزن",
                            style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: weightController,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 60,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              hintText: "تایپ کنید",
                              hintStyle: TextStyle(
                                fontFamily: "SM",
                                fontSize: 18,
                                color: MyColors.backgroundColor,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.none,
                                  width: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(175),
                        width: ScreenUtil().setWidth(150),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "سن",
                                style: TextStyle(
                                  fontFamily: "SB",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: ageController,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "SB",
                                  fontSize: 60,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  hintText: "تایپ کنید",
                                  hintStyle: TextStyle(
                                    fontFamily: "SM",
                                    fontSize: 18,
                                    color: MyColors.backgroundColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.none,
                                      width: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 220,
                        width: ScreenUtil().setWidth(150),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "قد",
                              style: TextStyle(
                                fontFamily: "SB",
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: heightController,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "SB",
                                fontSize: 60,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                hintText: "تایپ کنید",
                                hintStyle: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 18,
                                  color: MyColors.backgroundColor,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.none,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.blueColor,
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                context.read<HomeBloc>().add(
                      HomeCalulateEvent(
                        int.parse(weightController.text),
                        int.parse(heightController.text),
                        int.parse(ageController.text),
                      ),
                    );
              },
              child: Text(
                "محاسبه کن",
                style: TextStyle(
                  fontFamily: "SM",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget headerSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        "😀 خوش آمدید",
        style: TextStyle(
          fontFamily: "SM",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "محاسبه گر شاخص وزن",
        style: TextStyle(
          fontFamily: "SB",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  bool isMaleTapped = false;
  bool isFemaleTapped = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isMaleTapped = true;
                isFemaleTapped = false;
              });
            },
            child: Container(
              width: ScreenUtil().setWidth(140),
              height: ScreenUtil().setHeight(50),
              decoration: BoxDecoration(
                color: isMaleTapped ? MyColors.blueColor : Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "مذکر",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: ScreenUtil().setSp(16),
                    color: isMaleTapped ? Colors.white : MyColors.blueColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMaleTapped = false;
                isFemaleTapped = true;
              });
            },
            child: Container(
              width: ScreenUtil().setWidth(140),
              height: ScreenUtil().setHeight(50),
              decoration: BoxDecoration(
                color: isFemaleTapped ? MyColors.blueColor : Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "مونث",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: ScreenUtil().setSp(16),
                    color: isFemaleTapped ? Colors.white : MyColors.blueColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
