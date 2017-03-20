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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        testDevice();
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    //Test Function
    func testDevice()
    {
        let device = UIDevice.currentDevice()
        
        //version
        if device.isGE(version: "8.0") {
            print("version >= 8.0")
        }
        else if device.isGE(version: "7.0") {
            print("version == 7.0")
        }
        else {
            print("version < 7.0")
        }
        
        //iPad or iPhone
        if device.isPad() {
            print("iPad")
            
            if device.isPadMini() {
                print("iPad mini")
            }
            else if device.isBigPad() {
                print("9.7-inch iPad")
            }
        }
        else if (device.isPhone()) {
            print("iPhone")
        }
        
        //Device Type
        let type = device.deviceType
        
        switch type {
        case DeviceType.DT_iPhone4:
            print("iPhone4S")
        case DeviceType.DT_iPhone5:
            print("iPhone5")
        case DeviceType.DT_iPhone6:
            print("iPhone6")
        case DeviceType.DT_iPhone6_Plus:
            print("iPhone6_Plus")
        case DeviceType.DT_iPad:
            print("iPad")
        case DeviceType.DT_iPad_Mini:
            print("iPad_Mini")
        case DeviceType.DT_iPad_Retina:
            print("iPad_Retina")
        case DeviceType.DT_iPad_Mini_Retina:
            print("iPad_Mini_Retina")
        default:
            print("Unknown")
        }
    }
}

