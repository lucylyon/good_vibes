import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ResourcesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ResourcesPageState();
}

class ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Resources"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Text('Suicide Hotline:\n 800-273-8255',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
            ),
            // RaisedButton(
            //   padding: EdgeInsets.all(15),
            //   color: Colors.green,
            //    onPressed: _launchURL2,
            //   child: Text('link',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold
            //   ))),
            RaisedButton(
                padding: EdgeInsets.all(15),
                color: Colors.green,
                onPressed: _launchURL,
                child: Text('Just need to talk?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )))
          ]
        )
      ),
    );
  }

 // https://pub.dev/packages/url_launcher
  _launchURL() async {
    const url = 'https://www.7cups.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url = 'https://stackoverflow.com/questions/43149055/how-do-i-open-a-web-browser-url-from-my-flutter-code';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


