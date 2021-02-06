part of 'services.dart';

class SeriesService {
  static Future<BaseApiResponse<List<SeriesData>>> getSeries(
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseURL + "tv/popular?api_key=" + apiKey + "&language=en-US";
    var response = await client.get(url);

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return BaseApiResponse(msg: data['status_message']);
    }
    List<SeriesData> serieses = (data['results'] as Iterable)
        .map((e) => SeriesData.fromJson(e))
        .toList();
    log(data['results'].toString());

    return BaseApiResponse(value: serieses);
  }
}
