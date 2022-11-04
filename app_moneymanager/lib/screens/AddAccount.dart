import 'package:flutter/material.dart';
import 'package:money_manager/src/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../components/NavigationDrawerWidget.dart';

class AddAccount extends StatelessWidget {
  final _accountNameController = TextEditingController();
  final _accountValueController = TextEditingController();


  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Thêm tài khoản'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: TextFormField(
                controller: _accountValueController,
                decoration: CommonStyle.textFieldStyle(
                    labelText: '', hintText: '0'),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
              child: TextFormField(
                controller: _accountNameController,
                decoration: CommonStyle.textFieldStyle(
                    labelText: 'Tên tài khoản', hintText: 'Nhập tên tài khoản'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nhập tên tài khoản';
                  }
                  return null;
                },
              ),
            ),
            ToggleSwitch(
              initialLabelIndex: 0,
              totalSwitches: 3,
              labels: ['💳', 'Canada', 'Mexico'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),

          ],
        ),
      );
}
