import 'package:flutter/material.dart';
import 'Lists.dart';


class PicturePage extends StatefulWidget{

  @override
  State createState() => new PicturePageState();
}

class PicturePageState extends State<PicturePage> {

  String picture;

  String _pickPicture(){
    pictures.shuffle();
    return pictures.last;
  }

  @override
  Widget build(BuildContext context) {
    picture =  _pickPicture();
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: const Text('Happy Image!'),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: Center(
    child: new Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget> [
    Padding(
      padding: EdgeInsets.fromLTRB(0,0,0,50),
        child: Image(image: AssetImage(picture))
    ),
    RaisedButton(
      padding: EdgeInsets.all(20),
      color: Colors.cyanAccent[700],
        onPressed: () {
          setState(() => picture = _pickPicture());
      },
      child: Text("Get another picture",
        style: TextStyle(
        color: Colors.white,
        fontSize: 18),
      ))
    ]
    ),));
  }
}