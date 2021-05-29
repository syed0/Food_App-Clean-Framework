import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/bloc/bloc.dart';
import 'package:food_app/ui/home_page_feature_widget.dart';

void main() {
  testWidgets('CustomerWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<FoodAppBloc>(
          child: HomePageFeatureWidget(),
          create: (_) => FoodAppBloc(),
        )
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(HomePageFeatureWidget), findsOneWidget);
  });
}