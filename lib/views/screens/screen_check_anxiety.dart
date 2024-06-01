import 'dart:developer';

import 'package:CareNow/helpers/constants.dart';
import 'package:CareNow/views/screens/screen_mental_health_results.dart';
import 'package:CareNow/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/check_mental_health.dart';

class ScreenCheckAnxiety extends StatelessWidget {
  List<Question> questionsList;
  String disorder;
  Rx<Answer> selectedAnswer = Rx<Answer>(Answer(option: '', score: 0));
  RxInt selectedIndex = 0.obs;
  RxInt userScore = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.greenAccent,
        title: Text(
          disorder,
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800, fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  selectedIndex.value = index;
                },
                itemCount: questionsList.length,
                itemBuilder: (BuildContext context, int index) {
                  // Question question = questionsList[selectedIndex.value];
                  return Column(
                    children: [
                      Obx(() {
                        return Text(
                          "Q ${selectedIndex.value +
                              1}: ${questionsList[selectedIndex.value]
                              .question}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: Colors.green.withOpacity(0.7)),
                        );
                      }),
                      Obx(() {
                        return RadioListTile(
                          value: questionsList[selectedIndex.value].a,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedAnswer.value,
                          onChanged: (value) {
                            selectedAnswer.value = value!;
                          },
                          title: Text(
                            questionsList[selectedIndex.value].a.option,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400
                            ),),
                        );
                      }),
                      Obx(() {
                        return RadioListTile(
                          value: questionsList[selectedIndex.value].b,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedAnswer.value,
                          onChanged: (value) {
                            selectedAnswer.value = value!;
                          },
                          title: Text(
                            questionsList[selectedIndex.value].b.option,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400
                            ),),
                        );
                      }),
                      Obx(() {
                        return RadioListTile(
                          value: questionsList[selectedIndex.value].c,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedAnswer.value,
                          onChanged: (value) {
                            selectedAnswer.value = value!;
                          },
                          title: Text(
                            questionsList[selectedIndex.value].c.option,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400
                            ),),
                        );
                      }),
                      Obx(() {
                        return RadioListTile(
                          value: questionsList[selectedIndex.value].d,
                          contentPadding: EdgeInsets.zero,
                          groupValue: selectedAnswer.value,
                          onChanged: (value) {
                            selectedAnswer.value = value!;
                          },
                          title: Text(
                            questionsList[selectedIndex.value].d.option,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400
                            ),),
                        );
                      }),
                    ],
                  ).marginSymmetric(horizontal: 25, vertical: 20);
                },
              )),
          Row(
            children: [
              Expanded(
                  child: Button(height: 5.h, text: "Stop", onPressed: () {}, color: Colors.greenAccent, textColor: Colors.black,)),
              SizedBox(
                width: 40,
              ),
              Expanded(
                  child: Obx(() {
                    return Button(height: 5.h, color: Colors.greenAccent, textColor: Colors.black, text: selectedIndex.value < questionsList.length - 1?"Next":"Submit", onPressed: () {
                      if (selectedAnswer.value.option != "") {
                        if (selectedIndex.value < questionsList.length - 1) {
                          selectedIndex.value++;
                          userScore.value =
                              userScore.value + selectedAnswer.value.score;
                          log(userScore.value.toString());
                          selectedAnswer.value = Answer(option: "", score: 0);
                        }
                        else {
                          Get.to(ScreenMentalHealthResults(disorder: disorder, score: userScore.value,));

                        }
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(
                                "Please select One Option At least")));
                      }
                    });
                  })),
            ],
          ).marginSymmetric(horizontal: 25, vertical: 20)
        ],
      ),
    );
  }

  ScreenCheckAnxiety({
    required this.questionsList,
    required this.disorder,
  });
}
