import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_without_cringe/constants.dart';

class textInputField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool isHidden;
  final Map<String,String> Text;
  final TextEditingController controller; 


  const textInputField({super.key,required this.icon,required this.labelText,this.isHidden=false,required this.controller,required this.Text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        prefixIconColor: borderColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: borderColor)),
        floatingLabelStyle: TextStyle(color: borderColor),
        labelStyle: const TextStyle(
          fontSize: 20
        ),
        ),
        obscureText: isHidden,
        onSubmitted: (value){Text[labelText]=value;},
    );
  }
}