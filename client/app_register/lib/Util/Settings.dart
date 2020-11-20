class AppSettings {
  static String buildUrl(String url, List<String> parameters) {
    for (var position = 0; position < parameters.length; position++) {
      if (position != (parameters.length - 1)) {
        url += parameters.elementAt(position) + "/";
      } else {
        url += parameters.elementAt(position);
      }
    }
    return url;
  }
}

class AppConfig {
  static int timeOutDuration = 50;
}
