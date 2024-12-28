import 'package:expenses_tracker/pages/stats_page.dart';
import 'package:flutter/material.dart';

import '../methods.dart';
import '../theme/colors.dart';
import '../widget/custom_text_form_field.dart';
import 'daily_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  RootAppState createState() => RootAppState();
}

class RootAppState extends State<RootApp> {
  final iconColor = const Color(0xFF2D6A4F);
  int currentIndex = 0;
  final _textControllerAMOUNT = TextEditingController();
  final _textControllerITEM = TextEditingController();
  final _dateController = TextEditingController();

  final amountKey = GlobalKey<FormState>();
  final descKey = GlobalKey<FormState>();
  final dateKey = GlobalKey<FormState>();
  bool _isIncome = false;

  void _newTransaction() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text('N E W  T R A N S A C T I O N'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Expense'),
                          Switch(
                            activeColor: const Color(0xFF2D6A4F),
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                          const Text('Income'),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: amountKey,
                              child: CustomTextFormField(
                                textControllerAMOUNT: _textControllerAMOUNT,
                                hintText: 'Amount?',
                                textInputType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: descKey,
                              child: CustomTextFormField(
                                textControllerAMOUNT: _textControllerITEM,
                                hintText: 'For What ?',
                                textInputType: TextInputType.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                                key: dateKey,
                                child: CustomTextFormField(
                                  textControllerAMOUNT: _dateController,
                                  hintText: "Select Date",
                                  onTap: () => selectDate(
                                      context: context,
                                      dateController: _dateController),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: const Color(0xFF2D6A4F),
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: const Color(0xFF2D6A4F),
                    child: const Text('Enter',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (amountKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  int pageIndex = 0;
  List<Widget> pages = [
    const DailyPage(),
    const StatsPage(),
    // const BudgetPage(),
    // const CreateBudgetPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _newTransaction();
          },
          backgroundColor: const Color(0xFF2D6A4F),
          child: const Icon(
            Icons.add,
            color: white,
            size: 25,
          )
          //params
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 8.0, // Spread of shadow
            offset: const Offset(0, -4), // Vertical offset (negative for shadow above)
          ),
        ],
      ),
      child: BottomAppBar(
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 37.0),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.calendar_today_outlined,
                color: currentIndex == 0
                    ? primary
                    : ThemeData.light().colorScheme.secondary,
              ),
              onPressed: () {
                currentIndex = 0;
                selectedTab(0);
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.query_stats,
                color: currentIndex == 1
                    ? primary
                    : ThemeData.light().colorScheme.secondary,
              ),
              onPressed: () {
                currentIndex = 1;
                selectedTab(1);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );

    //    backgroundColor: white,
    // currentIndex: pageIndex,
    // selectedItemColor: const Color(0xFF2D6A4F),
    // unselectedItemColor: Colors.black.withOpacity(0.5),
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
