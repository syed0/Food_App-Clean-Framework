import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:food_app/bloc/bloc.dart';
import 'package:food_app/modal/view_modal.dart';
import 'home_page_screen.dart';

class HomePagePresenter extends Presenter<FoodAppBloc, FoodViewModalList, HomePageScreen>{
  @override
  HomePageScreen buildScreen(BuildContext context, FoodAppBloc bloc, FoodViewModalList viewModel) {
    return HomePageScreen(context: context,viewModel: viewModel,counterEvent:(value){
      bloc.counterPipe.send(value);
    });
  }
@override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
  @override
  Stream<FoodViewModalList> getViewModelStream(FoodAppBloc bloc) {
    return bloc.foodViewModalListPipe.receive;
  }
  @override
  sendViewModelRequest(FoodAppBloc bloc){
    bloc.event.launch();
  }
}