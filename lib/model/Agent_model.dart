class Agents_data {
  String? agentId;
  String? agentDate;
  String? agentStatus;
  String? agentSessionid;
  String? agentComments;
  String? agentHistory;
  String? agentDeptid;
  String? agentAvailable;
  String? agentType;
  String? agentFeatured;
  String? agentBrand;
  String? agentIdentity;
  String? agentLanguage;
  String? agentContact;
  String? agentDomain;
  String? agentPref;
  String? agentName;
  String? agentDetails;
  String? agentGender;
  String? agentLocation;
  String? agentCountry;
  String? agentPhoto1;
  String? agentPhoto2;
  String? agentVideo;

  Agents_data(
      {this.agentId,
      this.agentDate,
      this.agentStatus,
      this.agentSessionid,
      this.agentComments,
      this.agentHistory,
      this.agentDeptid,
      this.agentAvailable,
      this.agentType,
      this.agentFeatured,
      this.agentBrand,
      this.agentIdentity,
      this.agentLanguage,
      this.agentContact,
      this.agentDomain,
      this.agentPref,
      this.agentName,
      this.agentDetails,
      this.agentGender,
      this.agentLocation,
      this.agentCountry,
      this.agentPhoto1,
      this.agentPhoto2,
      this.agentVideo});

  Agents_data.fromJson(Map<String, dynamic> json) {
    agentId = json['agent_id'];
    agentDate = json['agent_date'];
    agentStatus = json['agent_status'];
    agentSessionid = json['agent_sessionid'];
    agentComments = json['agent_comments'];
    agentHistory = json['agent_history'];
    agentDeptid = json['agent_deptid'];
    agentAvailable = json['agent_available'];
    agentType = json['agent_type'];
    agentFeatured = json['agent_featured'];
    agentBrand = json['agent_brand'];
    agentIdentity = json['agent_identity'];
    agentLanguage = json['agent_language'];
    agentContact = json['agent_contact'];
    agentDomain = json['agent_domain'];
    agentPref = json['agent_pref'];
    agentName = json['agent_name'];
    agentDetails = json['agent_details'];
    agentGender = json['agent_gender'];
    agentLocation = json['agent_location'];
    agentCountry = json['agent_country'];
    agentPhoto1 = json['agent_photo1'];
    agentPhoto2 = json['agent_photo2'];
    agentVideo = json['agent_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['agent_id'] = agentId;
    data['agent_date'] = agentDate;
    data['agent_status'] = agentStatus;
    data['agent_sessionid'] = agentSessionid;
    data['agent_comments'] = agentComments;
    data['agent_history'] = agentHistory;
    data['agent_deptid'] = agentDeptid;
    data['agent_available'] = agentAvailable;
    data['agent_type'] = agentType;
    data['agent_featured'] = agentFeatured;
    data['agent_brand'] = agentBrand;
    data['agent_identity'] = agentIdentity;
    data['agent_language'] = agentLanguage;
    data['agent_contact'] = agentContact;
    data['agent_domain'] = agentDomain;
    data['agent_pref'] = agentPref;
    data['agent_name'] = agentName;
    data['agent_details'] = agentDetails;
    data['agent_gender'] = agentGender;
    data['agent_location'] = agentLocation;
    data['agent_country'] = agentCountry;
    data['agent_photo1'] = agentPhoto1;
    data['agent_photo2'] = agentPhoto2;
    data['agent_video'] = agentVideo;
    return data;
  }
}
