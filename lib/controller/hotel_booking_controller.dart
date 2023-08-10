import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/controller/auth_controller.dart';
import 'package:hotels_connect/views/screens/feature_screen/confirm_booked.dart';
import 'package:uuid/uuid.dart';

class HotelBooking extends GetxController{
  static HotelBooking instance = Get.put(HotelBooking());

  Future<void> BookedHotel(String name, String email, String phone,
      String guest, DateTime checkIn, DateTime checkOut, String doc,String hotelName, String hotelRent,String image) async {
    try{
        var ticketId = Uuid().v1();
        var docId = Uuid().v1();
        await firestore.collection('hotels').doc(doc).update({
          "bookedBy":FieldValue.arrayUnion([firebaseAuth.currentUser!.uid]),
        });
          await firestore.collection("hotels").doc(doc).collection("bookedBy").doc(docId).set({
            "name":name,
            "email":email,
            "guest":guest,
            "phone":phone,
            "uid":firebaseAuth.currentUser!.uid,
            "checkIn":Timestamp.fromDate(checkIn),
            "checkOut":Timestamp.fromDate(checkOut),
            "hotelName":hotelName,
            "hotelRent":hotelRent,
            "ticketId": ticketId,
            "docId": docId,
            "image":image,
          }).then((value) => Get.to(ConfirmBooked()));
        }catch(err){

        }
     }
}