class Ads_data {
  String? adId;
  String? adDate;
  String? adStatus;
  String? adSessionid;
  String? adComments;
  String? adHistory;
  String? adDeptid;
  String? adOnoff;
  String? adType;
  String? adDuration;
  String? adBrand;
  String? adLink;
  String? adTitle;
  String? adDetails;
  String? adGender;
  String? adSeason;
  String? adPhoto1;
  String? adPhoto2;
  String? adVideo;

  Ads_data(
      {this.adId,
      this.adDate,
      this.adStatus,
      this.adSessionid,
      this.adComments,
      this.adHistory,
      this.adDeptid,
      this.adOnoff,
      this.adType,
      this.adDuration,
      this.adBrand,
      this.adLink,
      this.adTitle,
      this.adDetails,
      this.adGender,
      this.adSeason,
      this.adPhoto1,
      this.adPhoto2,
      this.adVideo});

  Ads_data.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    adDate = json['ad_date'];
    adStatus = json['ad_status'];
    adSessionid = json['ad_sessionid'];
    adComments = json['ad_comments'];
    adHistory = json['ad_history'];
    adDeptid = json['ad_deptid'];
    adOnoff = json['ad_onoff'];
    adType = json['ad_type'];
    adDuration = json['ad_duration'];
    adBrand = json['ad_brand'];
    adLink = json['ad_link'];
    adTitle = json['ad_title'];
    adDetails = json['ad_details'];
    adGender = json['ad_gender'];
    adSeason = json['ad_season'];
    adPhoto1 = json['ad_photo1'];
    adPhoto2 = json['ad_photo2'];
    adVideo = json['ad_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_id'] = adId;
    data['ad_date'] = adDate;
    data['ad_status'] = adStatus;
    data['ad_sessionid'] = adSessionid;
    data['ad_comments'] = adComments;
    data['ad_history'] = adHistory;
    data['ad_deptid'] = adDeptid;
    data['ad_onoff'] = adOnoff;
    data['ad_type'] = adType;
    data['ad_duration'] = adDuration;
    data['ad_brand'] = adBrand;
    data['ad_link'] = adLink;
    data['ad_title'] = adTitle;
    data['ad_details'] = adDetails;
    data['ad_gender'] = adGender;
    data['ad_season'] = adSeason;
    data['ad_photo1'] = adPhoto1;
    data['ad_photo2'] = adPhoto2;
    data['ad_video'] = adVideo;
    return data;
  }
}
