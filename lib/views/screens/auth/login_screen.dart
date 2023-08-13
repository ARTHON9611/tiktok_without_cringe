
import 'package:flutter/material.dart';
import 'package:tiktok_without_cringe/constants.dart';
import 'package:tiktok_without_cringe/views/screens/auth/sign_up_screen.dart';
import 'package:tiktok_without_cringe/views/widgets/text_input_field.dart';

class loginScreen extends StatelessWidget {
  loginScreen({super.key});
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();


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
          const Text("Login",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
          Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),width: MediaQuery.of(context).size.width,child: textInputField(icon: Icons.email, labelText: 'Email',controller: _emailController,Text: {},)),
          Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),width: MediaQuery.of(context).size.width,child: textInputField(icon: Icons.password_sharp, labelText: 'Password',controller: _pwdController,isHidden: true,Text: {},)),
          const SizedBox(height: 30,),


          InkWell(
            onTap: (){print("login button pressed");},
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
              child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            ),
          ),
           const SizedBox(height: 25,),
           Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(child: Text("Dont\'t have an account?",style: TextStyle(fontSize: 18),),),
           SizedBox(width: 10,),
           InkWell(
            onTap: (){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>signUpScreen()));},
            child: Container(child: Text("Sign Up",style: TextStyle(fontSize: 18,color: buttonColor),),))])
      
        ]),
      
        ),
      ),
    );
  }
}