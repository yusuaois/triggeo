import 'dart:math';

class CoordinateTransform {
  static const double xPi = pi * 3000.0 / 180.0;
  static const double piValue = 3.1415926535897932384626;
  static const double a = 6378245.0;
  static const double ee = 0.00669342162296594323;

  /// WGS84坐标系转换成腾讯地图坐标系(GCJ02)
  ///
  /// @param longitude 经度
  /// @param latitude  纬度
  /// @return double[]
  static List<double> wgs84ToGcj02(double longitude, double latitude) {
    if (_outOfChina(longitude, latitude)) {
      return [longitude, latitude];
    }
    double dLat = _transformLat(longitude - 105.0, latitude - 35.0);
    double dLon = _transformLng(longitude - 105.0, latitude - 35.0);
    double radLat = latitude / 180.0 * pi;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a / sqrtMagic) * pi);
    dLon = (dLon * 180.0) / ((a / (magic * sqrtMagic)) * pi);
    double mgLat = latitude + dLat;
    double mgLon = longitude + dLon;
    return [mgLon, mgLat];
  }

  /// WGS84坐标系转百度坐标系(BD09)
  ///
  /// @param wgs84Lng WGS84 经度
  /// @param wgs84Lat WGS84 纬度
  /// @return 百度坐标数组
  static List<double> wgs84ToBd09(double wgs84Lng, double wgs84Lat) {
    List<double> gcj02 = wgs84ToGcj02(wgs84Lng, wgs84Lat);
    List<double> bd09 = gcj02ToBd09(gcj02[0], gcj02[1]);
    return bd09;
  }

  /// 百度坐标系(BD09)转腾讯地图坐标系(GCJ02)
  ///
  /// @param bd_lon 百度经度
  /// @param bd_lat 百度纬度
  /// @return 火星坐标数组
  static List<double> bd09ToGcj02(double bdLon, double bdLat) {
    double x = bdLon - 0.0065;
    double y = bdLat - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * xPi);
    double theta = atan2(y, x) - 0.000003 * cos(x * xPi);
    double ggLng = z * cos(theta);
    double ggLat = z * sin(theta);
    return [ggLng, ggLat];
  }

  /// 百度坐标(BD09)系转换成WGS84坐标系
  ///
  /// @param bdLng 经度
  /// @param bdLat 纬度
  /// @return double[]
  static List<double> bd09ToWgs84(double bdLng, double bdLat) {
    List<double> gcj02 = bd09ToGcj02(bdLng, bdLat);
    List<double> wgs84 = gcj02ToWgs84(gcj02[0], gcj02[1]);
    return wgs84;
  }

  /// 腾讯地图坐标系(GCJ02)转换成WGS84坐标系
  ///
  /// @param longitude 经度
  /// @param latitude  纬度
  /// @return double[]
  static List<double> gcj02ToWgs84(double longitude, double latitude) {
    if (_outOfChina(longitude, latitude)) {
      return [longitude, latitude];
    }
    double dLat = _transformLat(longitude - 105.0, latitude - 35.0);
    double dLon = _transformLng(longitude - 105.0, latitude - 35.0);
    double radLat = latitude / 180.0 * pi;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a / sqrtMagic) * pi);
    dLon = (dLon * 180.0) / ((a / (magic * sqrtMagic)) * pi);
    double mgLat = latitude + dLat;
    double mgLon = longitude + dLon;
    double wgsLat = latitude + (latitude - mgLat);
    double wgsLon = longitude + (longitude - mgLon);
    return [wgsLon, wgsLat];
  }

  /// 腾讯地图坐标系(GCJ02)转百度坐标系(BD09)
  ///
  /// @param gcj_lng 火星坐标系经度
  /// @param gcj_lat 火星坐标系纬度
  /// @return 百度坐标数组
  static List<double> gcj02ToBd09(double gcjLng, double gcjLat) {
    double x = gcjLng;
    double y = gcjLat;
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * xPi);
    double theta = atan2(y, x) + 0.000003 * cos(x * xPi);
    double bdLng = z * cos(theta) + 0.0065;
    double bdLat = z * sin(theta) + 0.006;
    return [bdLng, bdLat];
  }

  /// 获取坐标的字符串表示
  static String getCoordinateString(List<double> coord) {
    return '经度: ${coord[0].toStringAsFixed(6)}, 纬度: ${coord[1].toStringAsFixed(6)}';
  }

  /// 批量转换坐标
  static List<List<double>> batchConvert(List<double> coordinates,
      List<double> Function(double, double) converter) {
    List<List<double>> results = [];
    for (int i = 0; i < coordinates.length; i += 2) {
      if (i + 1 < coordinates.length) {
        results.add(converter(coordinates[i], coordinates[i + 1]));
      }
    }
    return results;
  }

  /// 坐标是否在中国境内
  static bool isInChina(double longitude, double latitude) {
    return !_outOfChina(longitude, latitude);
  }

  /// 计算两个WGS84坐标点之间的距离（米）
  static double calculateDistanceWgs84(
      double lng1, double lat1, double lng2, double lat2) {
    List<double> point1 = wgs84ToGcj02(lng1, lat1);
    List<double> point2 = wgs84ToGcj02(lng2, lat2);
    return _calculateDistance(point1[0], point1[1], point2[0], point2[1]);
  }

  /// 计算两个BD09坐标点之间的距离（米）
  static double calculateDistanceBd09(
      double lng1, double lat1, double lng2, double lat2) {
    List<double> point1 = bd09ToGcj02(lng1, lat1);
    List<double> point2 = bd09ToGcj02(lng2, lat2);
    return _calculateDistance(point1[0], point1[1], point2[0], point2[1]);
  }

  /// 计算两个GCJ02坐标点之间的距离（米）
  static double calculateDistanceGcj02(
      double lng1, double lat1, double lng2, double lat2) {
    return _calculateDistance(lng1, lat1, lng2, lat2);
  }

  // 两点间距离
  static double _calculateDistance(
      double lng1, double lat1, double lng2, double lat2) {
    const double earthRadius = 6371393.0; // 地球半径（米）

    double dLat = (lat2 - lat1) * pi / 180.0;
    double dLng = (lng2 - lng1) * pi / 180.0;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180.0) *
            cos(lat2 * pi / 180.0) *
            sin(dLng / 2) *
            sin(dLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static double _transformLat(double x, double y) {
    double ret = -100.0 +
        2.0 * x +
        3.0 * y +
        0.2 * y * y +
        0.1 * x * y +
        0.2 * sqrt(x.abs());
    ret += (20.0 * sin(6.0 * x * piValue) + 20.0 * sin(2.0 * x * piValue)) *
        2.0 /
        3.0;
    ret +=
        (20.0 * sin(y * piValue) + 40.0 * sin(y / 3.0 * piValue)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * piValue) + 320 * sin(y * piValue / 30.0)) *
        2.0 /
        3.0;
    return ret;
  }

  static double _transformLng(double x, double y) {
    double ret =
        300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(x.abs());
    ret += (20.0 * sin(6.0 * x * piValue) + 20.0 * sin(2.0 * x * piValue)) *
        2.0 /
        3.0;
    ret +=
        (20.0 * sin(x * piValue) + 40.0 * sin(x / 3.0 * piValue)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * piValue) + 300.0 * sin(x / 30.0 * piValue)) *
        2.0 /
        3.0;
    return ret;
  }

  static bool _outOfChina(double lng, double lat) {
    return (lng < 72.004 || lng > 137.8347) || (lat < 0.8293 || lat > 55.8271);
  }
}

extension CoordinateTransformExtensions on List<double> {
  List<double> get toGcj02 =>
      CoordinateTransform.wgs84ToGcj02(this[0], this[1]);
  List<double> get toBd09 => CoordinateTransform.wgs84ToBd09(this[0], this[1]);
  List<double> get bd09ToGcj02 =>
      CoordinateTransform.bd09ToGcj02(this[0], this[1]);
  List<double> get bd09ToWgs84 =>
      CoordinateTransform.bd09ToWgs84(this[0], this[1]);
  List<double> get gcj02ToWgs84 =>
      CoordinateTransform.gcj02ToWgs84(this[0], this[1]);
  List<double> get gcj02ToBd09 =>
      CoordinateTransform.gcj02ToBd09(this[0], this[1]);
  String get coordinateString => CoordinateTransform.getCoordinateString(this);
  bool get isInChina => CoordinateTransform.isInChina(this[0], this[1]);
}
