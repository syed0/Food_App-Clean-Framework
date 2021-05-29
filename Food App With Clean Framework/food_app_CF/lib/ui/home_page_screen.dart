import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modal/view_modal.dart';

class HomePageScreen extends Screen{
  final BuildContext context;
  final FoodViewModalList viewModel;
  final Function(Map<String,dynamic>) counterEvent;
  HomePageScreen({this.context,this.viewModel, this.counterEvent});
  @override
  Widget build(BuildContext context){
    return  ListView.builder(padding: EdgeInsets.fromLTRB(10, 12, 12, 10),
        itemCount: viewModel.foodItemList.length,
        itemBuilder: (BuildContext context, int index){
          return  FoodItemCell(indexForItem : index , foodItemDataList: viewModel.foodItemList, counterEvent: counterEvent);
        });
  }
}

class FoodItemCell extends StatelessWidget{
  final indexForItem;
  final foodItemDataList;
  final Function(Map<String,dynamic>) counterEvent;
  FoodItemCell({this.indexForItem,this.foodItemDataList,this.counterEvent});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[300],
      child: Column(children: [
        Image.asset(foodItemDataList[indexForItem].foodImage,
          height: 300,
          width: 300,) ,
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children : [
            Container(
              width: 100,
              child: Text(foodItemDataList[indexForItem].foodName,
                  style: TextStyle(fontWeight: FontWeight.w400,
                    fontSize: 20,)
              ),
            ),
            SizedBox(width: 30,),
            Container(
              child: Row(mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(onPressed: (){
                    counterEvent({'CounterType': 'Decreament','index': indexForItem,'ViewModal': foodItemDataList});
                  },
                      child: Text("-",
                          style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 40,)
                      )
                  ),
                  Text("${foodItemDataList[indexForItem].count}",
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,)
                  ),
                  FlatButton(onPressed: (){
                    counterEvent({'CounterType': 'Increament','index': indexForItem, 'ViewModal': foodItemDataList});
                  }, child: Text("+",
                      key: Key("PlusBtn"),
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 35,)
                  )
                  ),
                ], ),
            )
          ],)
      ],),
    );
  }
}