//
//  AppDelegate.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/25.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let notificationHandler = NotificationHandler()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
        self.window?.backgroundColor = UIColor.white
        let rootVC = TabBarViewController();
        self.window?.rootViewController = UINavigationController(rootViewController: rootVC)
        self.window?.rootViewController?.navigationItem.titleView?.isHidden = true
*/
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {
                (accepted, error) in
                if !accepted {
                    print("Failed to apply permession.")
                }
        }
        
        UNUserNotificationCenter.current().delegate = notificationHandler
        
        return true
    }
    
    class NotificationHandler: NSObject, UNUserNotificationCenterDelegate {
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler:
            @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.alert, .sound])
        }
    }

}

