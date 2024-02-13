import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.result,
      required this.message,
      required this.text});
  final double result;
  final String message;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    "شاخص وزنی شما",
                    style: TextStyle(
                      fontFamily: "SB",
                      fontSize: 22,
                      color: MyColors.blueColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircularSeekBar(
                        width: double.infinity,
                        height: 350,
                        progress: result,
                        maxProgress: 50,
                        barWidth: 22,
                        startAngle: 180,
                        sweepAngle: 360,
                        strokeCap: StrokeCap.round,
                        progressColor: MyColors.blueColor,
                        innerThumbRadius: 0,
                        innerThumbStrokeWidth: 0,
                        innerThumbColor: Colors.transparent,
                        outerThumbRadius: 0,
                        outerThumbStrokeWidth: 0,
                        outerThumbColor: Colors.transparent,
                        animation: true,
                      ),
                      Text(
                        result.toStringAsFixed(2),
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 90,
                          color: MyColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontFamily: "SB",
                        fontSize: 20,
                        color: MyColors.blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 16,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: MyColors.blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "برگشت",
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
        ),
      ),
    );
  }
}
