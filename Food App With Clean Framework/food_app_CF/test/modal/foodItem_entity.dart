import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/modal/foodItem_entity.dart';

void main() {
  test('AccountDetailEntity properties', () {
    final entity = FoodItemEntityList(foodItemList:[FoodItemEntity( 'abc',  'abc')]);


    expect(entity.foodItemList[0].foodName, 'abc');
    expect(entity.foodItemList[0].foodImage, 'abc');
  });
}