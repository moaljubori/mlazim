// ignore_for_file: non_constant_identifier_names, file_names, camel_case_types
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Functions/StateMangament.dart';
import 'package:http/http.dart' as http;
late String api_website = 'http://mlazimiq.com/';
late List classesDataServer = [];
late List newsDataServer = [];
late List citysDataServer = [];
late List subjectsDataServer = [];
late List vidoesData = [];
late List malazimData = [];
late List dataclasssubject = [];
late List dataSupporters = [];
late List dataabout = [];
late List SearchData = [];
//Get Classes Data From Api ***************************
GetServerApi() async {
  late String lang = '';

final prefs = await SharedPreferences.getInstance();
var o = (prefs.getInt('counter') ?? 0);
if (o == 1) { lang = '';}
if (o == 2) { lang = 'EN';}
 

  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Options _cacheOptions =
      buildCacheOptions(const Duration(days: 10), forceRefresh: true);
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(api_website + 'ServerApi/all.php?GETDATA=1&lang=' +lang,
      options: _cacheOptions);
  Map? responseBody = response.data;
  classesDataServer = responseBody!['classes'];
  newsDataServer = responseBody['news'];
  citysDataServer = responseBody['city'];
  dataSupporters = responseBody['supporters'];
  dataabout = responseBody['about'];
  // SetState_Classroom(1);
}



//---------SerachData -------------------------------------------------

GetSearchData(value , name) async {
  subjectsDataServer.clear();
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(
      api_website +
          'ServerApi/serach.php?data=' +
          value +
          '&lang=' +
          'EN_lang'.tr,
      options: buildCacheOptions(const Duration(days: 1), forceRefresh: true));
  Map? responseBody = response.data;
  SearchData = responseBody![name];
  //print(responseBody[name]);
 
  PageSerachSetState(responseBody[name].length );
}

DataOfSubjects(id) async {
  subjectsDataServer.clear();
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(
      api_website +
          'ServerApi/subjects.php?classid=' +
          id +
          '&lang=' +
          'EN_lang'.tr,
      options: buildCacheOptions(const Duration(days: 10), forceRefresh: true));
  Map? responseBody = response.data;
  subjectsDataServer = responseBody!['subjects'];
  SetState_Subjects_Show_Classroom(1);
}

DataOfVideos(id) async {
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(
      api_website +
          'ServerApi/video.php?subjectsid=' +
          id +
          '&lang=' +
          'EN_lang'.tr,
      options: buildCacheOptions(const Duration(days: 10), forceRefresh: true));
  Map? responseBody = response.data;
  dataclasssubject = responseBody!['videos'];
  SetState_Select_Subjects_Classroom(1);
}

DataOfMalazim(id) async {
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(
      api_website +
          'ServerApi/malazim.php?subjectsid=' +
          id +
          '&lang=' +
          'EN_lang'.tr,
      options: buildCacheOptions(const Duration(days: 10), forceRefresh: true));
  Map? responseBody = response.data;
  dataclasssubject = responseBody!['malazim'];
  SetState_Select_Subjects_Classroom(1);
}

DataOfbooks(id) async {
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(
      api_website +
          'ServerApi/books.php?subjectsid=' +
          id +
          '&lang=' +
          'EN_lang'.tr,
      options: buildCacheOptions(const Duration(days: 10), forceRefresh: true));
  Map? responseBody = response.data;
  dataclasssubject = responseBody!['books'];
  SetState_Select_Subjects_Classroom(1);
}

List Request_sheetData = [];

DataOfRequest_sheet(type , classesid , cityid) async {
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(
      api_website +
          'ServerApi/examschools.php?type=' +
          type +
          '&classesid=' +
          classesid +
          '&cityid=' +
          cityid ,
      options: buildCacheOptions(const Duration(days: 1), 
      forceRefresh: true));
  Map? responseBody = response.data;
  Request_sheetData = responseBody!['examschools'];
 SetState_Request_sheet(1);
}

SetView(id, type) async {
  var url = Uri.parse(api_website + 'ServerApi/Watch.php');
  var response = await http.post(url, body: {'id': id, 'table': type});
  if (response.statusCode == 200) {
   // print('view++');
  }
}

