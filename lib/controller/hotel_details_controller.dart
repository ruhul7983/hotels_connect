import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/hotels_model.dart';

class HotelsController extends GetxController {
    var _firestore = FirebaseFirestore.instance;
    late Rx<List<Hotels>> _hotel = Rx<List<Hotels>>([]);
    List<Hotels> get hotel => _hotel.value;
    bool get isLoading => _hotel.value.isEmpty;

    @override
    void onInit() {
        super.onInit();
        _hotel.bindStream(_firestore.collection("hotels").snapshots().map((querySnapshot) {
            // Convert each document in the query snapshot to a Hotels object
            return querySnapshot.docs.map((doc) => Hotels.fromJson(doc.data())).toList();
        }));
    }
}
