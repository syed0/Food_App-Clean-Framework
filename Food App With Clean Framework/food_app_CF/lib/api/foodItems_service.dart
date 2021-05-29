import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'foodItems_response_modal.dart';

class FoodAppEitherService extends EitherService<JsonRequestModel, FoodItemsResponseModalList>{
  String path;
  RestMethod method;
  RestApi restApi;
  FoodAppEitherService( RestMethod method,
      this.path,
       RestApi restApi): super(method: method, path: path, restApi: restApi);

  @override
  FoodItemsResponseModalList parseResponse(Map<String, dynamic> jsonResponse) {
   final foodItemsResponseModalList = FoodItemsResponseModalList([]);
   foodItemsResponseModalList.setData(jsonResponse);

   return foodItemsResponseModalList;

  }

}

