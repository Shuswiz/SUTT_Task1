//import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen();
  }
}

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

// class SizeConfig {
//   static late MediaQueryData _mediaQueryData;
//   static late double screenWidth;
//   static late double screenHeight;
//   static late double blockSizeHorizontal;
//   static late double blockSizeVertical;

//   static void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//     blockSizeHorizontal = screenWidth / 100;
//     blockSizeVertical = screenHeight / 100;
//   }
// }

class _ScreenState extends State<Screen> {
  bool followcond = true;

  bool addnull = false;

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  String generate100000() {
    var random = new Random();
    //print(random.nextInt(10000));
    return random.nextInt(100000).toString();
  }

  String generate10000() {
    var random = new Random();
    //print(random.nextInt(1000));
    return random.nextInt(10000).toString();
  }

  String generate1000() {
    var random = new Random();
    //print(random.nextInt(100));
    return random.nextInt(1000).toString();
  }

  String generate100() {
    var random = new Random();
    //print(random.nextInt(100));
    return random.nextInt(100).toString();
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "User Added",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            content: Text(
              "User " + myController.text + " added successfully",
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                elevation: 5,
                child: Text("OK"),
              )
            ],
          );
        });
  }

  futureFeature(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Future Updates!!!!",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            content: Text(
              "Dark Mode is being developed.\nCheck out our news to stay updated.\nSorry for the inconvenience.",
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                elevation: 5,
                child: Text("OK"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig.init(context);
    // SizeConfig._mediaQueryData;
    return Container(
        // height: SizeConfig.blockSizeVertical / 2,
        // width: SizeConfig.blockSizeHorizontal / 2,
        child: MaterialApp(
            home: Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        //leading: BackButton(),
        leading: Icon(
          Icons.account_circle,
          size: 30,
        ),
        toolbarHeight: 60,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[100],
        foregroundColor: Colors.indigo[600],
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                futureFeature(context);
              },
              icon: Icon(
                Icons.dark_mode,
                size: 30,
                color: Colors.grey[600],
              ))
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),

        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/profile_pic.png'),
                  //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                  fit: BoxFit.cover),
              border: Border.all(width: 6, color: Colors.purple)),
        ),

        // CircleAvatar(
        //   child: ClipRRect(
        //     child: Image.asset('assets/profile_pic.png'),
        //     borderRadius: BorderRadius.circular(50.0),
        //   ),
        //   // backgroundImage: NetworkImage(
        //   //     'https://www.thesprucepets.com/thmb/mLZ35bIMx2ngH-95ZO2D-BibX8I=/434x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/51152221_1137081246458617_3144049680416140765_n-5c73f04d46e0fb0001835dd2.jpg'),
        //   radius: 100,
        // ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: myController,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(),
            hintText: 'Enter Name',
          ),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 38, color: Colors.amber[900]),
        ),
// For constant name showing, comment he textfield widget and uncomment the text widget
        // Text(
        //   "Dog",
        //   style: TextStyle(
        //     fontSize: 50,
        //     color: Colors.amber,
        //   ),
        // ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton.icon(
              onPressed: () {
                setState(() {
                  followcond = !followcond;
                });
              },
              icon: followcond
                  ? Icon(
                      Icons.add_circle,
                      size: 23,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.check,
                      size: 23,
                      color: Colors.white,
                    ),
              label: followcond
                  ? Text(
                      "Follow",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    )
                  : Text("Following",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color.fromRGBO(255, 0, 0, 1.0)),
              ),
              padding: EdgeInsets.all(10.0),
              color: Colors.red,
//below code is for flat button and different designs
              // style: ButtonStyle(
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(18.0),
              //       side: BorderSide(color: Colors.red),
              //     ),
              //   ),
              // ),
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Message()));
              },
              icon: Icon(
                Icons.message,
                size: 23,
                color: Colors.white,
              ),
              label: Text(
                "Message",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color.fromRGBO(0, 0, 255, 1.0)),
              ),
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
////below code is for flat button and different designs
              // style: ButtonStyle(
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(18.0),
              //       side: BorderSide(color: Colors.blue),
              //     ),
              //   ),
              // ),
            ),
            RaisedButton.icon(
              onPressed: () {
                createAlertDialog(context);
                setState(() {
                  addnull = !addnull;
                });
              },
              icon: Icon(
                Icons.supervised_user_circle_rounded,
                size: 23,
                color: Colors.white,
              ),
              label: Text(
                "Add",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color.fromRGBO(0, 255, 0, 1.0)),
              ),
              padding: EdgeInsets.all(10.0),
              color: Colors.green,
////below code is for flat button and different designs
              // style: ButtonStyle(
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(18.0),
              //       side: BorderSide(color: Colors.green),
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Followers: " + generate10000(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Following: " + generate10000(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Posts: " + generate1000(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    )));
  }
}

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final myController = TextEditingController();

  void clearText() {
    myController.clear();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Message Sent",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                elevation: 5,
                child: Text("OK"),
              )
            ],
          );
        });
  }

  videoCall(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Row(
              children: [
                Icon(
                  Icons.error,
                  size: 35,
                  color: Colors.red[900],
                ),
                Text(
                  "  Call not sent",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            )),
            content: Text(
              "Please check your internet connection.",
              style: TextStyle(fontSize: 20),
            ),
            elevation: 5,
          );
        });
  }

  voiceCall(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Row(
              children: [
                Icon(
                  Icons.error,
                  size: 35,
                  color: Colors.red[900],
                ),
                Text(
                  "  Call not sent",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            )),
            content: Text(
              "Please check your internet connection.",
              style: TextStyle(fontSize: 20),
            ),
            elevation: 5,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Screen()));
            },
          ),
          toolbarHeight: 75,
          title: Text(
            "Message",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.indigo[600],
          elevation: 0,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  voiceCall(context);
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.green[400],
                )),
            IconButton(
                onPressed: () {
                  videoCall(context);
                },
                icon: Icon(
                  Icons.video_camera_front_rounded,
                  color: Colors.green[400],
                )),
          ],
        ),
        body: Container(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Message',
                    suffixIcon: IconButton(
                        onPressed: () {
                          createAlertDialog(context);
                          clearText();
                        },
                        icon: Icon(
                          Icons.send,
                        ))),
              )),
        ),
      ),
    );
  }
}
