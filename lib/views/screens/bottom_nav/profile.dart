import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/constants.dart';
import 'package:hotels_connect/controller/auth_controller.dart';
import 'package:hotels_connect/views/screens/auth_screen/sign_up.dart';
import 'package:hotels_connect/views/screens/widgets/profile_button.dart';

import '../../../main.dart';

class Profile extends StatefulWidget {
   Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
  final AuthController authController = Get.find<AuthController>();

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    authController.userData;
    return firebaseAuth.currentUser == null
        ? Scaffold(
            body: Center(
              child: InkWell(
                onTap: ()=>Get.to(SignUp()),
                child: Container(
                  height: mq.height * 0.08,
                  width: mq.width *0.9 ,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Login First",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text("Profile"),
              actions: [
                IconButton(onPressed: (){
                  firebaseAuth.signOut();
                }, icon: Icon(Icons.menu)),
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child:  Obx(()
                  {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: mq.height*0.04,),
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1627067229240-2603c139ab93?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
                            backgroundColor: mainColor,
                          ),
                          SizedBox(height: mq.height * 0.02,),
                          Text(authController.userData.name??"",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                          SizedBox(height: mq.height * 0.01,),
                          Text(""),
                          SizedBox(height: mq.height * 0.04,),
                          ProfileButton(icon: Icon(Icons.person_2_outlined,size: 25,),text: "Edit Profile"),
                          ProfileButton(icon: Icon(Icons.payment,size: 25,),text: "Payment"),
                          ProfileButton(icon: Icon(Icons.security_sharp,size: 25,),text: "Security"),
                          ProfileButton(icon: Icon(Icons.help,size: 25,),text: "Help",),
                          InkWell(
                              onTap: (){
                                Get.changeThemeMode(ThemeMode.dark);
                              },
                              child: ProfileButton(icon: Icon(Icons.remove_red_eye,size: 25,),text: "Dark Theme")),
                          GestureDetector(
                              onTap: (){
                                Get.bottomSheet(
                                  backgroundColor: Colors.white,
                                  Container(
                                    height: mq.height * 0.4,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Are you sure to logout?",style: TextStyle(fontSize: 20),),
                                        SizedBox(height: 0.1,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            Container(
                                              height: 50,
                                              width: mq.width * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                border: Border.all(color: Colors.red),
                                                color: Colors.white,
                                              ),
                                              child: Center(child: Text("Cancel")),
                                            ),
                                            SizedBox(width: mq.width * 0.02,),
                                            InkWell(
                                              onTap: (){
                                                FirebaseAuth.instance.signOut();
                                              },
                                              child: Container(
                                                height: 50,
                                                width: mq.width * 0.2,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.red,
                                                ),
                                                child: Center(child: Text("Log out")),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: ProfileButton(icon: Icon(Icons.logout,size: 25,),text: "Logout",textColor: Colors.red,)),
                        ],
                      );
                  }
                ),

              ),
            ),
          );
  }
}
