import 'package:flutter/material.dart';
import 'dart:math';
import 'snippets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'completed_levels_model.dart';

class CodeSnippetWidget extends StatefulWidget {
  final List<CodeSnippet> snippets;
  final String title;
  final VoidCallback onLevelCompleted;

  CodeSnippetWidget({
    required this.snippets,
    required this.title,
    required this.onLevelCompleted,
  });

  @override
  _CodeSnippetWidgetState createState() => _CodeSnippetWidgetState();
}

class _CodeSnippetWidgetState extends State<CodeSnippetWidget> {
  int currentSnippetIndex = 0;
  List<List<int>> editableIndices = [];
  List<List<TextEditingController>> controllers = [];
  List<List<bool>> showCorrectAnswers = [];
  int lives = 3;
  double progress = 1.0;
  late Timer _timer;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showCorrect = false;
  bool showIncorrect = false;
  bool showCheckButton = true;
  AudioPlayer _player1 = AudioPlayer();
  AudioPlayer _player2 = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _player1 = AudioPlayer();
    _player2 = AudioPlayer();

    _player1.setSource(AssetSource('Correct.wav'));

    _player2.setSource(AssetSource('Wrong.wav'));

    widget.snippets.shuffle(Random());
    _initializeCurrentSnippet();
    _startTimer();
  }

  void _initializeCurrentSnippet() {
    if (currentSnippetIndex < widget.snippets.length) {
      CodeSnippet currentSnippet = widget.snippets[currentSnippetIndex];
      editableIndices.clear();
      controllers.clear();
      showCorrectAnswers.clear();
      Random random = Random();
      List<int> allEditableIndices = [];

      for (int i = 0; i < currentSnippet.codeSnippet.length; i++) {
        List<int> lineEditableIndices = [];
        for (int j = 0;
            j < currentSnippet.codeSnippet[i].segments.length;
            j++) {
          if (currentSnippet.codeSnippet[i].segments[j].editable) {
            lineEditableIndices.add(j);
          }
        }

        editableIndices.add(lineEditableIndices);
        controllers.add(List.generate(
            lineEditableIndices.length, (index) => TextEditingController()));
        showCorrectAnswers
            .add(List.generate(lineEditableIndices.length, (index) => false));
        allEditableIndices
            .addAll(lineEditableIndices.map((index) => i * 1000 + index));
      }

      allEditableIndices.shuffle(random);
      int numTextInputs =
          _getNumEditableSegments(); // Get number of editable segments based on difficulty
      allEditableIndices = allEditableIndices.sublist(0, numTextInputs);

      editableIndices = List.generate(
        currentSnippet.codeSnippet.length,
        (i) => [],
      );

      for (int editableIndex in allEditableIndices) {
        int lineIndex = editableIndex ~/ 1000;
        int segmentIndex = editableIndex % 1000;
        editableIndices[lineIndex].add(segmentIndex);
      }
    }
  }

  int _getNumEditableSegments() {
    switch (widget.title.toLowerCase()) {
      case 'easy level':
        return 2;
      case 'medium level':
        return 3;
      case 'hard level':
        return 4;
      default:
        return 2;
    }
  }

  void _startTimer() {
    int timerDurationMillis = 1000;

    switch (widget.title.toLowerCase()) {
      case 'easy level':
        timerDurationMillis = 500;
        break;
      case 'medium level':
        timerDurationMillis = 400;
        break;
      case 'hard level':
        timerDurationMillis = 300;
        break;
      default:
        timerDurationMillis = 500;
        break;
    }

    _timer =
        Timer.periodic(Duration(milliseconds: timerDurationMillis), (timer) {
      setState(() {
        progress -= 0.01;
        if (progress <= 0) {
          timer.cancel();
          _checkAnswers();
        }
      });
    });
  }

  void _loseLife() {
    setState(() {
      lives--;
      if (lives > 0) {
        if (currentSnippetIndex + 1 < widget.snippets.length) {
          currentSnippetIndex++;
          _initializeCurrentSnippet();
          progress = 1.0;
          _startTimer();
        } else {
          _showGameOverDialog();
        }
      } else {
        _showGameOverDialog();
      }
      showIncorrect = true;
    });
  }

  void _checkAnswers() {
    bool isCorrect = true;

    for (int i = 0; i < editableIndices.length; i++) {
      for (int j = 0; j < editableIndices[i].length; j++) {
        int segmentIndex = editableIndices[i][j];

        if (controllers[i][j].text !=
            widget.snippets[currentSnippetIndex].codeSnippet[i]
                .segments[segmentIndex].text) {
          isCorrect = false;
          print("Mismatch at line $i, segment $segmentIndex");
          print(
              "Expected: ${widget.snippets[currentSnippetIndex].codeSnippet[i].segments[segmentIndex].text}");
          print("Found: ${controllers[i][j].text}");
        }
      }
    }

    if (isCorrect) {
      _showCorrectFeedbackAndProceed();
    } else {
      _showIncorrectFeedbackAndProceed();
    }
  }

  void _showCorrectFeedbackAndProceed() {
    setState(() {
      showCorrect = true;
      showCheckButton = false;
    });
    _player1.resume();

    _timer.cancel();
    _showAnswers();
    Timer(Duration(seconds: 2), () {
      setState(() {
        showCorrect = false;
      });
      _proceedToNextSnippet();
    });
  }

  void _showIncorrectFeedbackAndProceed() {
    setState(() {
      lives--;
      showIncorrect = true;
      showCheckButton = false;
      if (lives <= 0) {
        Timer(Duration(seconds: 2), () {
          setState(() {
            _showGameOverDialog();
          });
        });
      }
    });
    _player2.resume();

    _showAnswers();
    Timer(Duration(seconds: 2), () {
      setState(() {
        showIncorrect = false;
      });
      if (lives > 0) {
        _proceedToNextSnippet();
      }
    });
  }

  void _showAnswers() {
    _timer.cancel();
    setState(() {
      for (int i = 0; i < editableIndices.length; i++) {
        for (int j = 0; j < editableIndices[i].length; j++) {
          int segmentIndex = editableIndices[i][j];
          controllers[i][j].text = widget.snippets[currentSnippetIndex]
              .codeSnippet[i].segments[segmentIndex].text;
          showCorrectAnswers[i][j] = true;
        }
      }
    });
  }

  void _proceedToNextSnippet() {
    setState(() {
      if (currentSnippetIndex + 1 < widget.snippets.length) {
        showCheckButton = true;
        currentSnippetIndex++;
        _initializeCurrentSnippet();
        progress = 1.0;
        _startTimer();
      } else {
        widget.onLevelCompleted();
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You have completed all snippets.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  void _showGameOverDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Game Over'),
        content: Text('You have lost all your lives.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  double _getWidthForText(String text) {
    int iterations = 0;
    for (int i = 0; i < text.length; i++) {
      iterations++;
    }
    return (iterations > 1) ? iterations * 14 : 30;
  }

  @override
  void dispose() {
    _timer.cancel();
    _player1.dispose();
    _player2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snippets[currentSnippetIndex].description,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.grey[200],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List<Widget>.generate(
                                widget.snippets[currentSnippetIndex].codeSnippet
                                    .length, (lineIndex) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: List<Widget>.generate(
                                      widget
                                          .snippets[currentSnippetIndex]
                                          .codeSnippet[lineIndex]
                                          .segments
                                          .length, (segmentIndex) {
                                    CodeSegment segment = widget
                                        .snippets[currentSnippetIndex]
                                        .codeSnippet[lineIndex]
                                        .segments[segmentIndex];
                                    if (segment.editable &&
                                        editableIndices[lineIndex]
                                            .contains(segmentIndex)) {
                                      int editableIndex =
                                          editableIndices[lineIndex]
                                              .indexOf(segmentIndex);
                                      if (showCorrectAnswers[lineIndex]
                                          [editableIndex]) {
                                        return Text(
                                          segment.text,
                                          style: TextStyle(
                                            fontFamily: 'Courier',
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        );
                                      } else {
                                        return SizedBox(
                                          width: _getWidthForText(segment.text),
                                          height: 30,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: TextField(
                                              controller: controllers[lineIndex]
                                                  [editableIndex],
                                              maxLength: segment.text.length,
                                              decoration: InputDecoration(
                                                hintText: '',
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 8),
                                                counterText: '',
                                              ),
                                              style: TextStyle(
                                                fontFamily: 'Courier',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    } else {
                                      return Text(
                                        segment.text,
                                        style: TextStyle(
                                            fontFamily: 'Courier',
                                            fontSize: 16),
                                      );
                                    }
                                  }),
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 20),
                        if (showCheckButton)
                          ElevatedButton(
                            onPressed: _checkAnswers,
                            child: Text('Check Answers'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.blue[100],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(3, (index) {
                    return Icon(
                      index < lives ? Icons.favorite : Icons.favorite_border,
                      color: index < lives ? Colors.blue : Colors.grey,
                    );
                  }),
                ),
              ),
            ],
          ),
          if (showCorrect)
            Center(
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100.0,
              ),
            ),
          if (showIncorrect)
            Center(
              child: Icon(
                Icons.cancel,
                color: Colors.red,
                size: 100.0,
              ),
            ),
        ],
      ),
    );
  }
}
