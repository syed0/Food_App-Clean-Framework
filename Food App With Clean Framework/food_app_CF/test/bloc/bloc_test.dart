import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/bloc/bloc.dart';
import 'package:food_app/modal/view_modal.dart';
import 'package:mockito/mockito.dart';
import 'usecase_test.dart';

class MockFoodBloc extends Mock implements FoodAppBloc{
  MockUseCaseTest _useCase;
  final Pipe<FoodViewModalList> foodViewModalListPipe = Pipe<FoodViewModalList>();
  final event = EventPipe();

  MockFoodBloc({MockUseCaseTest foodItemsUseCase}) {
    _useCase = MockUseCaseTest((viewModal) {
      foodViewModalListPipe.send(viewModal);
    });
    event.listen(() {
      _useCase.create();
    });
  }
}


void main() {
  test('Check for create method called of usecase', () {

    final bloc = MockFoodBloc();
    bloc.event.launch();
    bloc.foodViewModalListPipe.receive.listen(((model) {
      expect(model, isA<FoodViewModalList>());
      expect(model.foodItemList[0].foodName, "food1");
      expect(model.foodItemList[0].foodImage, "image1");

    }));
  });

}