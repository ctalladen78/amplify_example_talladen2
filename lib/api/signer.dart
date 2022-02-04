import 'package:aws_url_signer/aws_url_signer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:amplify_login_example2/string_constants.dart';

class Signer {
  String? sessionToken;
  String? accessKey;
  String? secretKey;
  String? stage;
  String? apiId;
  String? region;
  Signer({
    this.sessionToken, this.accessKey, this.secretKey, this.stage, this.apiId, this.region});


  void signRequest(){
    /**
     * apiId = StringConstants.TASL_APP_APIID
     * region = StringConstants.
     * stage = StringConstants.
     * accessKey = StringConstants.AWS_ACCESS_KEY
     * sessionToken = StringConstants.AWS_SECRET_KEY
     */
  }

}