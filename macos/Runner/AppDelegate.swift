import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
    
    
    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller : FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
        TestChannel.register(with: controller.registrar(forPlugin: "testChannel"))
      }
}
