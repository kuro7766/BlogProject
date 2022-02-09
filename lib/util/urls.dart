class UrlTool {
  String map2query(Map<String, String> map) {
    if (map == null) return '';
    if (map.isEmpty) return '';

    StringBuffer sb = new StringBuffer();
    map.forEach((k, v) {
      sb.write("$k=$v&");
    });
    return sb.toString().substring(0, sb.length - 1);
  }
}
