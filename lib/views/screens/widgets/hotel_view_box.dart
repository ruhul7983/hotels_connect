import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/controller/hotel_details_controller.dart';
import 'package:hotels_connect/model/hotels_model.dart';
import 'package:hotels_connect/views/screens/feature_screen/hotel_details_view.dart';

import '../../../main.dart';

class HotelViewCard extends StatelessWidget {
  final Hotels hotels;
  HotelViewCard({Key? key, required this.hotels,   }) : super(key: key);
  final HotelsController hotelsController = HotelsController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>Get.to(HotelDetailsView(hotels: hotels,)),
      child: Stack(
        children: [
           Padding(
             padding: const EdgeInsets.only(left: 12),
             child: Container(
                  width: 266,
                  height: 335,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(hotels.image![0]),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(41),
                    ),
                  ),
                ),
           ),
          /*Positioned(
            right: mq.width * 0.05,
            top: mq.height * 0.05,
            child: Container(
              width: mq.width * 0.2,
              height: mq.height * 0.05,
              decoration: ShapeDecoration(
                color: Color(0xFF1AB65C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21.50),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star,color: Colors.white,),
                    Text("5.0",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),
          ),*/
          Positioned(
            bottom: mq.height * 0.09,
            left: mq.width * 0.05,
            child: Text(
             hotels.hotelName!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            bottom: mq.height * 0.07,
            left: mq.width * 0.05,
            child: Text(
              hotels.location.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: mq.height * 0.04,
            left: mq.width * 0.05,
            child: Row(
              children: [
                Text(
                  '\$${hotels.rent}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '/night',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
