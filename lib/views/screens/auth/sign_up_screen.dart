import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/controller/auth_controller.dart';
import 'package:tiktok_without_cringe/views/screens/auth/login_screen.dart';
import 'package:tiktok_without_cringe/views/widgets/text_input_field.dart';

class signUpScreen extends StatefulWidget {
  signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController _userController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _pwdController = new TextEditingController();

  File? image_file;

  bool isSelected = false;

  Map<String,String> controllerText = {'Username':'','Email':'','Password':'',};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: SafeArea(
        child: Container(alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
            
          Text("TikTok Clone",style: TextStyle(fontWeight: FontWeight.w900,color:buttonColor,fontSize: 35 ),),
          const SizedBox(height: 2,),
          const Text("Register",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
          const SizedBox(height: 10,),
          Stack(children:[ CircleAvatar(
            backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
            backgroundColor: Colors.black,
            radius: 65
        
          ),
        
          Positioned(
        
            left: 95,
            bottom: -10,
            
            
            
            child: IconButton(icon:Icon(Icons.add_a_photo),onPressed: ()async{image_file= await authController.imgPicker();
          },))
          
          
          
          
          ],),
        
          Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),width: MediaQuery.of(context).size.width,child: textInputField(icon: Icons.account_circle_rounded, labelText: 'Username',controller: _userController,Text: controllerText,)),
          Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),width: MediaQuery.of(context).size.width,child: textInputField(icon: Icons.email, labelText: 'Email',controller: _emailController,Text: controllerText)),
          Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),width: MediaQuery.of(context).size.width,child: textInputField(icon: Icons.password_sharp, labelText: 'Password',controller: _pwdController,isHidden: true,Text: controllerText)),
          const SizedBox(height: 30,),

          InkWell(
            onTap: ()async{
              print(_emailController.text);
              authController.resgisterUser(username:controllerText['Username']!, email: controllerText['Email']!, password: controllerText['Password']!,image:image_file);
              },

            splashColor: Colors.grey,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.center,
              margin:EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            ),
          ),
           const SizedBox(height: 25,),
           Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(child: Text("Already have an account?",style: TextStyle(fontSize: 18),),),
           SizedBox(width: 10,),
           InkWell(
            onTap: (){Get.snackbar('',controllerText['Username']!);
              //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>loginScreen()));
            },
            child: Container(child: Text("Login",style: TextStyle(fontSize: 18,color: buttonColor),),))])
            
        ]),
            
            
            
            
            
            
        ),
      ),
    );
  }
}