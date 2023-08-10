import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/model/UserModel.dart';
import 'package:hotels_connect/views/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:hotels_connect/views/screens/bottom_nav/home_page.dart';
var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;


class AuthController extends GetxController{
  static AuthController instance = Get.put(AuthController());

  late Rx<UserModel> _userData = Rx<UserModel>(UserModel());
  UserModel get userData => _userData.value;
  //fetch firebase user data
  @override
  void onInit() {
    super.onInit();

    if (firebaseAuth.currentUser != null) {
      _userData.bindStream(firestore.collection("users").doc(firebaseAuth.currentUser!.uid).snapshots().map((DocumentSnapshot snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          final data = snapshot.data() as Map<String, dynamic>;
          return UserModel.fromJson(data);
        } else {
          return UserModel(); // Return a default UserModel or handle the null case
        }
      }));
    } else {
      _userData.value = UserModel(); // Handle the case when currentUser is null
    }
  }
/*
@override
  void onReady() {
  if (firebaseAuth.currentUser != null) {
    _userData.bindStream(firestore.collection("users").doc(firebaseAuth.currentUser!.uid).snapshots().map((DocumentSnapshot snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data() as Map<String, dynamic>;
        return UserModel.fromJson(data);
      } else {
        return UserModel(); // Return a default UserModel or handle the null case
      }
    }));
  } else {
    _userData.value = UserModel(); // Handle the case when currentUser is null
  }
    super.onReady();
  }*/




  void registerUser(String email, String password, String fullName, String phone, String gender) async {
    try{
      if(email.isNotEmpty && password.isNotEmpty && fullName.isNotEmpty && phone.isNotEmpty && gender.isNotEmpty){
        UserCredential cred  = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        UserModel userModel = UserModel(name: fullName,
            email: email,
            gender: gender,
            phone: phone,
            uid: cred.user!.uid,);
        await firestore.collection("users").doc(cred.user!.uid).set(
            userModel.toJson()).then((value) => Get.to(BottomNav()));
      }else{
        Get.snackbar("Error", "Try Again");
      }
    }catch(err){
      Get.snackbar("Error occur",err.toString());
    }
  }




  //firebase signIn
  Future<void> singIn(String email, String password) async {
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }catch(err){
      Get.snackbar("Error", err.toString());
    }
  }

}