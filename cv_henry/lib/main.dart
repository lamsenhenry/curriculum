import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/first': (context) => const FirstRoute(),
      '/second': (context) => const SecondRoute(),
      '/third': (context) => const ThirdRoute(),
      '/fourth': (context) =>  FourthRoute(),
    },
  )); //MaterialApp
}

class HomeRoute extends StatelessWidget {
  HomeRoute({key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Curriculum Vitae'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign in ',
                style: TextStyle(
                  fontFamily: 'SourOrbitron',
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                prefixIconColor: Colors.black87,
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              onChanged: (String value) {},
                              validator: (value) {
                                //a.aaba@aa1a.com
                                if (value!.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                        .hasMatch(value)) {
                                  return 'Enter correct email!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.lock),
                                prefixIconColor: Colors.black87,
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please create a password";
                                } else if (value.length < 6) {
                                  return "Must be atleast 6 chars";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        const SizedBox(height: 30.0),
                        Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 150),
                            child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Navigator.pushNamed(context, '/first');
                                  }
                                  return;
                                },
                                color: Colors.black,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Text('Login'))),
                        Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 150),
                            child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/fourth');
                                },
                                color: Colors.black,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Text('Sign up'))),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('My Personal Information'),
        backgroundColor: Colors.black,
      ), // AppBar
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.blueGrey,
              backgroundImage: AssetImage('images/henry.png'),
            ),
            Text(
              'Henry C. Lamsen',
              style: TextStyle(
                fontFamily: 'Lamsen',
                fontSize: 35.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Bachelor of Science Information Technology',
              style: TextStyle(
                fontFamily: 'Source Sans 3',
                color: Colors.black,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black87,
                ),
                title: Text(
                  '506 San Miguel, Calasiao Pangasinan',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans 3'),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.black87,
                ),
                title: Text(
                  'choppenrock1994@gmail.com',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans 3'),
                ),
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Colors.black87,
                  ),
                  title: Text(
                    '09480430978',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Source Sans 3',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.black38, // background
                onPrimary: Colors.white, // foreground
              ),
              child: const Text('Educational Background'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ), // ElevatedButton
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.black38, // background
                onPrimary: Colors.white, // foreground
              ),
              child: const Text('Background'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    ); // Scaffold
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
        backgroundColor: Colors.black87,
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.blueGrey,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.black87,
                ),
                title: Text(
                  'Tertiary Education ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('College'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Philippine College of Science and Technology',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    'Bachelor of Science in Information Technology 2019-2023'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
                title: Text(
                  'Secondary Education',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans 3'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Calasiao Comprehensive National High School',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Year: 2007-2011'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
                title: Text(
                  'Primary Education',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans 3'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Calasiao Central School',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Year: 2001-2007'),
              ),
            ),
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Professional Background"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.account_box_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "Professional Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    "I am Information Technology and a freshly graduated out of college"),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.album,
                  color: Colors.black,
                ),
                title: Text(
                  'Skills and Abilities',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Trustworthy, Hardworking, Loyalty "),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.web_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  'Web-Development',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    "I have a experience to developing website using PHP and knowledge to front-end"),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
                title: Text(
                  'Certificates',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("NCII holder in Computer System Servicing "),
              ),
            ),
          ],
        ),
      ),

      /// AppBar
    ); // Scaffold
  }
}

//--------------------------Sign up------------------------///

class FourthRoute extends StatelessWidget {
 FourthRoute({key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Curriculum Vitae'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blueGrey,
              backgroundImage: AssetImage('images/sign.jpg'),
            ),
            const Text(
              'Create your Account',
              style: TextStyle(
                fontFamily: 'SourOrbitron',
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              hintText: 'Enter Name',
                              prefixIconColor: Colors.black87,
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onChanged: (String value) {},
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return 'Should enter Alphabets only!';
                              } else {
                                return null;
                              }
                            },
                          )),
                      const SizedBox(height: 30.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              hintText: 'Enter Lastname',
                              prefixIconColor: Colors.black87,
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onChanged: (String value) {},
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return 'Should enter Alphabets only!';
                              } else {
                                return null;
                              }
                            },
                          )),
                      const SizedBox(height: 30.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                              obscureText: false,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                labelText: 'Age',
                                hintText: 'Enter your Age',
                                prefixIconColor: Colors.black87,
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.length == 18 ||
                                    double.parse(value) < 18) {
                                  return ('Age should be 18 years old and above');
                                } else {
                                  return null;
                                }
                              }
                          )),
                      const SizedBox(height: 30.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              labelText: 'Gender',
                              hintText: 'Gender',
                              prefixIconColor: Colors.black87,
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onChanged: (String value) {},
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'Please enter your Gender'
                                  : null;
                            },
                          )),
                      const SizedBox(height: 30.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                              obscureText: false,
                              decoration: const InputDecoration(
                                labelText: 'Phone',
                                hintText: 'Phone',
                                prefixIconColor: Colors.black87,
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.phone,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              onChanged: (String value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter phone number';
                                } else if (value.length < 11)
                                  return 'Please enter correct number';
                                else if (value.length > 11)
                                  return 'Please enter correct number';
                                return null;
                              }
                          )),
                      const SizedBox(height: 30.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email Address',
                              hintText: 'Enter Address',
                              prefixIconColor: Colors.black87,
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            onChanged: (String value) {},
                            validator: (value) {
                              //a.aaba@aa1a.com
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                      .hasMatch(value)) {
                                return 'Enter correct email!';
                              } else {
                                return null;
                              }
                            },
                          )),
                      const SizedBox(height: 30.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter the password',
                              prefixIconColor: Colors.black87,
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please create a password";
                              } else if (value.length < 6) {
                                return "Must be atleast 6 chars";
                              } else {
                                return null;
                              }
                            },
                          )),
                      const SizedBox(height: 30.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 150),
                          child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  Navigator.pushNamed(context, '/first');
                                }
                                return;
                              },
                              color: Colors.black,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text('Done'))),
                    ],
                  ),
                ))
          ],
        ),
      ),
        ));
  }
}
