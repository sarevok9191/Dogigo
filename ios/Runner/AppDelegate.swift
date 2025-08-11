import UIKit
import Firebase
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyArcYpMiq6yuCoXsUTsmkUM8drdr95iWws")
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
                UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
