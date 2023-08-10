import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/controller/auth_controller.dart';
import 'package:hotels_connect/views/screens/feature_screen/view_ticket.dart';
import 'package:hotels_connect/views/screens/widgets/booking_card.dart';

import '../../../constants.dart';
import '../../../main.dart';
import '../auth_screen/sign_up.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return firebaseAuth.currentUser == null
        ? Scaffold(
            body: Center(
              child: InkWell(
                onTap: () => Get.to(SignUp()),
                child: Container(
                  height: mq.height * 0.08,
                  width: mq.width * 0.9,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    "Login First",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("Booking"),
              elevation: 0,
            ),
            body: StreamBuilder(
              stream: firestore.collection('hotels').where("bookedBy", arrayContains: firebaseAuth.currentUser!.uid).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Get.to(ViewTicket(
                            postId: snapshot.data!.docs[index]["postId"],
                          ));
                        },
                        child: BookingCard());
                  },
                );
              }),
    );
  }
}
