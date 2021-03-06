import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f_tx_superplayer/f_tx_superplayer.dart';

void main() {
  const MethodChannel channel = MethodChannel('f_tx_superplayer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FTxSuperplayer.platformVersion, '42');
  });
}
