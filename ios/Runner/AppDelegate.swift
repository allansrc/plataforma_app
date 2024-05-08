import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let channelName = "com.empresa.helper"
    let shareMethodID = "methodShare"


    // Iniciar sempre um ViewController do Flutter
    let flutterController : FlutterViewController = window.rootViewController as! FlutterViewController
    let channelShare FlutterMethodChannel(name: channelName, binaryMessenger: flutterController.binaryMessenger)

    channelShare.setMethodCallHandler({
     [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

      guard call.method == shareMethodID else {
        result(FlutterMethodNotImplemented)
        return
      }

      return result(String("Sucesso: a mensagem é $message Saindo do Nativo iOS"))

    })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
