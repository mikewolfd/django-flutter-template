import 'package:demoApp/repo/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demoApp/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:demoApp/style/color_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: BlocProvider(
            create: (_) => LoginCubit(
              context.repository<AuthenticationRepository>(),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(gradient: ColorUtils.appBarGradient),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 19),
                      ),
                    )),
                Positioned(
                  top: 150,
                  left: 10,
                  right: 10,
                  child: Column(children: <Widget>[
                    _buildLogo(),
                    LoginForm(),
                    _buildSignUp()
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Image.asset(
        "images/nextt.png",
        height: 125,
        width: 125,
      ),
    );
  }

  Widget _buildSignUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an Account ? ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
