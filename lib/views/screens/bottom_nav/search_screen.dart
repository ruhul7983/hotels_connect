import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotels_connect/model/hotels_model.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../main.dart';
import '../feature_screen/hotel_details_view.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  List<Hotels> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: Container(
            height: mq.height * 0.05,
            width: mq.width * 0.8,
            child: Center(
              child: TextFormField(
                autofocus: true,
                controller: searchController,
                onFieldSubmitted: (_) {
                  setState(() {
                    isSearching = true;
                  });
                  performSearch();
                },
                decoration: InputDecoration(
                  hintText: 'Keyword',
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFf5f6f8),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          centerTitle: true,
        ),
        body: isSearching
            ? FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('hotels')
                    .where('hotelName',
                          isLessThanOrEqualTo: searchController.text)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No results found."),
                    );
                  }

                  searchResults = snapshot.data!.docs
                      .map((doc) => Hotels.fromJson(doc.data()))
                      .toList();

                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(HotelDetailsView(hotels: searchResults[index]));
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              searchResults[index].hotelName!,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                            subtitle: Text(searchResults[index].rent!),
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(searchResults[index].image![0]),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : Center(
                child: Text("Search hotel"),
              ),
      ),
    );
  }


  void performSearch() {
    setState(() {
      searchResults = [];
    });
  }
}
