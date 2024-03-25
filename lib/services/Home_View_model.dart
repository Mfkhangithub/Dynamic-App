import 'package:flutter/material.dart';
import 'package:saloonstore/data/Responces/Api_Responce.dart';
import 'package:saloonstore/model/Ads_model.dart';
import 'package:saloonstore/model/Agent_model.dart';
import 'package:saloonstore/model/Blog_model.dart';
import 'package:saloonstore/model/Items_model.dart';
import 'package:saloonstore/model/Jobs_model.dart';
import 'package:saloonstore/model/Store_Model.dart';
import 'package:saloonstore/repositry/Store_Repositry.dart';


class HomeViewModel with ChangeNotifier {
  final _myRepo = Home_Repository();

  // stores

  ApiResponse<Stores> storelist = ApiResponse.loading();
  // stores
  setStoreList(ApiResponse<Stores> response) {
    storelist = response;
    notifyListeners();
  }

//ITEM DATA LIST
  ApiResponse<List<Items_data>> itemlist = ApiResponse.loading();

  setItemList(ApiResponse<List<Items_data>> response) {
    itemlist = response;
    notifyListeners();
  }

  //BLOG DATA LIST
  ApiResponse<List<Blogs_data>> blogsList = ApiResponse.loading();

  setBlogList(ApiResponse<List<Blogs_data>> response) {
    blogsList = response;
    notifyListeners();
  }

//AGENT LIST API
  ApiResponse<List<Agents_data>> agentList = ApiResponse.loading();
  setAgentList(ApiResponse<List<Agents_data>> response) {
    agentList = response;
    notifyListeners();
  }

  //ADDS LIST API
  ApiResponse<List<Ads_data>> adslist = ApiResponse.loading();
  setAdsList(ApiResponse<List<Ads_data>> response) {
    adslist = response;
    notifyListeners();
  }

  //JOBS LIST API

  ApiResponse<List<jobs_data>> joblist = ApiResponse.loading();
  setjobList(ApiResponse<List<jobs_data>> response) {
    joblist = response;
    notifyListeners();
  }

  Future<void> fetchData() async {
    setStoreList(ApiResponse.loading());
    setItemList(ApiResponse.loading());
    setBlogList(ApiResponse.loading());
    setAdsList(ApiResponse.loading());
    setAgentList(ApiResponse.loading());
    setjobList(ApiResponse.loading());

    try {
      Map<String, dynamic> data = await _myRepo.fetchData();
      setStoreList(ApiResponse.completed(data['stores']));
      setItemList(ApiResponse.completed(data['items']));
      setBlogList(ApiResponse.completed(data['blogs']));
      setAdsList(ApiResponse.completed(data['ads']));
      setAgentList(ApiResponse.completed(data['agent']));
      setjobList(ApiResponse.completed(data['jobs']));
    } catch (e) {
      setStoreList(ApiResponse.error(e.toString()));
      setItemList(ApiResponse.error(e.toString()));
      setBlogList(ApiResponse.error(e.toString()));
      setAdsList(ApiResponse.error(e.toString()));
      setAgentList(ApiResponse.error(e.toString()));
      setjobList(ApiResponse.error(e.toString()));
    }
  }
}
