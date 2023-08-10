import 'package:flutter/material.dart';
import 'package:hotels_connect/views/screens/widgets/button.dart';

class ConfirmBooked extends StatelessWidget {
  const ConfirmBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Congratulation",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(
              "Your hotel book is confirmed!",style: TextStyle(fontSize: 20,color: Colors.black),
            ),
            SizedBox(height: 20,),
            Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flat_tick_icon.svg/768px-Flat_tick_icon.svg.png',height: 100,width: 100,),
            SizedBox(height: 20,),
            CustomButton(text: "See your ticket"),
          ],
        ),
      ),
    );
  }
}
