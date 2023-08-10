import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotels_connect/constants.dart';
import 'package:hotels_connect/controller/auth_controller.dart';
import 'package:hotels_connect/views/screens/widgets/button.dart';
import 'package:intl/intl.dart';
import '../../../main.dart';
class ViewTicket extends StatelessWidget {
  final String postId;
  const ViewTicket({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: mq.height * 0.9,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: mainColor),
          ),
          child: StreamBuilder(
            stream: firestore.collection("hotels").doc(postId).collection("bookedBy").where("uid",isEqualTo: firebaseAuth.currentUser!.uid).snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              return Column(
                children: [
                  SizedBox(height: mq.height * 0.02,),
                  Image.network(snapshot.data!.docs[0]['image'],height: 200,width: 200,fit: BoxFit.cover,),
                  SizedBox(height: mq.height * 0.04,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name",style: TextStyle(fontSize: 18),),
                            Text(snapshot.data!.docs[0]['name'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: mq.height * 0.03,),
                            Text("Check in",style: TextStyle(fontSize: 18),),
                            Text(DateFormat.yMMMd().format(snapshot.data!.docs[0]['checkIn'].toDate()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: mq.height * 0.03,),
                            Text("Hotel",style: TextStyle(fontSize: 18),),
                            Text(snapshot.data!.docs[0]['hotelName'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: mq.height * 0.03,),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone Number",style: TextStyle(fontSize: 18),),
                            Text("01756817983",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: mq.height * 0.03,),
                            Text("Check out",style: TextStyle(fontSize: 18),),
                            Text(DateFormat.yMMMd().format(snapshot.data!.docs[0]['checkOut'].toDate()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: mq.height * 0.03,),
                            Text("Guest",style: TextStyle(fontSize: 18),),
                            Text("3",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: mq.height * 0.03,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomButton(text: "Download Ticket"),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
