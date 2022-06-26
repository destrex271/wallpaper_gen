import 'package:backgapi/services/get_imgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  RandomImgs rimg = RandomImgs();

  void init() async{
    await rimg.getImgs();
    Navigator.pushReplacementNamed(context, '/home', arguments: {'rimg':rimg});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
          color: Colors.blue,
          size: 200.0
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("RandomBG", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
        )
          ],
        )
      ),
    );
  }
}