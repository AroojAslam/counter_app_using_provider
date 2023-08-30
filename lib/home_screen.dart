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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(countProvider.count.toString(),style: TextStyle(fontSize: 50),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
