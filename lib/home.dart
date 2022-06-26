import 'package:backgapi/services/get_imgs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'services/get_imgs.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RandomImgs? rimg;
  Map data= {};
  bool init = false;

  @override
  Widget build(BuildContext context) {

    if(!init){
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }

    if(data['rimg'] != null){
      rimg = data['rimg'];
      init = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Background Images"),
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 0.0,
        centerTitle: true,
        
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/back.jpg'))
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: rimg!.urls.length,
            itemBuilder: (context, index){
              return Card(
              elevation: 1.9,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: Text(rimg!.urls[index]["alt"]),
                    subtitle: Text("By - " + rimg!.urls[index]["photographer"]),
                  ),
                  Image(image: NetworkImage(
                    rimg!.urls[index]["small"],
                  )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Support the photographer by visiting',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                           TextSpan(
                            text: " their portfolio's on Pexels.com",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                            ..onTap = (){launch(rimg!.urls[index]["photographer_url"]);}
                          )
                        ]
                      ),
                    )
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          launch(rimg!.urls[index]["original"]);
                        },
                        child: const Text('Download Image'),
                      ),
                    ],
                  ),
                ],
              ),
            );
            },
          ),
        ),
      )
    );
  }
}

// rimg.urls[0]["original"]



//  // rimg.urls[index]["photographer_url"]