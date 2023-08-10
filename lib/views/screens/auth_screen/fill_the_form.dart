import 'package:flutter/material.dart';
import 'package:hotels_connect/constants.dart';
import 'package:hotels_connect/controller/auth_controller.dart';
import 'package:hotels_connect/views/screens/widgets/button.dart';
import 'package:hotels_connect/views/screens/widgets/custom_text_form_field.dart';

import '../../../main.dart';

class FillTheForm extends StatefulWidget {
  final String email;
  final String password;
  const FillTheForm({Key? key, required this.email, required this.password}) : super(key: key);

  @override
  State<FillTheForm> createState() => _FillTheFormState();
}

class _FillTheFormState extends State<FillTheForm> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController genderController = TextEditingController();
  var selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill the form"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mq.height * 0.2,),
            CustomTextFormField(controller: fullNameController, label: "Full Name", icon: Icon(Icons.person)),
            CustomTextFormField(controller: phoneController, label: "Phone", icon: Icon(Icons.person)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFC4C4C4),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 10),
                    child: Text("Select : ",style: TextStyle(fontSize: 18),),
                  ),
                  DropdownButton(
                      value: selectedGender,
                      items: [
                        DropdownMenuItem(
                            value: "Gender", child: Text("Gender")),
                        DropdownMenuItem(
                            value: "Male", child: Text("Male")),
                        DropdownMenuItem(
                            value: "Female", child: Text("Female")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          selectedGender = val!;
                        });
                      }),
                ],
              ),
            ),
            SizedBox(height: mq.height * 0.02,),
            InkWell(
                onTap: (){
                  authController.registerUser(widget.email, widget.password, fullNameController.text, phoneController.text, selectedGender);
                  print(selectedGender);
                },
                child: CustomButton(text: "Sign up")),
          ],
        ),
      ),
    );
  }
}