SetFav(post, typepost) async {
  final prefs = await SharedPreferences.getInstance();
  var url = Uri.parse(api_website + 'ServerApi/AddFavorite.php');
  var response = await http.post(url, body: {
    'user': prefs.getString('IDUser').toString(),
    'post': post,
    'typepost': typepost
  });
  if (response.statusCode == 200) {
   // print('SetFav++');
  }
}

RemoveFav(post, typepost) async {
  final prefs = await SharedPreferences.getInstance();
  var url = Uri.parse(api_website + 'ServerApi/RemoveFavorite.php');
  var response = await http.post(url, body: {
    'user': prefs.getString('IDUser').toString(),
    'post': post,
    'typepost': typepost
  });
  if (response.statusCode == 200) {
   // print('RemoveFav++');
  }
}




SetRate(id_row, type , rate) async {
  final prefs = await SharedPreferences.getInstance();
  var url = Uri.parse(
    api_website + 'ServerApi/Rates.php?AddRate=1');
  var response = await http.post(url, body: {
    'user': prefs.getString('IDUser').toString(),
    'id_row': id_row,
    'type': type,
    'rate':rate
  });
  if (response.statusCode == 200) {
   
  }
}

List DataFav = [];
GetFav(type) async {
  final prefs = await SharedPreferences.getInstance();
  subjectsDataServer.clear();
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Dio().interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await Dio().get(api_website + 'ServerApi/fav.php?user=' + prefs.getString('IDUser').toString(),
  options: buildCacheOptions(const Duration(days: 1), forceRefresh: true));
  Map? responseBody = response.data;
  SearchData = responseBody![type];
  favouritesSetState(responseBody[type].length );
}



DeleteAccount() async {
  final prefs = await SharedPreferences.getInstance();
  var url = Uri.parse(api_website + 'ServerApi/DeleteAccount.php');
  var response = await http.post(url, body: {
    'id': prefs.getString('IDUser').toString(),
  });
  if (response.statusCode == 200) {
 prefs.setString('StateUserLogin', '5');
  }
}

///------------------------------- ads
class SettingsAds {
  final String id;
  final String type;
  final String page;
 
  SettingsAds({
    required this.id,
    required this.type,
    required this.page,
 
  });
}


 class ads {
  final String id;
  final String type;
  final String local;
  final String img;
  final String link;
  final String name;
  final String u;
  ads({
    required this.id,
    required this.type,
    required this.local,
    required this.img,
    required this.link,
    required this.name,
    required this.u,
  });
}


 Future<List<SettingsAds>> SettingsAdsFa() async {
  DioCacheManager _dioCacheManager;
  _dioCacheManager = DioCacheManager(CacheConfig());
  Options _cacheOptions =
      buildCacheOptions(const Duration(days: 1), forceRefresh: true);
  Dio _dio = Dio();
  _dio.interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await _dio.get(
      api_website + 'ServerApi/SettingsAds.php',
      options: _cacheOptions);
  Map? responseBody = response.data;

  List<SettingsAds> data = [];
  for (var i in responseBody!['ads']) {
    SettingsAds download = SettingsAds(
      id: i['id'],
      type: i['type'],
      page: i['page'],
 
    );
    data.add(download);
  }
  return data;
}

Future<List<ads>> ADS_BANNER_MOHMMAD() async {
  DioCacheManager _dioCacheManager;
  _dioCacheManager = DioCacheManager(CacheConfig());
  Options _cacheOptions =
      buildCacheOptions(const Duration(days: 1), forceRefresh: true);
  Dio _dio = Dio();
  _dio.interceptors.add(_dioCacheManager.interceptor);
  Response<Map> response = await _dio.get(
      api_website + 'ServerApi/ADS.php',
      options: _cacheOptions);
  Map? responseBody = response.data;

  List<ads> data = [];
  for (var i in responseBody!['ads']) {
    ads download = ads(
      id: i['id'],
      type: i['type'],
      local: i['local'],
      img: i['img'],
      link: i['link'],
      name: i['name'],
      u: i['u'],
 
    );
    data.add(download);
  }
  return data;
}