import 'package:clean_framework/clean_framework.dart';

class FoodViewModal{
  final String foodName;
  final String foodImage;
  int count = 0;
  bool isSelected = false;
  FoodViewModal(this.foodImage, this.foodName);
}

class FoodViewModalList extends ViewModel{
  @override
  List<Object> get props => [];
  final List<FoodViewModal> foodItemList;
  FoodViewModalList(this.foodItemList);
}
