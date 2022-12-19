
#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#endif
import Foundation
import AVFoundation
import Speech

class TestChannel: NSObject, FlutterStreamHandler, FlutterPlugin {    
    
    static let shared: TestChannel = TestChannel()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
#if os(iOS)
        let messenger = registrar.messenger()
#elseif os(macOS)
        let messenger = registrar.messenger
#endif
        
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
           #if os(iOS)
           AVAudioSession.sharedInstance().requestRecordPermission { granted in
             //OperationQueue.main.addOperation {
               flutterResult(granted)
             //}
           }
           #elseif os(macOS)
        SFSpeechRecognizer.requestAuthorization { status in
               
            }
           #endif
       }
        
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
}
