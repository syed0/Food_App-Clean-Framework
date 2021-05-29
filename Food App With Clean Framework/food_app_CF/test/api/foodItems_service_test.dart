
import 'package:clean_framework/clean_framework.dart';
import 'package:food_app/api/foodItems_response_modal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/api/foodItems_service.dart';
import 'package:mockito/mockito.dart';

import '../Core/restapi.dart';

class MockService extends Mock implements FoodAppEitherService{

  String path;
  RestMethod method = RestMethod.get;
  RestApi restApi = MockRestApi();

  @override
  FoodItemsResponseModalList parseResponse(Map<String, dynamic> jsonResponse) {
    return FoodItemsResponseModalList([FoodItemsResponseModal(foodImage: "image1", foodName: "food1")]);
  }

}

void main() {
  test(' check parseMethod', () async {
    final service = MockService();
    Map<String, dynamic> jsonResponse = Map();
    final responseModal = service.parseResponse(jsonResponse);

    expect(responseModal, FoodItemsResponseModalList([FoodItemsResponseModal(foodImage: "image1", foodName: "food1")]));

  });
  test(' check request', () async {
    final service = MockRestApi();
    final response =  await service.request();

    expect(response.type,RestResponseType.success);

  });
}