package com.example.plataforma_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "com.empresa.helper"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      val shareMethodID = "methodShare";
      if (call.method == shareMethodID) {
        val message = call.argument<Map<String, String>>("message") as String
        println("Sucesso: a mensagem é $message")
        result.success("Sucesso: a mensagem é $message Saindo do Nativo Android")
      } else {
        result.notImplemented()
      }
    }
  }

}
