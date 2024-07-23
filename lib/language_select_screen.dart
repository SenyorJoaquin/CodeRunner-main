import 'package:flutter/material.dart';
import 'level_select_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Language'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelSelectScreen(
                      language: 'Flutter',
                    ),
                  ),
                );
              },
              child: Text('Learn Flutter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelSelectScreen(
                      language: 'Swift',
                    ),
                  ),
                );
              },
              child: Text('Learn Swift'),
            ),
          ],
        ),
      ),
    );
  }
}
