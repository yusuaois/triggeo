import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Modle of Tile Source
class TileSource {
  final String name;
  final String urlTemplate;
  const TileSource(this.name, this.urlTemplate);
}

const List<TileSource> kTileSources = [
  TileSource('OpenStreetMap (Default)',
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
  TileSource('CartoDB Voyager',
      'https://basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png'),
  TileSource(
      'CartoDB Dark', 'https://basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png'),
];

// Modle of SearchApi Source
class SearchApi {
  final String name;
  final String urlTemplate;
  final bool needKey;
  final String assetPath;
  const SearchApi(this.name, this.urlTemplate, this.needKey, this.assetPath);
}

const List<SearchApi> kSearchApis = [
  SearchApi(
    'OSM',
    'https://nominatim.openstreetmap.org/search?q={query}&format=json&limit=5',
    false,
    "assets/images/openstreetmap.svg",
  ),
  SearchApi(
      '高德',
      'https://restapi.amap.com/v3/place/text?keywords={query}&offset=5&page=1&extensions=all&key={key}',
      true,
      "assets/images/amap.svg"),
  SearchApi(
      "百度",
      'https://api.map.baidu.com/place/v2/search?query={query}&region=全国&output=json&ak={key}',
      true,
      "assets/images/baidu.svg"),
];

class SettingsRepository {
  static const String _boxName = 'settings_box';
  Box get _box => Hive.box(_boxName);

  // kTileSources
  static const String _keyTileSourceIndex = 'tile_source_index';

  String getCurrentTileUrl() {
    int index = _box.get(_keyTileSourceIndex, defaultValue: 0);
    if (index >= kTileSources.length) index = 0;
    return kTileSources[index].urlTemplate;
  }

  Future<void> setTileSource(int index) async {
    await _box.put(_keyTileSourceIndex, index);
  }

  int getCurrentTileSourceIndex() {
    return _box.get(_keyTileSourceIndex, defaultValue: 0);
  }

  // kSearchApi
  static const String _keySearchApiIndex = 'search_api_index';

  int getCurrentSearchApiIndex() {
    return _box.get(_keySearchApiIndex, defaultValue: 0);
  }

  Future<void> setSearchApi(int index) async {
    await _box.put(_keySearchApiIndex, index);
  }

  SearchApi getCurrentSearchApi() {
    int index = _box.get(_keySearchApiIndex, defaultValue: 0);
    if (index >= kSearchApis.length) index = 0;
    return kSearchApis[index];
  }

  void setSearchApiKey(String name, String key) async {
    await _box.put("SearchApi$name", key);
  }

  String getSearchApiKey(String name) {
    return _box.get("SearchApi$name", defaultValue: '');
  }
}

final settingsRepositoryProvider =
    Provider<SettingsRepository>((ref) => SettingsRepository());

final tileUrlProvider = Provider<String>((ref) {
  return ref.read(settingsRepositoryProvider).getCurrentTileUrl();
});
