class UserToken {
  String? storeLogo; // Add this line to include store logo information
  String? storetitle;
  String? address;
  String? fotter;

  UserToken({this.storeLogo, required this.storetitle, required this.address,required this.fotter});

  UserToken.fromJson(Map<String, dynamic> json) {
    storeLogo = json['storeLogo']; // Add this line to parse store logo
    storetitle = json['storetitle'];
    address = json['address'];
    fotter = json['fotter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['storeLogo'] =
        storeLogo; // Add this line to include store logo in JSON
    data['storetitle'] = storetitle;
    data['address'] = address;
    data['fotter'] = fotter;
    return data;
  }
}
