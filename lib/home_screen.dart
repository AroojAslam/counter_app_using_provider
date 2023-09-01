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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:MediaQuery.of(context).size.height *0.5,
              width: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
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
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                countProvider.setCount();
                countProvider.percent();
              },
              child: Container(
                height:MediaQuery.of(context).size.height *0.07,
                width: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('ADD',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        )
      ),
    );
  }
}
