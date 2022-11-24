import 'package:flutter/material.dart';
import 'package:money_manager/main.dart';
import 'package:provider/provider.dart';

import 'account_widget.dart';
import 'budget_screen.dart';
import 'category_screen.dart';
import 'column_chart.dart';
import 'contact_screen.dart';
import 'currency.dart';
import 'people.dart';
import 'reminder.dart';

enum Screen {
  budget,
  account,
  chart,
  category,
  payment,
  reminder,
  currency,
  setting,
  ads,
  share,
  rating,
  contact,
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: ApplicationState.getInstance, builder: (context, _) => Consumer<ApplicationState>( builder: (context, appState, _){
      switch (appState.mainScreen) {
        case Screen.budget:
          return BudgetScreen();
        case Screen.account:
          return AccountWidget(title: 'title');
        case Screen.chart:
          return ColumnChart(title: 'Biểu đồ');
        case Screen.category:
          return CategoryScreen(title: 'Danh mục');
        case Screen.payment:
          return PeoplePage();
        case Screen.reminder:
          return Reminder();
        case Screen.currency:
          return Currency(title: 'title');
        case Screen.setting:
          return PeoplePage();
        case Screen.ads:
          return PeoplePage();
        case Screen.contact:
          return ContactScreen(title: 'Liên hệ');
        default:
          return BudgetScreen();
      }
    }),);
  }
}
