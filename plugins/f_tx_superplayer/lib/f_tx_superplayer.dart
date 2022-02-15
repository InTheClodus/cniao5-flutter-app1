
import 'dart:async';

import 'package:flutter/services.dart';

class FTxSuperplayer {
  static const MethodChannel _channel =
      const MethodChannel('f_tx_superplayer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
