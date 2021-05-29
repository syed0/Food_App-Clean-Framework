import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/modal/view_modal.dart';

void main() {
  test('AccountDetailEntity properties', () {
    final entity = FoodViewModalList([FoodViewModal( 'abc',  'abc')]);


    expect(entity.foodItemList[0].foodName, 'abc');
    expect(entity.foodItemList[0].foodImage, 'abc');
    expect(entity.foodItemList[0].isSelected, false);
    expect(entity.foodItemList[0].count, 0);
  });
}