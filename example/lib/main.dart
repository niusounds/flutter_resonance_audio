import 'package:flutter/material.dart';
import 'package:flutter_resonance_audio/flutter_resonance_audio.dart';

const title = 'FlutterResonanceAudio Example';
const List<String> notes = ['c', 'd', 'e', 'f', 'g', 'a', 'b'];

final audioEngine = FlutterResonanceAudio();

void main() async {
  await audioEngine.init();

  notes.forEach((note) {
    audioEngine.preloadSoundFile('sound/$note.ogg');
  });

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(
        child: KeyBoard(
          keys: notes.length,
        ),
      ),
    );
  }
}

class KeyBoard extends StatefulWidget {
  final int keys;
  const KeyBoard({
    Key key,
    @required this.keys,
  }) : super(key: key);

  @override
  _KeyBoardState createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  List<bool> _pressedKeys;

  @override
  void initState() {
    super.initState();
    _pressedKeys = List.generate(widget.keys, (i) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.keys,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTapDown: (_) => _setPressed(i, true),
          onTapUp: (_) => _setPressed(i, false),
          onTapCancel: () => _setPressed(i, false),
          onTap: () => _play(notes[i], (i / notes.length * 2 - 1)),
          child: _Key(
            pressed: _pressedKeys[i],
            note: notes[i].toUpperCase(),
          ),
        );
      },
    );
  }

  void _setPressed(int i, bool pressed) {
    setState(() {
      _pressedKeys[i] = pressed;
    });
  }

  /// Play sound.
  /// [position] is -1.0 (most left) to +1.0 (most right)
  void _play(String note, double position) async {
    int sourceId = await audioEngine.createSoundObject('sound/$note.ogg');
    audioEngine.playSound(sourceId);
    audioEngine.setSoundObjectPosition(sourceId, position, 0, 0);
  }
}

class _Key extends StatelessWidget {
  final bool pressed;
  final String note;

  const _Key({
    Key key,
    @required this.pressed,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(2),
      duration: const Duration(milliseconds: 100),
      width: 52,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        color: pressed ? Colors.grey : Colors.white,
      ),
      child: Center(
        child: Text(
          note,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
