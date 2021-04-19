import 'package:bmi/models/Workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/services/store.dart';
import 'package:bmi/Constants.dart';
import 'editWorkout.dart';



class ManageWorkout extends StatefulWidget {
  static String id = 'ManageWorkout';
  @override
  _ManageWorkoutState createState() => _ManageWorkoutState();
}

class _ManageWorkoutState extends State<ManageWorkout> {
  final _store = store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:StreamBuilder<QuerySnapshot>(
          stream: _store.loadWorkouts(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<Workout> workouts =[];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                workouts.add(Workout(
                  wId: doc.documentID,
                  wName: data[kWorkoutName],
                  wSetsNum: data [kWorkoutSetsNumber],
                  wDay: data [kWorkoutDay],
                  wPlan: data[kWorkoutPlan],
                  wGif: data[kWorkoutGif],));
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
                         Navigator.pushNamed(context, EditWorkout.id,arguments:workouts[index]);
                         
                       } ,
                   ),
                   MyPopupMenuItem(
                       child: Text('Delete'),
                       onClick:(){
                       _store.deleteWorkout(workouts[index].wId);
                       Navigator.pop(context);
                       } ,
                   ),
                 ]);
               },
               child: Stack(
                 children: <Widget>[
                   Positioned.fill(
                     child: Image(
                       fit: BoxFit.fill,
                       image: AssetImage(workouts[index].wGif),
                     ),
                   ),
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
                               Text(workouts[index].wName ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold),),
                               Text(workouts[index].wPlan ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                               Text(workouts[index].wSetsNum ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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

            itemCount: workouts.length,
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

