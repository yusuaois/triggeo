import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../data/models/map_place.dart';

// Strategy
abstract class SearchStrategy {
  Future<List<MapPlace>> search(String query, String urlTemplate, String? apiKey);
}

class SearchStrategyFactory {
  static SearchStrategy getStrategy(String apiName) {
    if (apiName.contains('Baidu') || apiName.contains('百度')) {
      return BaiduSearchStrategy();
    } else if (apiName.contains('Gaode') || apiName.contains('高德') || apiName.contains('Amap')) {
      return AmapSearchStrategy();
    } else {
      // OSM
      return OsmSearchStrategy();
    }
  }
}

// OpenStreetMap
class OsmSearchStrategy implements SearchStrategy {
  @override
  Future<List<MapPlace>> search(String query, String urlTemplate, String? apiKey) async {
    final url = Uri.parse(urlTemplate.replaceAll('{query}', query));
    final response = await http.get(url, headers: {'User-Agent': 'TriggeoApp/1.0'});
    
    if (response.statusCode != 200) return [];
    
    final List data = json.decode(response.body);
    return data.map((item) {
      return MapPlace(
        title: item['display_name'].split(',')[0],
        subtitle: item['display_name'],
        latitude: double.parse(item['lat']),
        longitude: double.parse(item['lon']),
      );
    }).toList();
  }
}

// Baidu 百度
class BaiduSearchStrategy implements SearchStrategy {
  @override
  Future<List<MapPlace>> search(String query, String urlTemplate, String? apiKey) async {
    final url = Uri.parse(urlTemplate
        .replaceAll('{query}', query)
        .replaceAll('{key}', apiKey ?? ''));
        
    final response = await http.get(url);
    if (response.statusCode != 200) return [];

    final data = json.decode(response.body);
    final results = data['results'] as List?;
    if (results == null) return [];

    return results.map((item) {
      final loc = item['location'];
      return MapPlace(
        title: item['name'],
        subtitle: item['address'] ?? "",
        latitude: (loc['lat'] as num).toDouble(),
        longitude: (loc['lng'] as num).toDouble(),
      );
    }).toList();
  }
}

// Amap 高德
class AmapSearchStrategy implements SearchStrategy {
  @override
  Future<List<MapPlace>> search(String query, String urlTemplate, String? apiKey) async {
    final url = Uri.parse(urlTemplate
        .replaceAll('{query}', query)
        .replaceAll('{key}', apiKey ?? ''));
        
    final response = await http.get(url);
    if (response.statusCode != 200) return [];

    final data = json.decode(response.body);
    final pois = data['pois'] as List?;
    if (pois == null) return [];

    List<MapPlace> places = [];
    for (var item in pois) {
      final locationStr = item['location'] as String;
      final splitLoc = locationStr.split(',');
      if (splitLoc.length == 2) {
        places.add(MapPlace(
          title: item['name'],
          subtitle: item['address'] is String ? item['address'] : item['type'],
          latitude: double.parse(splitLoc[1]), 
          longitude: double.parse(splitLoc[0]),
        ));
      }
    }
    return places;
  }
}

