import 'package:expenses_tracker/pages/transaction.dart';
import 'package:flutter/material.dart';

class ExpenseAndIncomeItems extends StatelessWidget {
  const ExpenseAndIncomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return MyTransaction(
              transactionName: "item ${index+1}",
              money: "1000",
              expenseOrIncome: index%2==0?"expense":'income',
            );
          }),
    );
  }
}
