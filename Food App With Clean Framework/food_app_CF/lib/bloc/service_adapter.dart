
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:food_app/api/foodItems_response_modal.dart';
import 'package:food_app/api/foodItems_service.dart';
import 'package:food_app/core/restApi_service.dart';
import 'package:food_app/modal/foodItem_entity.dart';

class FoodServiceAdapter extends ServiceAdapter <FoodItemEntityList,JsonRequestModel, FoodItemsResponseModalList, FoodAppEitherService>{
  FoodServiceAdapter() : super(FoodAppEitherService(RestMethod.get,"food-items",RestApiService(baseUrl: 'https://192.168.29.25:3000/')));
  @override
  FoodItemEntityList createEntity(FoodItemEntityList initialEntity, FoodItemsResponseModalList responseModel) {
    List<FoodItemEntity> foodViewModalList = [];
    for(int i=0 ; i< responseModel.foodItemsResponseModalList.length; i++){
      foodViewModalList.add(FoodItemEntity(responseModel.foodItemsResponseModalList[i].foodImage, responseModel.foodItemsResponseModalList[i].foodName));
    }
    FoodItemEntityList foodItemEntityList = FoodItemEntityList(foodItemList: foodViewModalList);
    return foodItemEntityList;
  }

}