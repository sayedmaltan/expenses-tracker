import 'package:expenses_tracker/pages/expense_and_income_items.dart';
import 'package:flutter/material.dart';

import '../json/day_month.dart';
import '../theme/colors.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  DailyPageState createState() => DailyPageState();
}

class DailyPageState extends State<DailyPage> {
  int activeDay = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 60,
            right: 20,
            left: 20,
            bottom: 20,
          ),
          child: Text(
            "Daily Transaction",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: black),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(
                                  days[index]['label'],
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: activeDay == index
                                          ? primary
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: activeDay == index
                                              ? primary
                                              : black.withOpacity(0.1))),
                                  child: Center(
                                    child: Text(
                                      days[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color:
                                          activeDay == index ? white : black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                ),
                const ExpenseAndIncomeItems(),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
