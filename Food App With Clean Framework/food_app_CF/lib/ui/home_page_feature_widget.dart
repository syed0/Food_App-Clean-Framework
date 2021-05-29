import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/bloc/bloc.dart';

import 'home_page_presenter.dart';

class HomePageFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodAppBloc>(create: (_) => FoodAppBloc(),
        child: HomePagePresenter());
  }
}


