import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/constants.dart';
import 'package:hotels_connect/controller/hotel_details_controller.dart';
import 'package:hotels_connect/views/screens/bottom_nav/search_screen.dart';
import 'package:hotels_connect/views/screens/widgets/hotel_view_box.dart';
import 'package:hotels_connect/views/screens/widgets/recently_booked_card.dart';
import 'package:hotels_connect/views/screens/widgets/recommanded_button_widget.dart';

import '../../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // final HotelsController hotelsController = HotelsController();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mq.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo.jpeg',
                      height: mq.height * 0.06,
                      fit: BoxFit.fitWidth,
                    ),

                    Text(
                      'Hotels Connect',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(Icons.notifications_none),
                    Icon(Icons.bookmark_border),
                  ],
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                Text(
                  'Hello, Kezia',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                InkWell(
                  onTap: ()=>Get.to(Search()),
                  child: Container(
                    width: mq.width,
                    height: mq.height * 0.08,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF2F2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Search',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Icon(
                          Icons.sort,
                          color: mainColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                Row(
                  children: [
                    Recommended(
                      color: mainColor,
                      text: "Recommended",
                      textColor: Colors.white,
                      borderColor: mainColor,
                    ),
                    Recommended(
                      color: Colors.white,
                      text: "Popular",
                      textColor: mainColor,
                      borderColor: mainColor,
                    ),
                    Recommended(
                      color: Colors.white,
                      text: "Trending",
                      textColor: mainColor,
                      borderColor: mainColor,
                    ),
                  ],
                ),
                SizedBox(height: mq.height * 0.05,),
              Container(
                height: 335,
                child: GetX<HotelsController>(
                  builder: (controller) {
                    if(controller.isLoading){
                      return Center(
                        child: CircularProgressIndicator(color: mainColor,),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: controller.hotel.length,
                      itemBuilder: (context, index) {
                      return HotelViewCard(hotels: controller.hotel[index],);
                    },);
                  }
                ),
              ),
                SizedBox(height: mq.height * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recently Booked",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("See all",style: TextStyle(color: mainColor),),
                  ],
                ),
                SizedBox(height: mq.height * 0.02,),
                RecentlyBooked(),
                SizedBox(height: mq.height * 0.1,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
