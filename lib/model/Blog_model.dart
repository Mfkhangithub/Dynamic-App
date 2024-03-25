class Blogs_data {
  String? postId;
  String? postDate;
  String? postStatus;
  String? postSessionid;
  String? postComments;
  String? postHistory;
  String? postDeptid;
  String? postAuthor;
  String? postLocation;
  String? postTitle;
  String? postCategory;
  String? postFeatured;
  String? postVideo;
  String? postText;
  String? postPhotos;
  String? postSm;
  String? postOtherfiles;
  String? postAudio;
  String? postItext;
  String? postDlinks;
  String? postCelebrity;

  Blogs_data(
      {this.postId,
      this.postDate,
      this.postStatus,
      this.postSessionid,
      this.postComments,
      this.postHistory,
      this.postDeptid,
      this.postAuthor,
      this.postLocation,
      this.postTitle,
      this.postCategory,
      this.postFeatured,
      this.postVideo,
      this.postText,
      this.postPhotos,
      this.postSm,
      this.postOtherfiles,
      this.postAudio,
      this.postItext,
      this.postDlinks,
      this.postCelebrity});

  Blogs_data.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postDate = json['post_date'];
    postStatus = json['post_status'];
    postSessionid = json['post_sessionid'];
    postComments = json['post_comments'];
    postHistory = json['post_history'];
    postDeptid = json['post_deptid'];
    postAuthor = json['post_author'];
    postLocation = json['post_location'];
    postTitle = json['post_title'];
    postCategory = json['post_category'];
    postFeatured = json['post_featured'];
    postVideo = json['post_video'];
    postText = json['post_text'];
    postPhotos = json['post_photos'];
    postSm = json['post_sm'];
    postOtherfiles = json['post_otherfiles'];
    postAudio = json['post_audio'];
    postItext = json['post_itext'];
    postDlinks = json['post_dlinks'];
    postCelebrity = json['post_celebrity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId ?? "";
    data['post_date'] = postDate ?? " ";
    data['post_status'] = postStatus ?? "";
    data['post_sessionid'] = postSessionid ?? " ";
    data['post_comments'] = postComments ?? "";
    data['post_history'] = postHistory ?? " ";
    data['post_deptid'] = postDeptid ?? "";
    data['post_author'] = postAuthor ?? "";
    data['post_location'] = postLocation ?? "";
    data['post_title'] = postTitle ?? " ";
    data['post_category'] = postCategory ?? " ";
    data['post_featured'] = postFeatured ?? "";
    data['post_video'] = postVideo ?? " ";
    data['post_text'] = postText ?? "";
    data['post_photos'] = postPhotos ?? " ";
    data['post_sm'] = postSm ?? '';
    data['post_otherfiles'] = postOtherfiles ?? " ";
    data['post_audio'] = postAudio ?? " ";
    data['post_itext'] = postItext ?? " ";
    data['post_dlinks'] = postDlinks ?? " ";
    data['post_celebrity'] = postCelebrity ?? " ";
    return data;
  }
}
