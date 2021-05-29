import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:food_app/api/foodItems_service.dart';
import 'package:food_app/core/app_constants.dart';
import 'package:food_app/bloc/service_adapter.dart';
import 'package:food_app/core/restApi_service.dart';
import 'package:food_app/modal/foodItem_entity.dart';
import 'package:food_app/modal/view_modal.dart';

class FoodItemsUseCase extends UseCase{
  Function(FoodViewModalList) _viewModalCallback;
  RepositoryScope _scope;
  FoodItemsUseCase(Function(FoodViewModalList) viewModalCallBack)
  :assert(viewModalCallBack != null),
  _viewModalCallback = viewModalCallBack;

  void create() async{
    _scope = AppConstants.instance.repository.containsScope<FoodItemEntityList>();
    if(_scope == null){
      _scope = AppConstants.instance.repository.create(FoodItemEntityList(), _notifySubscribers);

    }else{
      _scope.subscription = _notifySubscribers;
    }
    await AppConstants.instance.repository.runServiceAdapter(_scope, FoodServiceAdapter());

  }

  void setCounter(Map<String, dynamic> data){
    if (data['CounterType'] == 'Increament'){
      increament(data);
    }else if (data['CounterType'] == 'Decreament'){
      decreament(data);
    }
    _viewModalCallback(data['ViewModal']);
  }


  void _notifySubscribers(entity){
    _viewModalCallback(_buildViewModal(entity));
  }
  void increament(Map<String, dynamic> data){
    final viewModal = data['ViewModal'];
    final index = data['index'];
    viewModal[index].count = viewModal[index].count + 1;
    if(viewModal[index].count != 0){
      viewModal[index].isSelected = true;
    }else{
      viewModal[index].isSelected = false;
    }
  }
  void decreament(Map<String, dynamic> data){
    final viewModal = data['ViewModal'];
    final index = data['index'];
    if (viewModal[index].count !=0) {
      viewModal[index].count = viewModal[index].count - 1;
    }else if(viewModal[index].count ==0){
      viewModal[index].isSelected = false;
    }

  }

  FoodViewModalList _buildViewModal(FoodItemEntityList foodItemEntityList){

    List<FoodViewModal> data = [];

    for(int i=0; i< foodItemEntityList.foodItemList.length; i++){
      data.add(FoodViewModal(foodItemEntityList.foodItemList[i].foodImage, foodItemEntityList.foodItemList[i].foodName));
    }
    return FoodViewModalList(data);
  }

}


