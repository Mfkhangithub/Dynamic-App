import 'package:flutter/material.dart';
import 'package:saloonstore/model/Items_model.dart';
import 'package:saloonstore/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderController extends ChangeNotifier {
  //SETTER

  late Items_data _selectedItem;
  String? _selectedpayment = 'Cash On Delivery';
  late String? videoUrl;
  bool _firstValue = false;
 // bool _secondvalue = false;
  String? mapUrl;

  //GETTERS
  bool get firstValue => _firstValue;
  //bool get secondvalue => _secondvalue;
  String? get selectedpayment => _selectedpayment;
  Items_data get selectedItem => _selectedItem;

  void setSelectedItem(Items_data newItem) {
    _selectedItem = newItem;
    notifyListeners();
  }

  final List<String> options = [
    'USDT',
    'BTC',
    'Easy Paisa',
    'Jazz Cash',
    'Cash On Delivery',
  ];

  setSelectedpayment(String value) {
    _selectedpayment = value;
    notifyListeners();
  }

  void setVideoUrl(String url) {
    videoUrl = url;
    notifyListeners();
  }

  Color getColorFromName(String color) {
    if (color.startsWith("#")) {
      // Handle hex color string
      try {
        return Color(int.parse(color.substring(1), radix: 16) + 0xFF000000);
      } catch (e) {
        // Handle invalid hex color
        print("Invalid hex color: $color");
        return Colors.black;
      }
    } else {
      // Handle color name string
      switch (color.toLowerCase()) {
        case 'orangered':
          return const Color(0xFFFF4500);
        // Add more cases for other color names as needed
        default:
          return Colors.black; // Default color if the name is not recognized
      }
    }
  }

  void  setfirstValue(bool value) {
    _firstValue = value;
    notifyListeners();
  }

  Future<void> extractMapUrl(String mapContent) async {
    final RegExp regExp = RegExp(r'src="([^"]+)"');
    final Iterable<RegExpMatch> matches = regExp.allMatches(mapContent);

    // Provide a default value or make mapUrl nullable
    if (matches.isNotEmpty) {
      final String match = matches.first.group(1)!;

      // In this case, the match already contains the map URL
      mapUrl = match;
    } else {
      mapUrl = null; // or some default URL if needed
    }

    notifyListeners();
  }

  Future<void> extractVideoUrl(String itemVideo) async {
    final RegExp regExp = RegExp(r'src="([^"]+)"');
    final Iterable<RegExpMatch> matches = regExp.allMatches(itemVideo);

    // Provide a default value or make videoUrl nullable
    if (matches.isNotEmpty) {
      final String match = matches.first.group(1)!;
      videoUrl = match;
    } else {
      videoUrl = null; // or some default URL if needed
    }

    notifyListeners();
  }
            /// FACEBOOK 01
  Future<void> launchFacebookURL() async {
    const facebookURL =
        'https://web.facebook.com/Gamezone44/?_rdc=1&_rdr'; // Replace with your Facebook page URL
    final Uri facebookUri = Uri.parse(facebookURL);
    if (await canLaunchUrl(facebookUri)) {
      await launchUrl(facebookUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  }

  // Future<void> launchinstagramURL() async {
  //   const instagrameURL =
  //       'https://www.instagram.com/gamezonesajid/'; // Replace with your Facebook page URL
  //   final Uri instagramUri = Uri.parse(instagrameURL);
  //   if (await canLaunchUrl(instagramUri)) {
  //     await launchUrl(instagramUri);
  //   } else {
  //     utils.showToastMessage("Could not load the page!");
  //   }
  // }

  //////////////////////// 02
  Future<void> launchInstagramURL() async {
  const instagramURL = 'https://www.instagram.com/gamezonesajid/';
  final Uri instagramUri = Uri.parse(instagramURL);

  if (instagramUri.toString().isNotEmpty) {
    if (await canLaunchUrl(instagramUri)) {
      await launchUrl(instagramUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Instagram link is empty!", Colors.red);
  }
}
/////////////////////TIKTOK 03
Future<void> launchTiktokURL() async {
  const tiktokURL = '';
  final Uri tiktokUri = Uri.parse(tiktokURL);

  if (tiktokUri.toString().isNotEmpty) {
    if (await canLaunchUrl(tiktokUri)) {
      await launchUrl(tiktokUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("TikTok link is empty!", Colors.red);
  }
}
/////////////////////Snap CHAT 04
Future<void> launchSnapchatURL() async {
  const snapchatURL = '';
  final Uri snapchatUri = Uri.parse(snapchatURL);

  if (snapchatUri.toString().isNotEmpty) {
    if (await canLaunchUrl(snapchatUri)) {
      await launchUrl(snapchatUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("SnapChat link is empty!", Colors.red);
  }
}

///////////////////// Draz 05

Future<void> launchDrazURL() async {
  const drazURL = '';
  final Uri drazUri = Uri.parse(drazURL);

  if (drazUri.toString().isNotEmpty) {
    if (await canLaunchUrl(drazUri)) {
      await launchUrl(drazUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Draz link is empty!", Colors.red);
  }
}

//////////////// Amazon 06

Future<void> launchAmURL() async {
  const amURL = '';
  final Uri amUri = Uri.parse(amURL);

  if (amUri.toString().isNotEmpty) {
    if (await canLaunchUrl(amUri)) {
      await launchUrl(amUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Amazon link is empty!", Colors.red);
  }
}

//////////////// Amazon 09

Future<void> launchebyURL() async {
  const ebyURL = '';
  final Uri ebyUri = Uri.parse(ebyURL);

  if (ebyUri.toString().isNotEmpty) {
    if (await canLaunchUrl(ebyUri)) {
      await launchUrl(ebyUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Ebay link is empty!", Colors.red);
  }
}

//////////////// Amazon 10

Future<void> launchlinkURL() async {
  const linkURL = '';
  final Uri linkUri = Uri.parse(linkURL);

  if (linkUri.toString().isNotEmpty) {
    if (await canLaunchUrl(linkUri)) {
      await launchUrl(linkUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Linkedln link is empty!", Colors.red);
  }
}

//////////////// Amazon 11

Future<void> launchaliURL() async {
  const aliURL = '';
  final Uri aliUri = Uri.parse(aliURL);

  if (aliUri.toString().isNotEmpty) {
    if (await canLaunchUrl(aliUri)) {
      await launchUrl(aliUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Ali Express/ Ali Baba link is empty!", Colors.red);
  }
}

//////////////// Amazon 12

Future<void> launchpriURL() async {
  const priURL = '';
  final Uri priUri = Uri.parse(priURL);

  if (priUri.toString().isNotEmpty) {
    if (await canLaunchUrl(priUri)) {
      await launchUrl(priUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Pinterest link is empty!", Colors.red);
  }
}

Future<void> launchvchatURL() async {
  const vcURL = '';
  final Uri vcUri = Uri.parse(vcURL);

  if (vcUri.toString().isNotEmpty) {
    if (await canLaunchUrl(vcUri)) {
      await launchUrl(vcUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("V Chat link is empty!", Colors.red);
  }
}

//////////////// Amazon 11

Future<void> launchtwiURL() async {
  const twiURL = '';
  final Uri twiUri = Uri.parse(twiURL);

  if (twiUri.toString().isNotEmpty) {
    if (await canLaunchUrl(twiUri)) {
      await launchUrl(twiUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("Twitter link is empty!", Colors.red);
  }
}

Future<void> launcholxURL() async {
  const olxURL = '';
  final Uri olxUri = Uri.parse(olxURL);

  if (olxUri.toString().isNotEmpty) {
    if (await canLaunchUrl(olxUri)) {
      await launchUrl(olxUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  } else {
    utils.showToastMessage("OLX link is empty!", Colors.red);
  }
}

//////////////////////////// 07 
  Future<void> launchyoutubeURL() async {
    const youtubeURL =
        'https://www.youtube.com/@gamezonesajid1150'; // Replace with your Facebook page URL
    final Uri youtubeUri = Uri.parse(youtubeURL);
    if (await canLaunchUrl(youtubeUri)) {
      await launchUrl(youtubeUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  }
///////////////////////// 08
  Future<void> launchwhatsappURL() async {
    const whatsappURL =
        'https://api.whatsapp.com/send/?phone=%2B923339688283&text=Website+Support+Inquery&type=phone_number&app_absent=0'; // Replace with your Facebook page URL
    final Uri whatsappUri = Uri.parse(whatsappURL);
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  }

 Future<void> whatapplunch(
      {required String phoneNumber, required String message}) async {
    // Replace with your WhatsApp number and encode the message
    final String encodedMessage = Uri.encodeComponent(message);
    final String whatsappURL =
        'https://api.whatsapp.com/send/?phone=$phoneNumber&text=$encodedMessage&type=phone_number&app_absent=0';

    final Uri whatsappUri = Uri.parse(whatsappURL);

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      utils.showToastMessage("Could not load the page!", Colors.red);
    }
  }


  Future<void> launchwhatsappURLwithphone(String message) async {
    final encodedMessage = Uri.encodeComponent(message);
    final whatsappURL =
        'https://api.whatsapp.com/send/?phone=$encodedMessage&text=Website+Support+Inquerye&type=phone_number&app_absent=0';
    final Uri whatsappUri = Uri.parse(whatsappURL);
    if (await canLaunch(whatsappUri.toString())) {
      await launch(whatsappUri.toString());
    } else {
      utils.showToastMessage("No what app is install ", Colors.red);
    }
  }

  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      utils.showToastMessage("No map sorry ", Colors.red);
    }
  }

  Future<void> openGmail(String recipientEmail) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: recipientEmail,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch Gmail';
    }
  }
  //REMAINING DAYS FUNCTION
  int remainingDays(String endDate) {
    if (endDate == "NA") {
      return 0;
    }

    try {
      DateTime endDateTime = DateTime.parse(endDate);
      DateTime now = DateTime.now();
      Duration difference = endDateTime.difference(now);
      return difference.inDays;
    } catch (e) {
      print("Error parsing date: $endDate");
      return 0;
}
}



}
