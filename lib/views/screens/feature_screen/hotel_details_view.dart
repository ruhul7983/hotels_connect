import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotels_connect/constants.dart';
import 'package:hotels_connect/model/hotels_model.dart';
import 'package:hotels_connect/views/screens/auth_screen/sign_up.dart';
import '../../../main.dart';
import 'book_now_selectDate.dart';

class HotelDetailsView extends StatelessWidget {
  final Hotels hotels;
  const HotelDetailsView({Key? key, required this.hotels,}) : super(key: key);
  
  Facilities(Icon icon, String text){
      return Padding(
        padding: const EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 5),
        child: Column(
          children: [
            icon,
            Text(text,style: TextStyle(fontSize: 12),),
          ],
        ),
      );    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: mq.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(hotels.image![0]),
                    ),
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 10,
                    child: InkWell(
                        onTap: ()=>Get.back(),
                        child: Icon(Icons.arrow_back,color: Colors.black,))),
              ],
            ),
            SizedBox(height: mq.height * 0.005,),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hotels.hotelName!,style: TextStyle(color: Colors.black,fontSize: 34,fontWeight: FontWeight.w700),maxLines: 1,),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, color: mainColor,),
                      Text(hotels.location!,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: mq.height * 0.01,),
                  Divider(height: 10,color: Colors.black,thickness: 1),
                  SizedBox(height: mq.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gallery Photos",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
                      Text("See all",style: TextStyle(fontSize: 19,color: mainColor),),
                    ],
                  ),
                  SizedBox(height: mq.height * 0.01,),
                  Container(
                    height: 115,
                    width: 135,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: hotels.image!.length,
                      itemBuilder: (context, index) {
                      return Container(
                        height: 107,
                        width: 135,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(hotels.image![index]),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },),
                  ),

                  SizedBox(width: mq.width * 0.01,),
                  SizedBox(height: mq.height * 0.02,),
                  Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  Text(hotels.description!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                  SizedBox(height: mq.height * 0.02,),
                  Text('Facilities',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  Wrap(
                    children: [
                      hotels.swimmingPool=="yes"?Facilities(Icon(Icons.pool,color: mainColor,), "Swimming pool"):Facilities(Icon(Icons.pool,color: Colors.grey,), "Swimming pool"),
                      hotels.wifi =="yes"?Facilities(Icon(Icons.wifi,color: mainColor,), "WiFi"):Facilities(Icon(Icons.wifi,color: Colors.grey,), "WiFi"),
                      hotels.restaurant =="yes"?Facilities(Icon(Icons.restaurant,color: mainColor,), "Restaurant"):Facilities(Icon(Icons.restaurant,color: Colors.grey,), "Restaurant"),
                      hotels.parking =="yes"?Facilities(Icon(Icons.local_parking_sharp,color: mainColor,), "Parking"):Facilities(Icon(Icons.local_parking_sharp,color: Colors.grey,), "Parking"),
                      hotels.elevator =="yes"?Facilities(Icon(Icons.elevator,color: mainColor,), "Elevator"):Facilities(Icon(Icons.elevator,color: Colors.grey,), "Elevator"),
                      hotels.parking =="yes"?Facilities(Icon(Icons.fitness_center,color: mainColor,), "Fitness center"):Facilities(Icon(Icons.fitness_center,color: Colors.grey,), "Fitness center"),
                      hotels.s24open =="yes"?Facilities(Icon(Icons.access_time,color: mainColor,), "24 hours open"):Facilities(Icon(Icons.access_time,color: Colors.grey,), "24 hours open"),
                    ],
                  ),
                  SizedBox(height: mq.height * 0.02,),
                  Text("Location",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
                  SizedBox(height: mq.height * 0.02,),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(hotels.geoLocation!.latitude,
                            hotels.geoLocation!.longitude),
                        zoom: 15,
                      ),
                      markers: Set<Marker>.from(
                        [
                          Marker(
                            markerId: MarkerId('hotelMarker'),
                            position: LatLng(
                              hotels.geoLocation!.latitude,
                              hotels.geoLocation!.longitude,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: mq.height * 0.15,),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        height: mq.height * 0.09,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text("\$250",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: mainColor),),
                  Text(" /night",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Colors.black),),
                ],
              ),
              Container(
                height: mq.height * 0.08,
                width: mq.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: mainColor,
                  boxShadow: [BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: FirebaseAuth.instance.currentUser == null
                    ? InkWell(
                        //need to change later
                        onTap: () => Get.to(SignUp()),
                        child: Center(
                          child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                    )
                    : GestureDetector(
                        onTap: () => Get.to(BookNowSelectDate(postId: hotels.postId.toString(),hotelName: hotels.hotelName!,hotelRent: hotels.rent!,image: hotels.image![0],)),
                        child: Center(
                          child: Text(
                            "Book Now!",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
