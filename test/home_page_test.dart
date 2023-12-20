import 'package:e_commerce/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('HomeView should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomeView(),
      ),
    );

    expect(find.text('Product'), findsOneWidget);

    expect(find.text('INI \nADMIN'), findsOneWidget);

    expect(
        find.text('You can create, read, update, and delete'), findsOneWidget);

    expect(find.text('Find More'), findsOneWidget);
    expect(find.text('Other Product'), findsOneWidget);

    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
