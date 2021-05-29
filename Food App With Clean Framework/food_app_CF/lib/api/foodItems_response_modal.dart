import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class FoodItemsResponseModal{
  final String foodName;
  final String foodImage;

  FoodItemsResponseModal({this.foodName,this.foodImage});
}

class FoodItemsResponseModalList extends JsonResponseModel{
   List<FoodItemsResponseModal> foodItemsResponseModalList = [];
  FoodItemsResponseModalList(this.foodItemsResponseModalList);

  @override
  List<Object> get props => [];

  void setData(Map<String, dynamic> json){
    final foodItems = json['foodItems'];
    for(int i = 0 ; i< foodItems.length; i++){
      final foodItem = foodItems[i];
      foodItemsResponseModalList.add(FoodItemsResponseModal(foodImage: foodItem['foodImage'], foodName: foodItem['foodName']));
    }

  }
}