part  of 'services.dart';
class VideoService{
   static Future<BaseApiResponse<List<VideoData>>> getVideos(String kind,int id,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + "$kind/$id/videos?api_key=$apiKey&language=en-US";
    var response = await http.get(url, headers: {"Accept": "application/json"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return BaseApiResponse(msg: data['status_message']);
    }

    List<VideoData> videos = (data['results'] as Iterable)
        .map((e) => VideoData.fromJson(e)).where((element) => element.site=="YouTube")
        .toList();

    return BaseApiResponse(value: videos);
  }
}