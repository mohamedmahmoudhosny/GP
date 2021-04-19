import 'package:bmi/admin_screens/editmeal.dart';
import 'package:bmi/models/Meals.dart';
import 'package:bmi/models/Meals.dart';
import 'package:bmi/models/Workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/services/store.dart';
import 'package:bmi/Constants.dart';
import 'editWorkout.dart';

class ManageMeal extends StatefulWidget {
  static String id = 'ManageMeal';
  @override
  _ManageMealState createState() => _ManageMealState();
}

class _ManageMealState extends State<ManageMeal> {
  final _store = store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      StreamBuilder<QuerySnapshot>(
        stream: _store.loadMeal(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<Meal> meal =[];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              meal.add(Meal(
                mId: doc.documentID,
                mName: data[kmealname],
                mType: data [kmealtype],
                mDay: data [kmealDay],
                mPlan: data[kmealPlan],
              ));
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2 , childAspectRatio: .8 ),
              itemBuilder: (context , index) =>Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                child: GestureDetector(
                  onTapUp: (details){
                    double dx =details.globalPosition.dx;
                    double dy =details.globalPosition.dy;
                    double dx2 =MediaQuery.of(context).size.width-dx;
                    double dy2 =MediaQuery.of(context).size.width-dy;
                    showMenu(context: context, position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                        items: [
                          MyPopupMenuItem(
                            child: Text('Edit'),
                            onClick:(){
                              Navigator.pushNamed(context, EditMeal.id,arguments:meal[index]);

                            } ,
                          ),
                          MyPopupMenuItem(
                            child: Text('Delete'),
                            onClick:(){
                              _store.deleteMeal(meal[index].mId);
                              Navigator.pop(context);
                            } ,
                          ),
                        ]);
                  },
                  child: Stack(
                    children: <Widget>[
                    /*  Positioned.fill(
                        child: Image(
                          fit: BoxFit.fill,
                         // image: AssetImage(meal[index].wGif),
                        ),
                      ),*/
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .9,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(meal[index].mName ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold),),
                                  Text(meal[index].mPlan ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text(meal[index].mType ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text(meal[index].mDay ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              itemCount: meal.length,
            );}else{

            return Center(child: Text('Loading...'));
          }
        },
      ),


    );
  }

}

class MyPopupMenuItem <T>extends PopupMenuItem<T>{
  final Widget child ;
  final Function onClick;
  MyPopupMenuItem({@required this.child , @required this.onClick}):
        super(child : child);
  @override
  PopupMenuItemState<T,PopupMenuItem<T>> createState(){
    return MyPopupMenuItemState();
  }

}

class MyPopupMenuItemState<T,PopupMenuItem> extends PopupMenuItemState<T,MyPopupMenuItem<T>>{

  @override
  void handleTap() {
    widget.onClick();
  }
}


