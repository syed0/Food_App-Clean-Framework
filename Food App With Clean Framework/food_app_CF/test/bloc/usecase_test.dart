import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/bloc/usecase.dart';
import 'package:food_app/core/app_constants.dart';
import 'package:food_app/modal/foodItem_entity.dart';
import 'package:food_app/modal/view_modal.dart';
import 'package:mockito/mockito.dart';

import 'service_adapter_test.dart';


class MockUseCaseTest extends Mock implements FoodItemsUseCase{

  Function(FoodViewModalList) _viewModalCallback;
   RepositoryScope _scope;

  MockUseCaseTest(Function(FoodViewModalList) viewModalCallBack)
      :assert(viewModalCallBack != null),
        _viewModalCallback = viewModalCallBack;

  @override
  void create() async{
    _scope = AppConstants.instance.repository.containsScope<FoodItemEntityList>();
    if(_scope == null){
      _scope = AppConstants.instance.repository.create(FoodItemEntityList(), _notifySubscribers);

    }else{
      _scope.subscription = _notifySubscribers;
    }
    _scope.subscription(FoodItemEntityList());
  }

  void _notifySubscribers(entity){
    _viewModalCallback(_buildViewModal(entity));
  }
  FoodViewModalList _buildViewModal(FoodItemEntityList foodItemEntityList){

    List<FoodViewModal> data = [];


      data.add(FoodViewModal("image1", "food1"));

    return FoodViewModalList(data);
  }

}

void main() {
  test('UseCase init and created', () {
    final useCase = MockUseCaseTest((viewModel) {
      expect(viewModel, isA<FoodViewModalList>());
    });
    useCase.create();
  });
  test('UseCase init and re-created', () {
    final useCase = MockUseCaseTest((viewModel) {
      expect(viewModel, isA<FoodViewModalList>());
    });
    useCase.create();
    useCase.create();


  });
  test('UseCase repository created', () {
    final entity = FoodItemEntityList();
    AppConstants.instance.repository.create(entity, (_){}, deleteIfExists: true);
    final useCase = MockUseCaseTest((viewModal){
      final scope = AppConstants.instance.repository.containsScope<FoodItemEntityList>();
      final entity = AppConstants.instance.repository.get(scope);

      expect(entity, isA<FoodItemEntityList>());
      expect(viewModal, isA<FoodViewModalList>());
    });
    useCase.create();
  });
  test('Service Adapter response', () async {

    final useCase = MockUseCaseTest((viewModal){
      expect(viewModal, isA<FoodViewModalList>());
      expect(viewModal.foodItemList[0].foodName,"food1");
      expect(viewModal.foodItemList[0].foodImage,"image1" );
    });
    useCase.create();
    await AppConstants.instance.repository.runServiceAdapter(useCase._scope, MockServiceAdapter());

  });
}