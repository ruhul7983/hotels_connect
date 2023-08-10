import 'package:flutter/material.dart';
import 'package:hotels_connect/constants.dart';


class RecentlyBooked extends StatelessWidget {
  const RecentlyBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFE8F8EF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 91,
              height: 91,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Intercontinental Hotel',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Lagos, Nigeria',
                  style: TextStyle(
                    color: Color(0xFF242424),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                    Text("5.0",style: TextStyle(color: mainColor),),
                    Text("(4030 reviews)"),
                  ],
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("\$250",style: TextStyle(color: mainColor,fontWeight: FontWeight.w800),),
                Text("/night"),
                Icon(Icons.bookmark,color: mainColor,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
