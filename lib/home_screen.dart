import 'package:counter_app_using_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(builder: (context, value, child) {
            return  Text(value.count.toString(),style: TextStyle(
                fontSize: 50,color: Colors.primaries[value.generatedColor]
              ),);
            },)
          ],
        )
      ),
      floatingActionButton: Consumer<CountProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          backgroundColor: Colors.primaries[value.generatedColor],
          onPressed: (){
            countProvider.setCount();
            countProvider.setcolor();
          },
          child: Icon(Icons.add),
        );
      },)
    );
  }
}
