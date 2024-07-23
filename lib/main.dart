// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'level_select_screen.dart';
import 'completed_levels_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginFormProvider()),
        ChangeNotifierProvider(create: (context) => CompletedLevelsModel()),
      ],
      child: MaterialApp(
        title: 'CodeRunner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF3FA2F6),
      body: Stack(
        children: [
          Positioned(
            top: -250,
            left: -100,
            child: Image.asset(
              'assets/design2.png', // the design2 asset path
              height: 500,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 50,
            child: Image.asset(
              'assets/design1.png', // the other image asset path
              height: 300,
            ),
          ),
          Positioned(
            top: 100,
            right: -100,
            child: Image.asset(
              'assets/design3.png', // the design3 asset path
              height: 300,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png', // the logo asset path
                  height: 100,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: loginForm.usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: loginForm.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (loginForm.login()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid credentials'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('LOGIN'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CodeRunner'),
        backgroundColor: Colors.blue,
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: <Widget>[
          CourseCard(
            title: 'PLAY FLUTTER',
            progress: 1,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LevelSelectScreen(
                    language: "Flutter",
                  ),
                ),
              );
            },
          ),
          CourseCard(
            title: 'PLAY SWIFT',
            progress: 1,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LevelSelectScreen(
                    language: "Swift",
                  ),
                ),
              );
            },
          ),
          // Add more CourseCards here
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text('CodeRunner'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
                Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
          // Add more list tiles for other sections
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final double progress;
  final VoidCallback? onTap;

  CourseCard({required this.title, required this.progress, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Apply onTap function here
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: progress,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginFormProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool login() {
    if (usernameController.text == 'admin' &&
        passwordController.text == 'admin') {
      return true;
    }
    return false;
  }

  void logout() {
    usernameController.clear();
    passwordController.clear();
  }

}
