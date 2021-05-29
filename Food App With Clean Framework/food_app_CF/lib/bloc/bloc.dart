import 'package:clean_framework/clean_framework.dart';
import 'package:food_app/api/foodItems_service.dart';
import 'package:food_app/bloc/usecase.dart';
import 'package:food_app/modal/view_modal.dart';

class FoodAppBloc extends Bloc{
  FoodItemsUseCase _useCase;
  final Pipe<FoodViewModalList> foodViewModalListPipe = Pipe<FoodViewModalList>();
  final Pipe<Map<String,dynamic>> counterPipe = Pipe<Map<String,dynamic>>();
  final event = EventPipe();


  @override
  void dispose() {
    foodViewModalListPipe.dispose();
  }

  FoodAppBloc({FoodItemsUseCase foodItemsUseCase}) {
    _useCase = FoodItemsUseCase((viewModal) {
      foodViewModalListPipe.send(viewModal);
    });
    //foodViewModalListPipe.whenListenedDo(() => _useCase.create());
    event.listen(() {
      _useCase.create();
    });
    counterPipe.receive.listen((event) {
      _useCase.setCounter(event);
    });

    }

}