import 'package:explore_egypt/service/usersService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Progress.dart';
import 'home.dart';
import 'login.dart';
import 'models/users.dart';

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
        ),
        body: SignUpScreen(),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
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
  Users user;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  SharedPreferences sharedPreferences;
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final TextEditingController fnameController = new TextEditingController();
  final TextEditingController lnameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController conpasswordController =
      new TextEditingController();
  List<Users> userslist = [];
  @override
  void initState() {
    super.initState();
    getusersFromsServer();
    checkLoginStatus();
  }

  getusersFromsServer() async {
    userslist = await UsersService().getUsers();
    setState(() {});
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      return true;
    }
    return false;
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getInt("token");
    print("token up");
    print(token);
    if (token != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      );
    }
  }

  setUsersFromsServer(String fname, String lname, String email, String pass,
      String conpass, String city) async {
    var data = userslist.where((item) => (item.email.contains(email.trim())));
    if (data.length < 1) {
      user = new Users(
          email: email.trim(),
          password: pass.trim(),
          firstName: fname.trim(),
          lastName: lname.trim(),
          confirmPassword: conpass.trim(),
          city: city.trim());
      if (user != null) {
        var res = await UsersService().setUser(user);
        setState(() {
          isApiCallProcess = false;
        });
        if (res == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          final snackBar = SnackBar(content: Text('Sing Up Successfuly '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      // Toast.show("this email are already sing up ", context,
      //     duration: Toast.LENGTH_LONG);
      final snackBar =
          SnackBar(content: Text('this email are already sing up'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
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
            Image.asset(
              "assets/EXEG.png",
              height: size.height * 0.10,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "SING UP ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: size.height * 0.03),
            Form(
              key: globalFormKey,
              child: Column(
                children: [
                  RoundedInputField(
                    hintText: "First Name",
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    icon: Icons.person,
                    controller: fnameController,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "Last Name",
                    icon: Icons.person,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    controller: lnameController,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "Your Email",
                    icon: Icons.mail,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid email';
                      }
                      if (!value.contains('@')) {
                        return 'email should be valid';
                      }
                      return null;
                    },
                    controller: emailController,
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    hintText: "Password",
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid password';
                      }
                      if (value.length < 4) {
                        return "Password should be more than 4 characters";
                      }
                      return null;
                    },
                    controller: passwordController,
                    onChanged: (value) {},
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
                  RoundedPasswordField(
                    hintText: "Confirm Password",
                    obscureText: hidePassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter re-password';
                      }
                      if (passwordController.text !=
                          conpasswordController.text) {
                        return 're-password should equeal password';
                      }
                      return null;
                    },
                    onChanged: (value) {},
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
                    controller: conpasswordController,
                  ),
                  RoundedInputField(
                    hintText: "City",
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                    icon: Icons.mail,
                    controller: cityController,
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                      text: "SING UP",
                      press: () {
                        if (validateAndSave() == true) {
                          setState(() {
                            isApiCallProcess = true;
                          });
                          setUsersFromsServer(
                            fnameController.text,
                            lnameController.text,
                            emailController.text,
                            passwordController.text,
                            conpasswordController.text,
                            cityController.text,
                          );
                        }
                      }),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
      this.icon,
      this.onChanged,
      this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
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
  final String hintText;
  final TextEditingController controller;
  final IconButton suffixIcon;
  final validator;
  final bool obscureText;
  const RoundedPasswordField(
      {Key key,
      this.onChanged,
      this.hintText,
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
        controller: controller,
        validator: validator,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
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
      margin: EdgeInsets.symmetric(vertical: 9),
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
    this.login = false,
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
