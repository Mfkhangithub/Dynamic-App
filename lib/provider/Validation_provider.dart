import 'package:flutter/material.dart';
import 'package:saloonstore/provider/Validation_item.dart';


class ValidationProvider extends ChangeNotifier {
  late validaitonitem _name = validaitonitem(null, null);
  late validaitonitem _address = validaitonitem(null, null);
  late validaitonitem _whatsapp = validaitonitem(null, null);
  late validaitonitem _email = validaitonitem(null, null);
  late validaitonitem _fromtext = validaitonitem(null, null);

  //send message
  late validaitonitem _Name = validaitonitem(null, null);
  late validaitonitem _Email = validaitonitem(null, null);
  late validaitonitem _Message = validaitonitem(null, null);
  late validaitonitem _Fromtext = validaitonitem(null, null);


  validaitonitem get name => _name;
  validaitonitem get address => _address;
  validaitonitem get whatsapp => _whatsapp;
  validaitonitem get email => _email;
  validaitonitem get fromtext => _fromtext;


  //send message
  validaitonitem get NAME => _Name;
  validaitonitem get Email => _Email;
  validaitonitem get Massage => _Message;
  validaitonitem get Fromtext => _Fromtext;


//Controllers
  final namecontorller = TextEditingController();
  final adresscontorller = TextEditingController();
  final whatappcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final fromtextcontroller = TextEditingController();


  //send message
  final Messagecontorller = TextEditingController();
  final Namecontorller = TextEditingController();
  final Emailcontorller = TextEditingController();
  final Fromtextcontorller = TextEditingController();


  //dispsoe the controller
  void disposeControllers() {
    emailcontroller.dispose();
    adresscontorller.dispose();
    whatappcontroller.dispose();
    namecontorller.dispose();
    Messagecontorller.dispose();
    Emailcontorller.dispose();
    Namecontorller.dispose();
    Fromtextcontorller.dispose();

  }

  // Name validation function
  void validateName(String value) {
    if (value.isEmpty) {
      _name = validaitonitem(value, "enter your name");
    } else {
      _name = validaitonitem(value, null);
    }
    notifyListeners();
  }

  void validateAddress(String value) {
    if (value.isEmpty) {
      _address = validaitonitem(value, "enter you address");
    } else {
      _address = validaitonitem(value, null);
    }
    notifyListeners();
  }

  void validateWhatsapp(String value) {
    if (value.isEmpty) {
      _whatsapp = validaitonitem(value, 'WhatsApp number cannot be empty');
    } else if (!value.startsWith("+92")) {
      _whatsapp = validaitonitem(value, 'WhatsApp must start with +92');
    } else {
      _whatsapp = validaitonitem(value, null);
    }

    notifyListeners();
  }

  // Email validation function
  void validateEmail(String value) {
    if (value.isEmpty) {
      _email = validaitonitem(value, "enter your email");
    } else if (!isValidEmail(value)) {
      _email = validaitonitem(value, 'Enter a valid email address');
    } else {
      _email = validaitonitem(value, null);
    }
    notifyListeners();
  }

  // SEND MESSAGE
  void validateMessage(String value) {
    if (value.isEmpty) {
      _Message = validaitonitem(value, "Enter your message");
    } else {
      _Message = validaitonitem(value, null);
    }
    notifyListeners();
  }

  void validatemessagename(String value) {
    if (value.isEmpty) {
      _Name = validaitonitem(value, "enter your name");
    } else {
      _Name = validaitonitem(value, null);
    }
    notifyListeners();
  }

  void validatemeesageemail(String value) {
    if (value.isEmpty) {
      _Email = validaitonitem(value, "enter your email");
    } else if (!isValidEmail(value)) {
      _Email = validaitonitem(value, 'Enter a valid email address');
    } else {
      _Email = validaitonitem(value, null);
    }
    notifyListeners();
  }

  // Helper function to check if the email is valid
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

  bool get isFormValid {
    if (_name.Value != null &&
        _address.Value != null &&
        _whatsapp.Value != null &&
        _email.Value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get ismessageFormValid {
    if (_Name.Value != null && _Message.Value != null && _Email.Value != null) {
      return true;
    } else {
      return false;
      }
  }
}
