part of 'services.dart';

class MovieService {
  static Future<BaseApiResponse<List<MovieData>>> getMovies(
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url =
        baseURL + "movie/popular?api_key=" + apiKey + "&language=en-US";
    var response =
        await client.get(url, headers: {"Accept": "application/json"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return BaseApiResponse(msg: data['status_message']);
    }

    List<MovieData> movies = (data["results"] as Iterable)
        .map((e) => MovieData.fromJson(e))
        .toList();

    return BaseApiResponse(value: movies);
  }
}
