/*
 * Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:amplify_login_example2/Views/ImageLineItem.dart';
// import 'package:amplify_login_example2/Views/ImageUploader.dart';
import 'package:amplify_login_example2/Views/UserView.dart';
import 'package:amplify_login_example2/Pages/LandingPage.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class MainPage extends StatefulWidget {
  String? username;
  MainPage({this.username});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> itemKeys = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  void _loadImages() async {
    try {
      print('In list');
      // S3ListOptions options =
      //     S3ListOptions(accessLevel: StorageAccessLevel.guest);
      // ListResult result = await Amplify.Storage.list(options: options);

      var newList = itemKeys.toList();
      // for (StorageItem item in result.items) {
      //   newList.add(item.key);
      // }

      setState(() {
        itemKeys = newList;
      });
    } catch (e) {
      print('List Err: ' + e.toString());
    }
  }

  void _showImageUploader() async {
    // String key = await showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return new SimpleDialog(
    //           title: Text("Upload Image"), children: [ImageUploader()]);
    //     });

    // if (key.isNotEmpty) {
    //   var newList = itemKeys.toList();
    //   newList.add(key);

    //   setState(() {
    //     itemKeys = newList;
    //   });
    // }
  }

  // void _logout() async {
  //   try {
  //     await Amplify.Auth.signOut();
      // showResult('Signed Out');
      // changeDisplay('SHOW_SIGN_IN');
  //   } on AmplifyException catch (e) {
  //     setState(() {
  //       print(e.toString());
  //     });
  //     print(e);
  //   }
  // }
  void _signOut() async {
    try {
      SignOutResult res = await Amplify.Auth.signOut();

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LandingPage()),
          (route) => false);
    } on AmplifyException catch (e) {
      print(e.toString());
    } on AuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          // title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [Text("Main"), Text("Page")])),
          actions:<Widget>[
            IconButton(icon: Icon(Icons.logout_rounded), onPressed: _signOut),
          ]
      ),
      body: Center(child: Text("Sign in success", style: TextStyle(color: Colors.black45, fontSize: 40))),
      // body: ListView.builder(
      //     itemCount: itemKeys.length,
      //     itemBuilder: (context, index) {
            // return ImageLineItem(storageKey: itemKeys[index]);
          // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _showImageUploader();
          print("SHOW IMAGE UPLOADER");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}