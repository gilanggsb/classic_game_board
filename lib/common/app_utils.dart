import 'dart:developer';
class AppUtils {
  static debugPrint(String text, {bool error = false}) {
    if (error) {
      log('', name: 'GLOG_ERROR', error: text);
      return;
    }
    log(text, name: 'GLOG');
  }
}
