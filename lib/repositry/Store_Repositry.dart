

import 'package:saloonstore/data/Api_Manager.dart';
import 'package:saloonstore/data/Network/BaseApi_Services.dart';
import 'package:saloonstore/data/Network/Network_Api_Service.dart';
import 'package:saloonstore/model/Ads_model.dart';
import 'package:saloonstore/model/Agent_model.dart';
import 'package:saloonstore/model/Blog_model.dart';
import 'package:saloonstore/model/Items_model.dart';
import 'package:saloonstore/model/Jobs_model.dart';
import 'package:saloonstore/model/Store_Model.dart';

class Home_Repository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<Stores> storeApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.storesEndPoint);
      return response = Stores.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Items_data>> itemApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.itemsEndPoint);
      List<Items_data> itemsList = List<Items_data>.from(
          (response as List).map((item) => Items_data.fromJson(item)));
      return itemsList;
    } catch (e) {
      rethrow;
    }
  }
  // BLOG API Repository

  Future<List<Blogs_data>> blogsApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.blogsEndpoint);
      List<Blogs_data> blogsList = List<Blogs_data>.from(
          (response as List).map((blogs) => Blogs_data.fromJson(blogs)));
      return blogsList;
    } catch (e) {
      rethrow;
    }
  }
  //AGENT API

  Future<List<Agents_data>> agentApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.agentsEndpoint);
      List<Agents_data> agentList = List<Agents_data>.from(
          (response as List).map((agent) => Agents_data.fromJson(agent)));
      return agentList;
    } catch (e) {
      rethrow;
    }
  }

  //ADS Api

  Future<List<Ads_data>> adsApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.adsEndpoint);
      List<Ads_data> adsList = List<Ads_data>.from(
          (response as List).map((ads) => Ads_data.fromJson(ads)));
      return adsList;
    } catch (e) {
      rethrow;
    }
  }

  //JOBS _DATA
  Future<List<jobs_data>> jobsApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.jobsEndpoint);
      List<jobs_data> jobsList = List<jobs_data>.from(
          (response as List).map((jobs) => jobs_data.fromJson(jobs)));
      return jobsList;
    } catch (e) {
      rethrow;
    }
  }


  

  Future<Map<String, dynamic>> fetchData() async {
    try {
      Stores stores = await storeApi();
      List<Items_data> items = await itemApi();
      List<Blogs_data> blogs = await blogsApi();
      List<Ads_data> ads = await adsApi();
      List<Agents_data> agent = await agentApi();
      List<jobs_data> jobs = await jobsApi();


      return {
        'stores': stores,
        'items': items,
        'blogs': blogs,
        'ads': ads,
        'agent': agent,
        'jobs' : jobs,
      };
    } catch (e) {
      rethrow;
    }
  }
}
