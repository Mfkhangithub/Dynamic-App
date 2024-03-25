class jobs_data {
  String? jobId;
  String? jobDate;
  String? jobStatus;
  String? jobSessionid;
  String? jobComments;
  String? jobHistory;
  String? jobDeptid;
  String? jobDepartment;
  String? jobType;
  String? jobTitle;
  String? jobBrand;
  String? jobFeatured;
  String? jobCode;
  String? jobInterview;
  String? jobRequirements;
  String? jobDescription;
  String? jobSkillsrequired;
  String? jobSalary;
  String? jobTiming;
  String? jobCareerlevel;
  String? jobNature;
  String? jobPosteddate;
  String? jobLastdate;
  String? jobEducationalreq;
  String? jobAllowance;
  String? jobIncrement;
  String? jobLocation;
  String? jobGender;
  String? jobCharges;
  String? jobPhoto1;
  String? jobPhoto2;
  String? jobVideo;

  jobs_data(
      {this.jobId,
      this.jobDate,
      this.jobStatus,
      this.jobSessionid,
      this.jobComments,
      this.jobHistory,
      this.jobDeptid,
      this.jobDepartment,
      this.jobType,
      this.jobTitle,
      this.jobBrand,
      this.jobFeatured,
      this.jobCode,
      this.jobInterview,
      this.jobRequirements,
      this.jobDescription,
      this.jobSkillsrequired,
      this.jobSalary,
      this.jobTiming,
      this.jobCareerlevel,
      this.jobNature,
      this.jobPosteddate,
      this.jobLastdate,
      this.jobEducationalreq,
      this.jobAllowance,
      this.jobIncrement,
      this.jobLocation,
      this.jobGender,
      this.jobCharges,
      this.jobPhoto1,
      this.jobPhoto2,
      this.jobVideo});

  jobs_data.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobDate = json['job_date'];
    jobStatus = json['job_status'];
    jobSessionid = json['job_sessionid'];
    jobComments = json['job_comments'];
    jobHistory = json['job_history'];
    jobDeptid = json['job_deptid'];
    jobDepartment = json['job_department'];
    jobType = json['job_type'];
    jobTitle = json['job_title'];
    jobBrand = json['job_brand'];
    jobFeatured = json['job_featured'];
    jobCode = json['job_code'];
    jobInterview = json['job_interview'];
    jobRequirements = json['job_requirements'];
    jobDescription = json['job_description'];
    jobSkillsrequired = json['job_skillsrequired'];
    jobSalary = json['job_salary'];
    jobTiming = json['job_timing'];
    jobCareerlevel = json['job_careerlevel'];
    jobNature = json['job_nature'];
    jobPosteddate = json['job_posteddate'];
    jobLastdate = json['job_lastdate'];
    jobEducationalreq = json['job_educationalreq'];
    jobAllowance = json['job_allowance'];
    jobIncrement = json['job_increment'];
    jobLocation = json['job_location'];
    jobGender = json['job_gender'];
    jobCharges = json['job_charges'];
    jobPhoto1 = json['job_photo1'];
    jobPhoto2 = json['job_photo2'];
    jobVideo = json['job_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_id'] = jobId;
    data['job_date'] = jobDate;
    data['job_status'] = jobStatus;
    data['job_sessionid'] = jobSessionid;
    data['job_comments'] = jobComments;
    data['job_history'] = jobHistory;
    data['job_deptid'] = jobDeptid;
    data['job_department'] = jobDepartment;
    data['job_type'] = jobType;
    data['job_title'] = jobTitle;
    data['job_brand'] = jobBrand;
    data['job_featured'] = jobFeatured;
    data['job_code'] = jobCode;
    data['job_interview'] = jobInterview;
    data['job_requirements'] = jobRequirements;
    data['job_description'] = jobDescription;
    data['job_skillsrequired'] = jobSkillsrequired;
    data['job_salary'] = jobSalary;
    data['job_timing'] = jobTiming;
    data['job_careerlevel'] = jobCareerlevel;
    data['job_nature'] = jobNature;
    data['job_posteddate'] = jobPosteddate;
    data['job_lastdate'] = jobLastdate;
    data['job_educationalreq'] = jobEducationalreq;
    data['job_allowance'] = jobAllowance;
    data['job_increment'] = jobIncrement;
    data['job_location'] = jobLocation;
    data['job_gender'] = jobGender;
    data['job_charges'] = jobCharges;
    data['job_photo1'] = jobPhoto1;
    data['job_photo2'] = jobPhoto2;
    data['job_video'] = jobVideo;
    return data;
  }
}
