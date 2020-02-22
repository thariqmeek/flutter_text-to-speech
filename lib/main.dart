import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(TheApp());

class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar
    (
      title: Text('TEXT TO SPEECH CONVERTER'),
      centerTitle: true,
      backgroundColor: Colors.red[600],
    ),
        body:MyApp(),
      ),

      
    );
  }
}

class MyApp extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    Future _speak(String text) async {
        
        await flutterTts.setLanguage("en-IN");
        await flutterTts.setPitch(1);
        
        
        await flutterTts.speak(text);

    }
    return Container(
      
      alignment: Alignment.center,
      child: Column(
        mainAxisSize:MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon:  Icon(Icons.textsms),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10) )            ),
            controller: textEditingController,
            

          ),
        
       RaisedButton(child: Text('PRESS TO CONVERT'),
      onPressed: () =>_speak(textEditingController.text),
      
      color:Colors.amber[300]
      ),
      ],
      ),
    );
  }
}