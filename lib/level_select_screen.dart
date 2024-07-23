import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'code_snippet_widget.dart';
import 'completed_levels_model.dart'; // Adjust import path as needed
import 'snippets.dart';

class LevelSelectScreen extends StatefulWidget {
  final String language;

  LevelSelectScreen({required this.language});

  @override
  _LevelSelectScreenState createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends State<LevelSelectScreen> {
  List<CodeSnippet> getSnippetsForDifficulty(
      String language, String difficulty) {
    switch (language) {
      case 'Flutter':
        switch (difficulty) {
          case 'easy':
            return flutterEasySnippets;
          case 'medium':
            return flutterMediumSnippets;
          case 'hard':
            return flutterHardSnippets;
        }
        break;
      case 'Swift':
        switch (difficulty) {
          case 'easy':
            return swiftEasySnippets;
          case 'medium':
            return swiftMediumSnippets;
          case 'hard':
            return swiftHardSnippets;
        }
        break;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Set<int>> completedLevels =
        Provider.of<CompletedLevelsModel>(context).completedLevels;

    void markLevelAsCompleted(int levelIndex) {
      Provider.of<CompletedLevelsModel>(context, listen: false)
          .markLevelAsCompleted(widget.language, levelIndex);
    }

    return Scaffold(
      appBar: AppBar(title: Text('${widget.language} Level Select')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  List<CodeSnippet> snippets =
                      getSnippetsForDifficulty(widget.language, 'easy');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeSnippetWidget(
                        snippets: snippets,
                        title: 'Easy Level',
                        onLevelCompleted: () => markLevelAsCompleted(0),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 80.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'EASY',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child:
                          completedLevels[widget.language]?.contains(0) ?? false
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.circle, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  List<CodeSnippet> snippets =
                      getSnippetsForDifficulty(widget.language, 'medium');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeSnippetWidget(
                        snippets: snippets,
                        title: 'Medium Level',
                        onLevelCompleted: () => markLevelAsCompleted(1),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 80.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'MEDIUM',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child:
                          completedLevels[widget.language]?.contains(1) ?? false
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.circle, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  List<CodeSnippet> snippets =
                      getSnippetsForDifficulty(widget.language, 'hard');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeSnippetWidget(
                        snippets: snippets,
                        title: 'Hard Level',
                        onLevelCompleted: () => markLevelAsCompleted(2),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 80.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'HARD',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child:
                          completedLevels[widget.language]?.contains(2) ?? false
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.circle, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
