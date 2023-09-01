import 'package:counter_app_using_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Center(
        child: Column(

          children: [
           Stack(
             children: [
               Container(
                 width:MediaQuery.of(context).size.width ,
                 height:MediaQuery.of(context).size.height *0.3,
                 decoration: BoxDecoration(
                     color: Theme.of(context).primaryColor.withOpacity(0.9),
                     borderRadius:const BorderRadius.only(bottomRight: Radius.circular(20),
                         bottomLeft: Radius.circular(20))
                 ),
                 child:const Center(child: Text('Counter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30))),
               ),
               Align(
                 heightFactor: 1.9,
                alignment:const Alignment(0,0),
                 child: Container(
                   height:MediaQuery.of(context).size.height *0.5,
                   width: 300,
                   decoration: BoxDecoration(
                     color: Theme.of(context).dialogBackgroundColor,
                     border: Border.all(
                       width: 2,
                       color: Theme.of(context).primaryColor,
                     ),
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child:Consumer<CountProvider>(builder: (context, value, child) {
                     return  CircularPercentIndicator(
                       progressColor: Theme.of(context).primaryColor,
                       radius: 110,
                       lineWidth: 19,
                       circularStrokeCap: CircularStrokeCap.round,
                       percent: countProvider.per.toDouble(),
                       center: Text(value.count.toString(),style:const TextStyle(
                         fontSize: 50,),
                       ),
                     );
                   }),
                 ),
               ),
               Positioned(
                 bottom: 10,
                 right: MediaQuery.of(context).size.width/2.5,

                 child: GestureDetector(
                   onTap: (){
                     countProvider.setCount();
                     countProvider.percent();
                   },
                   child: Container(
                     height:70,
                     width: 70,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Theme.of(context).dialogBackgroundColor,
                       border: Border.all(
                         width: 2,
                         color: Theme.of(context).primaryColor,
                       ),
                     ),
                     child:const Center(child: Icon(Icons.add)),
                   ),
                 ),
               ),
             ],
           ),
          ],
        )
      ),
    );
  }
}
