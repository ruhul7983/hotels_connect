import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/views/screens/auth_screen/fill_the_form.dart';
import 'package:hotels_connect/views/screens/auth_screen/sign_in.dart';
import 'package:hotels_connect/views/screens/widgets/button.dart';
import 'package:hotels_connect/views/screens/widgets/custom_text_form_field.dart';

import '../../../constants.dart';
import '../../../main.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey<FormState>();

  void validate(){
    if(formKey.currentState!.validate()){
      Get.to(FillTheForm(email: emailController.text,password: passwordController.text,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() =>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create New\nAccount",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w700),),
                  SizedBox(height: mq.height * 0.1,),
                  CustomTextFormField(icon:Icon(Icons.email_outlined),controller: emailController, label: "Email"),
                  CustomTextFormField(icon:Icon(Icons.lock),controller: passwordController, label: "Password",isPass: true,),
                  SizedBox(height: mq.height * 0.02,),
                  InkWell(
                      onTap: ()=>validate(),
                      child: CustomButton(text: "Sign up")),
                  SizedBox(height: mq.height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("or",textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(height: mq.height * 0.04,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have a account? ",style: TextStyle(fontSize: 14),),
                      GestureDetector(
                          onTap: ()=>Get.to(SignIn()),
                          child: Text("Sign in",style: TextStyle(color: mainColor,fontSize: 14,fontWeight: FontWeight.w500),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
