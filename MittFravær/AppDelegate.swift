//
//  AppDelegate.swift
//  MittFravær
//
//  Created by Ole Svennevig on 29/11/2018.
//  Copyright © 2018 kvitér. All rights reserved.
//

import OneSignal

import UIKit
import UserNotifications
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    func registerForPushNotifications() {
        UNUserNotificationCenter.current() // 1
            .requestAuthorization(options: [.alert, .sound, .badge]) { //2
               [weak self] granted, error in
                
                print("permission grandet: \(granted)") //3
                
                guard granted else { return }
                self?.getNotificationSettings()
                
        }
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
        ) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    var window: UIWindow?


   /* func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//Onboarding screen og lagring av name
     
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        
        if (UserDefaults.standard.value(forKey: "name") as? String) == nil {
            // Show the onboarding scrren
            vc = storyboard.instantiateViewController(withIdentifier:
                "OnboardingVC")
        } else {
            // show the main screen
            vc = storyboard.instantiateInitialViewController()!
        }
        
        self.window? .rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        return true
    }
 */
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    if !UserDefaults.standard.bool(forKey: "didSee") {
    UserDefaults.standard.set(true, forKey: "didSee")
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "OnboardingVC")
    self.window?.rootViewController = viewController
    self.window?.makeKeyAndVisible()
    }
    
    registerForPushNotifications()
    
    
    let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
    
    // Replace 'YOUR_APP_ID' with your OneSignal App ID.
    OneSignal.initWithLaunchOptions(launchOptions,
                                    appId: "b8487250-6b13-4e9e-9f3c-059e4e168f14",
                                    handleNotificationAction: nil,
                                    settings: onesignalInitSettings)
    
    OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
    
    // Recommend moving the below line to prompt for push after informing the user about
    //   how your app will use them.
    OneSignal.promptForPushNotifications(userResponse: { accepted in
        print("User accepted notifications: \(accepted)")
    })
    
    OneSignal.promptLocation()
    
    
    return true
    
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
 
}

