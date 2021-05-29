
import 'package:clean_framework/clean_framework.dart';

class FoodItemEntity{
  final String foodName;
  final String foodImage;
  FoodItemEntity(this.foodImage, this.foodName);
}

class FoodItemEntityList extends Entity{
   final List<FoodItemEntity> foodItemList;

   FoodItemEntityList({this.foodItemList});

   @override
  merge({errors}) {
    return FoodItemEntityList();
  }
}
