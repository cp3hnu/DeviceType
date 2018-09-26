//
//  AppDelegate.swift
//  DeviceType
//
//  Created by ZhaoWei on 14-9-28.
//  Copyright (c) 2014年 ZeroOne. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        testDevice();
        
        print(UIScreen.main.currentMode?.size ?? "nil")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    //Test Function
    func testDevice()
    {
        let device = UIDevice.current
        
        //version
        if device.isGE("8.0") {
            print("version >= 8.0")
        }
        else if device.isGE("7.0") {
            print("version == 7.0")
        }
        else {
            print("version < 7.0")
        }
        
        //iPad or iPhone
        if device.isPad {
            print("iPad")
            
            if device.isPadMini {
                print("iPad mini")
            } else {
                print("other iPad")
            }
        }
        else if (device.isPhone) {
            print("iPhone")
        }
        
        //Device Type
        let type = device.deviceType
        
        switch type {
        case DeviceType.dt_iPhone4:
            print("iPhone4S")
        case DeviceType.dt_iPhone5:
            print("iPhone5")
        case DeviceType.dt_iPhone6:
            print("iPhone6")
        case DeviceType.dt_iPhone6_Plus:
            print("iPhone6_Plus")
        case DeviceType.dt_iPhone_X:
            print("iPhoneX")
        case DeviceType.dt_iPad:
            print("iPad")
        case DeviceType.dt_iPad_Mini:
            print("iPad_Mini")
        case DeviceType.dt_iPad_Retina:
            print("iPad_Retina")
        case DeviceType.dt_iPad_Mini_Retina:
            print("iPad_Mini_Retina")
        default:
            print("Unknown")
        }
    }
}

