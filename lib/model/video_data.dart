part of 'models.dart';

class VideoData extends Equatable {
  final String key;
  final String site;
  final String name;

  VideoData({this.key, this.site, this.name});

  factory VideoData.fromJson(Map<String, dynamic> data) =>
      VideoData(key: data['key'], site: data['site'], name: data['name']);

  @override
  List<Object> get props => [key, site, name];
}
