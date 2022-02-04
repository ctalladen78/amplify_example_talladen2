import 'package:flutter_dotenv/flutter_dotenv.dart';

class StringConstants {
  static String LOCAL_PORT = "5000";
  static String LOCALHOST_BASE_URL = "http://localhost:"+LOCAL_PORT;
  static String REMOTE_BACKEND_URL = DotEnv().env["REMOTE_BACKEND_URL"].toString();
  static String REMOTE_BASE_URL = "http://us_east_1.execute_amazon_lambda";
  static String AVATAR_URL = "https://avatars.dicebear.com/v2/bottts";

  // grey template
  // https://api.mapbox.com/styles/mapbox/light-v10",
  // custom minimo template
  // https://api.mapbox.com/styles/v1/ctalladen78/cjvw31rwc017s1cmajdao7a4b/
              
  static String GOOGLE_PLACES_KEY = DotEnv().env['GOOGLE_PLACES_KEY'].toString();
  static String MAPBOX_TOKEN =  DotEnv().env["MAPBOX_TOKEN"].toString();
  static String MAPBOX_ENDPOINT = DotEnv().env["MAPBOX_ENDPOINT"].toString();
  static String FOURSQUARE_PUB_TOKEN = DotEnv().env['FOURSQUARE_PUBLIC_TOKEN'].toString();
  static String FOURSQUARE_PRIV_TOKEN = DotEnv().env['FOURSQUARE_PRIVATE_TOKEN'].toString();

  // blue template
  // styleString: "mapbox://styles/v1/ctalladen78/ck7zpd8i603bk1ir1l2atluse",
  static String MAPBOX_BLUE_TEMPLATE = "mapbox://styles/v1/ctalladen78/ck7zpd8i603bk1ir1l2atluse";

  // TODO custom minimo mapbox map
    // TESTING on web/postman
  // https://api.mapbox.com/styles/v1/ctalladen78/cjvw31rwc017s1cmajdao7a4b/static/pin-s-t+ed47ed(19.04,47.4)/19.04,47.4,12,1,50/300x300@2x?access_token=pk.eyJ1IjoiY3RhbGxhZGVuNzgiLCJhIjoiY2ppb2praTRyMGN1cDNwcW1ndnJrY2s3YiJ9.LZqZ2epLIiVuQaxH4-06FA
  static String MAPBOX_MINIMO_TEMPLATE = "mapbox://styles/v1/ctalladen78/cjvw31rwc017s1cmajdao7a4b";

    // TODO grey basic mapbox map
    // TESTING on web/postman
    // https://api.mapbox.com/styles/v1/mapbox/light-v10/static/pin-s-t+ed47ed(-74.0129,40.7156)/-74.0129,40.7156,13.5,1,50/300x250@2x?access_token=pk.eyJ1IjoiY3RhbGxhZGVuNzgiLCJhIjoiY2ppb2praTRyMGN1cDNwcW1ndnJrY2s3YiJ9.LZqZ2epLIiVuQaxH4-06FA
    static String MAPBOX_GREY_TEMPLATE =  "mapbox://styles/mapbox/light-v10";

  static String AWS_ACCESS_KEY = DotEnv().env['AWS_ACCESS_KEY'].toString();
  static String AWS_SECRET_KEY = DotEnv().env['AWS_SECRET_KEY'].toString();
  static String TASL_APP_APIID = DotEnv().env['TASL_APP_APIID'].toString();
  static String TASL_APP_REGION = "us-east-1";
  static String TASL_APP_STAGE = "Prod";

}