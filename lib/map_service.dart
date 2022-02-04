import 'package:amplify_login_example2/string_constants.dart';

class MapService {


  // StringConstants.MAPBOX_BLUE_TEMPLATE
  String buildMapBoxUrlString({centerlat: String,centerlong: String, overlay: String,lat : String, long : String, width: int, height: int, style: String, acct: String}){
    String markColor = "ed47ed"; // pink
    // String markNumber = "o";
    String overlay = "pin-s+${markColor}(${centerlong},${centerlat})/";
    String style = "cjj9hblta3ibc2spgjin13ogv/draft"; // "cjvw31rwc017s1cmajdao7a4b"; // streets-v11; // light-v9
    String zoom = "13"; // bearing
    // String acct = "ctalladen78"; // mapbox
    print("MAP LAT LONG $lat $long");
    var mb = StringConstants.MAPBOX_TOKEN;

    String retVal = "https://api.mapbox.com/styles/v1/${acct}/${style}/static/${overlay}${centerlong},${centerlat},${zoom},0,50/${width}x${height}@2x?access_token=${mb}";
    print("MAPBOX URI $retVal");
    return retVal;
  }


  // mapbox geocoding api
    // https://api.mapbox.com/geocoding/v5/mapbox.places/1600-Pennsylvania.json?bbox=-77.083056,38.908611,-76.997778,38.959167&access_token=pk.eyJ1IjoiY3RhbGxhZGVuNzgiLCJhIjoiY2ppb2praTRyMGN1cDNwcW1ndnJrY2s3YiJ9.LZqZ2epLIiVuQaxH4-06FA
    // https://api.mapbox.com/geocoding/v5/mapbox.places/1600-Pennsylvania.json?proximity=-77.083056,38.908611&access_token=pk.eyJ1IjoiY3RhbGxhZGVuNzgiLCJhIjoiY2ppb2praTRyMGN1cDNwcW1ndnJrY2s3YiJ9.LZqZ2epLIiVuQaxH4-06FA
    // https://docs.mapbox.com/help/glossary/bounding-box/
    // Map<String,dynamic> qParams = {
    //   "key": DotEnv().env["MAPBOX_TOKEN"], 
    //   "types":"place,poi,locality,district,neighborhood",
    //   "proximity":{"long":centerLong, "lat": centerLat}
    // };
    // input = "Starbucks";
}