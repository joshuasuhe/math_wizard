import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_wizard_mk2/forgot_password.dart';
import 'package:math_wizard_mk2/mainPage.dart';
import 'package:math_wizard_mk2/signup.dart';
import 'package:math_wizard_mk2/auth_services.dart';
import 'package:math_wizard_mk2/utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //texteditingcontroller untuk mendapat nilai yang dimasukkan oleh user
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

//textfield email 
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              fontFamily: 'Poppins-Medium', fontSize: 15, color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Medium',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Masukan Email',
              hintStyle: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 15,
                  color: Colors.white54),
            ),
          ),
        ),
      ],
    );
  }
//textfield password
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              fontFamily: 'Poppins-Medium', fontSize: 15, color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins-Medium',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Masukan Password',
              hintStyle: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 15,
                  color: Colors.white54),
            ),
          ),
        ),
      ],
    );
  }

//tombol lupa password
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return forgotpasswordScreen();
          }));
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Lupa Password?',
          style: TextStyle(
              fontFamily: 'Poppins-Medium', fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }

//tombol daftar
  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SignUpScreen();
        }));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Tidak Punya Akun? ',
              style: TextStyle(
                color: Color(0xFF527DAA),
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            TextSpan(
              text: 'Daftar Sekarang.',
              style: TextStyle(
                color: Color(0xFF527DAA),
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                fontFamily: 'Poppins-Medium',
              ),
            ),
          ],
        ),
      ),
    );
  }

//tombol login
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (emailController.text == '' || passwordController.text == '') {
            Alert(
              context: context,
              type: AlertType.error,
              title: "Login Gagal",
              desc: "Email atau password masih kosong.",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          } else {
          bool res = await AuthProvider()
              .signInWithEmail(emailController.text, passwordController.text);

          if (globals.eror == true) {
            Alert(
              context: context,
              type: AlertType.error,
              title: "Login Gagal",
              desc: "Email atau password salah.",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          } else {
            Alert(
              context: context,
              type: AlertType.success,
              title: "Login Berhasil",
              desc: "Selamat Datang!",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainPage();
                  })),
                  width: 120,
                )
              ],
            ).show();
          }

          if (!res) {
            AlertDialog(title: Text("Login Failed"));
          }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins-Medium',
          ),
        ),
      ),
    );
  }

//tombol sign in dengan akun google
  Widget _buildSignInGoogleButton() {
    return RaisedButton(
      onPressed: () async {
        bool res = await AuthProvider().loginWithGoogle();
        if (!res) print("ERROR login dengan Google akun");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      },
      highlightElevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google-logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF527DAA),
                    fontFamily: "Poppins-Medium"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: WillPopScope(
          onWillPop: () => SystemNavigator.pop(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
              ),
              Container(
                alignment: Alignment.center,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 28.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        width: 175,
                        height: 175,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      Container(
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildLoginBtn(),
                      SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildSignupBtn(),
                      Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          width: 500,
                          child: Column(
                            children: <Widget>[
                              _buildSignInGoogleButton(),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
