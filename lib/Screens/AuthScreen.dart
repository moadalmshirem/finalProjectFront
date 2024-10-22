import 'package:flutter/material.dart';
import 'package:realeestateapp/Screens/Login.dart';
import 'package:realeestateapp/Screens/MainView.dart';
import 'package:realeestateapp/Screens/Signup.dart';
import 'package:realeestateapp/api/authcontroller.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void _register() async {
    try {
      await authService.registerUser(
        _emailController.text,
        _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register')),
      );
    }
  }

  void _login() async {
    try {
      String token = await authService.loginUser(
        _emailController.text,
        _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged in! Token: $token')),
      );
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          LoginPage(pageController: _controller, ),
          Signup(pageController: _controller,),
          Mainview( signinUsername: _emailController,),
         

         
        ],

      ),

    );
  }
}
