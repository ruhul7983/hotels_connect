import 'package:flutter/material.dart';

import '../../../main.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Icon icon;
  final bool isPass;
  const CustomTextFormField({Key? key, required this.controller, required this.label, required this.icon, this.isPass=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom:10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFC4C4C4)
        ),
        child: Row(
          children: [
            SizedBox(width: mq.width * 0.02,),
            icon,
            SizedBox(width: mq.width * 0.02,),
            Expanded(
              child: TextFormField(
                obscureText: isPass,
                validator: (val){
                  if(val!.isEmpty ){
                    return "Required";
                  }else if(isPass == true){
                    if(val.length < 6){
                      return 'Minimum 6 Character';
                    }
                  }
                  return null;
                },
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(label),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
