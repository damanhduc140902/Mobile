// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/components/ButtonPrimary.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/screens/AddAccountScreen.dart';
import 'package:money_manager/screens/CategoryScreen.dart';
import 'package:money_manager/screens/LoginScreen.dart';
import 'package:money_manager/screens/RegisterScreen.dart';

void main() {
  // testWidgets('CategoryScreen', (WidgetTester tester) async {
  //   Widget testWidget = new MediaQuery(
  //       data: new MediaQueryData(),
  //       child: new MaterialApp(
  //         home: new CategoryScreen(title: 'Ngân sách'),
  //       ));
  //   await tester.pumpWidget(testWidget);
  //   expect(find.text('Thu nhập'), findsOneWidget);
  // });

  group('Category screen', () {
    Widget testWidget;
    testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: CategoryScreen(title: 'Chi phí')),
    );

    testWidgets('Test Chi phí button', (tester) async {
      await tester.pumpWidget(testWidget);
      Finder result;
      result = find.text('Chi phí');
      expect(result, findsOneWidget);
      await tester.tap(find.text('Chi phí'));
    });

    testWidgets('Test Thu nhập button', (tester) async {
      await tester.pumpWidget(testWidget);
      Finder result;
      result = find.text('Thu nhập');
      expect(result, findsOneWidget);
      await tester.tap(find.text('Thu nhập'));
    });
  });

  group('Login screen', () {
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: RegisterScreen(title: 'Login')),
    );

    testWidgets('Test login button #1', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byType(IconButton).first);
    });

    testWidgets('Test login button #2', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byType(ButtonPrimary).first);
    });
  });

  group('AddAccountScreen', () {
    Widget testWidget = const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
          home: AddAccountScreen(
        title: 'Addaccount',
      )),
    );

    testWidgets('Test them button', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byType(ButtonPrimary).first);
    });

    testWidgets('Test bieu tuong', (tester) async {
      await tester.pumpWidget(testWidget);
      Finder result = find.text('Biểu tượng');
      expect(result, findsOneWidget);
      await tester.tap(find.text('Biểu tượng'));
    });
  });
}
