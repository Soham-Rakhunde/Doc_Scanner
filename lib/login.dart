import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Material(
        child: Container(
          width: _screenWidth,
          height: _screenHeight,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              width: _screenWidth,
              height: _screenHeight,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login to your",
                    style: TextStyle(
                      fontSize: _screenHeight * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Account".toUpperCase(),
                    style: TextStyle(
                      fontSize: _screenHeight * 0.07,
                      letterSpacing: 5.0,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: _screenWidth * 0.8,
                    child: TextFormField(
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          borderSide: BorderSide(
                            // style: BorderSide.styleFrom(
                            //   primary:Colors.blue[700]
                            // ),
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    width: _screenWidth * 0.8,
                    child: TextFormField(
                      controller: _passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        icon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: _screenWidth * 0.5,
                    height: _screenHeight * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      elevation: 0.0,
                      focusElevation: 0.0,
                      hoverElevation: 0.0,
                      highlightElevation: 0.0,
                      disabledElevation: 0.0,
                      color: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        "Login".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _screenHeight * 0.025,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    width: _screenWidth * 0.5,
                    height: _screenHeight * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      elevation: 0.0,
                      focusElevation: 0.0,
                      hoverElevation: 0.0,
                      highlightElevation: 0.0,
                      disabledElevation: 0.0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        "Register".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _screenHeight * 0.025,
                        ),
                      ),
                    ),
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
