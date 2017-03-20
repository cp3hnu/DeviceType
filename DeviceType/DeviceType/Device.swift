//
//  Device.swift
//  DeviceType
//
//  Created by ZhaoWei on 14-9-28.
//  Copyright (c) 2014年 csdept. All rights reserved.
//

import Foundation
import UIKit

enum DeviceType: Int
{
    case DT_UNKNOWN = 0
    case DT_iPhone4           //iPhone4、iPhone4S
    case DT_iPhone5           //iPhone5、iPhone5C和iPhone5S
    case DT_iPhone6           //iPhone6、iPhone6S、iPhone7
    case DT_iPhone6_Plus      //iPhone6 Plus、iPhone6S Plus、iPhone7 Plus
    case DT_iPad              //iPad1、iPad2
    case DT_iPad_Mini         //iPad mini1
    case DT_iPad_Retina       //New iPad、iPad4和iPad Air
    case DT_iPad_Mini_Retina  //iPad mini2
}

extension UIDevice {
    /**
     根据屏幕分辨率判断设备类型
     */
    var deviceType: DeviceType {
        guard let size = UIScreen.mainScreen().currentMode?.size else {
            return .DT_UNKNOWN
        }
        
        switch size {
        case CGSizeMake(640 , 960 ): return .DT_iPhone4
        case CGSizeMake(640 , 1136): return .DT_iPhone5
        case CGSizeMake(750 , 1334): return .DT_iPhone6
        case CGSizeMake(1242, 2208): return .DT_iPhone6_Plus
        case CGSizeMake(1024, 768 ): return .DT_iPad
        case CGSizeMake(768 , 1024): return .DT_iPad_Mini
        case CGSizeMake(2048, 1536): return .DT_iPad_Retina
        case CGSizeMake(1536, 2048): return .DT_iPad_Mini_Retina
        default: return .DT_UNKNOWN
        }
    }
    
    /**
     判断当前设备是不是iPhone设备
     */
    func isPhone() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Phone
    }
    
    /**
     判断当前设备是不是iPad设备
     */
    func isPad() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
    
    /**
     判断当前设备是不是iPad mini
     */
    func isPadMini() -> Bool {
        return deviceType == .DT_iPad_Mini || deviceType == .DT_iPad_Mini_Retina
    }
    
    /**
     判断当前设备是不是iPad设备，不包括iPad mini
     */
    func isBigPad() -> Bool {
        return deviceType == .DT_iPad || deviceType == .DT_iPad_Retina
    }
    
    /**
     判断当前设备是不是iPhone4S
     */
    func isIPhone4S() -> Bool {
        return deviceType == .DT_iPhone4
    }
    
    /**
     判断当前设备是不是iPhone5
     */
    func isIPhone5() -> Bool {
        return deviceType == .DT_iPhone5
    }
    
    /**
     判断当前设备是不是iPhone6
     */
    func isIPhone6() -> Bool {
        return deviceType == .DT_iPhone6
    }
    
    /**
     判断当前设备是不是iPhone6 Plus
     */
    func isIPhone6Plus() -> Bool {
        return deviceType == .DT_iPhone6_Plus
    }
}

extension UIDevice {
    /**
     判断当前设备的系统版本是否大于或者等于#version
     */
    func isGE(version version: String) -> Bool {
        return compare(version: version) != .OrderedAscending
    }
    
    private func compare(version version: String) -> NSComparisonResult {
        return UIDevice.currentDevice().systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch)
    }
}

extension UIDevice {
    var appVersion: String {
        return NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    var appName: String {
        return NSBundle.mainBundle().infoDictionary?["CFBundleDisplayName"] as! String
    }
}

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

