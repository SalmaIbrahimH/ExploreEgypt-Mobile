import 'package:explore_egypt/service/usersService.dart';
import 'package:explore_egypt/siguUp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Progress.dart';
import 'home.dart';
import 'models/users.dart';
import 'package:flutter/services.dart';

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // List<Users> list = [];
  // loginRequestModel = new LoginRequestModel();

  // getusersFromsServer() async {
  //   list = await UsersService().getUsers();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Users users;
  bool isApiCallProcess = false;
  SharedPreferences sharedPreferences;
  bool hidePassword = true;
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  void initState() {
    // checkLoginStatus();
    super.initState();
    users = new Users();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getInt("token");
    print("token login");
    print(token);
    if (token != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      );
    }
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  singIn(String email, String pass) async {
    bool res = await UsersService().signIn(email, pass);
    setState(() {
      isApiCallProcess = false;
    });
    if (res == true) {
      print("true");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      );
      final snackBar = SnackBar(content: Text('welcom in Home )))-'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("false");
      // Toast.show("you have to sing up ", context, duration: Toast.LENGTH_LONG);
      final snackBar =
          SnackBar(content: Text('this email not found you have to sing up '));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SignUpScreen()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "LOGIN ",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            // ),
            // SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/EXEG.png",
              height: size.height * 0.14,
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              "LOGIN ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: size.height * 0.05),
            Form(
                key: globalFormKey,
                child: Column(children: [
                  RoundedInputField(
                      hintText: "Your Email",
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter valid email';
                        }
                        if (!value.contains('@')) {
                          return 'email should be valid';
                        }
                        return null;
                      },
                      onChanged: (value) {}),
                  RoundedPasswordField(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid password';
                      }
                      if (value.length < 4) {
                        return "Password should be more than 4 characters";
                      }
                      if (UsersService().passErorr) {
                        return "Enter correct password";
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: hidePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      color: Theme.of(context).accentColor.withOpacity(0.4),
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  RoundedButton(
                    // (onChanged: (input) => users.password = input),

                    text: "LOGIN",
                    press: () {
                      if (validateAndSave() == true) {
                        setState(() {
                          isApiCallProcess = true;
                        });
                        singIn(emailController.text, passwordController.text);
                      }
                    },
                  ),
                ])),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/images/main_top.png",
          //     width: size.width * 0.35,
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset(
          //     "assets/images/login_bottom.png",
          //     width: size.width * 0.4,
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}

const kPrimaryColor = Color(0xFF0067b9);
const kPrimaryLightColor = Color(0xFFe6f4ff);

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Color(0xFF0067b9),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final validator;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final validator;
  final IconButton suffixIcon;
  final bool obscureText;
  const RoundedPasswordField(
      {Key key,
      this.onChanged,
      this.controller,
      this.validator,
      this.suffixIcon,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: suffixIcon,
          prefixIcon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.82,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        )
      ],
    );
  }
}
