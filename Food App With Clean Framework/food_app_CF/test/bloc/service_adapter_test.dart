import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/api/foodItems_response_modal.dart';
import 'package:food_app/bloc/service_adapter.dart';
import 'package:food_app/modal/foodItem_entity.dart';
import 'package:mockito/mockito.dart';

import '../api/foodItems_service_test.dart';

class MockServiceAdapter extends Mock implements FoodServiceAdapter{


  @override
  FoodItemEntityList createEntity(FoodItemEntityList initialEntity, FoodItemsResponseModalList responseModel){
    List<FoodItemEntity> foodViewModalList = [FoodItemEntity(responseModel.foodItemsResponseModalList[0].foodImage, responseModel.foodItemsResponseModalList[0].foodName)];
    return FoodItemEntityList(foodItemList: foodViewModalList);
  }
}
void main() {
  test('Entity is created by service adapter', () {
    final entity = MockServiceAdapter().createEntity(
        FoodItemEntityList(),
        FoodItemsResponseModalList([FoodItemsResponseModal(foodImage: 'abc', foodName: 'abc')]));
    expect(
        entity,
        FoodItemEntityList());
  });
  test('test request', () {
    final service = MockService();
    final json = {"abc": "xyz"};
    final response = service.parseResponse(json);

    expect(response.foodItemsResponseModalList[0].foodImage, 'image1');
    expect(response.foodItemsResponseModalList[0].foodName, 'food1');

  });
}