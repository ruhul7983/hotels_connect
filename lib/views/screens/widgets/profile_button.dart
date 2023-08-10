import 'package:flutter/material.dart';
import '../../../main.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color? textColor;
  final GestureTapCallback ? onPress;
  const ProfileButton({Key? key, required this.text, required this.icon, this.textColor, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: mq.height * 0.08,
        width: mq.width *0.95,
        decoration: BoxDecoration(
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 10,),
            Text(text,style: TextStyle(fontSize: 18,color: textColor),),
          ],
        ),
      ),
    );
  }
}
