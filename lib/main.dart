import 'package:flutter/material.dart';
import 'package:amplify_login_example2/home.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/services.dart';
import 'package:amplify_login_example2/Pages/LoadingPage.dart';
import 'package:amplify_login_example2/Pages/LandingPage.dart';
import 'package:amplify_login_example2/Pages/MainPage.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_core/amplify_core.dart';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName:'.env');
  // await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAmplifyConfigured = false;
  String displayState = '';
  String authState = 'User not signed in';
  String lastHubEvent = '';
  late StreamSubscription subscription;
  late AuthSession session = AuthSession(isSignedIn: false);
  var currentUser;
  var isSignedIn = false; 

  @override
  initState() {
    super.initState();
    _initAmplifyFlutter();
  }

  void _initAmplifyFlutter() async {
    AmplifyAuthCognito auth = AmplifyAuthCognito();

    // add Amplify plugins
    await Amplify.addPlugins([auth]);
    // await Amplify.addPlugins([auth, _dataStorePlugin]);

    // Initialize AmplifyFlutter
    try {
      // configure Amplify after adding plugins
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Amplify was already configured");
    } catch (e) {

      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }


    subscription = Amplify.Hub.listen([HubChannel.Auth], (hubEvent) {
      switch (hubEvent.eventName) {
        case 'SIGNED_IN':
          {
            setState(() {
              lastHubEvent = 'SIGNED_IN';
            });
            print('HUB: USER IS SIGNED IN');
          }
          break;
        case 'SIGNED_OUT':
          {
            setState(() {
              lastHubEvent = 'SIGNED_OUT';
            });
            print('HUB: USER IS SIGNED OUT');
          }
          break;
        case 'SESSION_EXPIRED':
          {
            setState(() {
              lastHubEvent = 'SESSION_EXPIRED';
            });
            print('HUB: USER SESSION HAS EXPIRED');
          }
          break;
      }
    });
    try{
        await _isSignedIn();
        await _fetchSession();
        await _getCurrentUser();
      }catch(e){
        print(e);
    }
    // checking current session
    subscription.onData((event) {
      print("ON DATA ${event}");
      if (event == 'SIGNED_OUT') {
        print("XXXXX Successfully signed out");
      }
      });

    setState(() {
      _isAmplifyConfigured = true;
      // displayState = isSignedIn ? 'SIGNED_IN' : 'SHOW_SIGN_IN';
      // authState = isSignedIn ? 'User already signed in' : 'User not signed in';
    });
  }

  Future<void> _isSignedIn() async {
    session = await Amplify.Auth.fetchAuthSession();
    print("IS SIGNED IN ${session.isSignedIn}");
  }

  Widget _display() {
    print("IS AMPLIFY CONFIGURED: ${_isAmplifyConfigured}");
    if (session.isSignedIn){
      return MainPage();
    }
    if (_isAmplifyConfigured) {
      return LandingPage();
    } else {
      return LoadingPage();
    }
  }
  Future<void> _fetchSession() async {
    try {
      CognitoAuthSession csession = await Amplify.Auth.fetchAuthSession(
              options: CognitoSessionOptions(getAWSCredentials: true))
          as CognitoAuthSession;
      print('Session Sign In Status = ' + csession.isSignedIn.toString());
      // TODO use DotEnv to store secret keys
      // print("Credentials ${csession.credentials.awsSecretKey}");
      // print("Credentials ${csession.credentials.awsAccessKey}");
      print("Credentials ${csession.identityId}");
      print("Credentials ${csession.userPoolTokens}");

    } on AmplifyException catch (e) {
      // setError(e);
      print("Session fetch error $e");
    }
  }

  Future<void> _getCurrentUser() async {
    try {
      AuthUser res = await Amplify.Auth.getCurrentUser();
      // Amplify.Auth.fetchUserAttributes();
      print('Current User Name = ' + res.username);
      print('Current User Id = ' + res.userId);
    } on AmplifyException catch (e) {
      print(e);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Amplify App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _display());
  }
}
