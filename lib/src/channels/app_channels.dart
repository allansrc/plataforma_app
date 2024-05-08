import 'dart:developer';

import 'package:flutter/services.dart';

const channelIndentifier = 'com.empresa.helper';

class MethodChannelHelper {
  static const _channel = MethodChannel(channelIndentifier);

  static Future<String> shareSocial(String message) async {
    var shareMethodID = 'methodShare';

    try {
      final resultChannel = await _channel
          .invokeMethod<String>(shareMethodID, {'message': 'Opa'});

      return resultChannel ?? 'Retornou Nulo';
    } on PlatformException catch (error) {
      log('PLATFORM: Unvaliable to share it: $error');
      rethrow;
    } catch (err) {
      log('ERROR OUT OF CONTEXT PLATFORM: $err');
      rethrow;
    }
  }
}
