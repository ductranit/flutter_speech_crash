
import FlutterMacOS
import Foundation
import AVFoundation
import Speech

class TestChannel: NSObject, FlutterStreamHandler, FlutterPlugin {    
    
    static let shared: TestChannel = TestChannel()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger
        
        let channel = FlutterMethodChannel(
            name: "test_channel",
            binaryMessenger: messenger)
        let instance = TestChannel.shared
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

   public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
          // Handle incoming messages from Flutter
            switch call.method {
            case "askPermission":
                authorize(flutterResult: result)
              default:
                result(FlutterMethodNotImplemented)
          }
        }
    
    public func authorize(flutterResult: @escaping FlutterResult) {
        SFSpeechRecognizer.requestAuthorization { status in
               
            }
       }
        
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
}
