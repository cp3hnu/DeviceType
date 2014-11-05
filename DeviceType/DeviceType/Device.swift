//
//  Device.swift
//  DeviceType
//
//  Created by ZhaoWei on 14-9-28.
//  Copyright (c) 2014年 csdept. All rights reserved.
//

import Foundation
import UIKit

class Device : NSObject {
    
    enum DeviceType: Int
    {
        case DT_UNKNOWN = 0
        case DT_iPhone4S          //iPhone4S、iPhone4
        case DT_iPhone5           //iPhone5、iPhone5C和iPhone5S
        case DT_iPhone6           //iPhone6
        case DT_iPhone6_Plus      //iPhone6 Plus
        case DT_iPad              //iPad1、iPad2
        case DT_iPad_Mini         //iPad mini1
        case DT_iPad_Retina       //New iPad、iPad4和iPad Air
        case DT_iPad_Mini_Retina  //iPad mini2
    }
    
    struct Singleton {
        static let _sharedInstance = Device()
    }
    
    /**
    获取当前设备(单例)
    */
    class var currentDevice : Device {
        return Singleton._sharedInstance
    }
    
    /**
    根据屏幕分辨率判断设备类型
    */
    var deviceType: DeviceType {
        
        if let size = UIScreen.mainScreen().currentMode?.size {
            switch size {
            case CGSizeMake(640 , 960 ) : return .DT_iPhone4S
            case CGSizeMake(640 , 1136) : return .DT_iPhone5
            case CGSizeMake(750 , 1334) : return .DT_iPhone6
            case CGSizeMake(1242, 2208) : return .DT_iPhone6_Plus
            case CGSizeMake(1024, 768 ) : return .DT_iPad
            case CGSizeMake(768 , 1024) : return .DT_iPad_Mini
            case CGSizeMake(2048, 1536) : return .DT_iPad_Retina
            case CGSizeMake(1536, 2048) : return .DT_iPad_Mini_Retina
            default : return .DT_UNKNOWN
            }
        }
        else {
            return .DT_UNKNOWN
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
        if isPad() {
            var type = deviceType
            if type == .DT_iPad_Mini || type == .DT_iPad_Mini_Retina {
                return true
            }
        }
        
        return false
    }
    
    /**
    判断当前设备是不是iPad设备，不包括iPad mini
    */
    func isBigPad() -> Bool {
        if isPad() && isPadMini() == false {
            return true
        }
        
        return false
    }
    
    /**
    判断当前设备的系统版本是否大于或者等于#version
    */
    func isGE(var #version: String) -> Bool {
        return compare(version: version) != .OrderedAscending
    }
    
    func compare(var #version: String) -> NSComparisonResult {
        return UIDevice.currentDevice().systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch)
    }
}

//测试函数
func testDevice()
{
    if Device.currentDevice.isGE(version: "8.0") {
        println("version >= 8.0")
    }
    else if Device.currentDevice.isGE(version: "7.0") {
        println("version == 7.0")
    }
    else {
        println("version < 7.0")
    }
    
    if Device.currentDevice.isPad() {
        println("iPad")
        
        if Device.currentDevice.isBigPad() {
            println("Big iPad")
        }
        else if Device.currentDevice.isPadMini() {
            println("iPad mini")
        }
    }
    else if (Device.currentDevice.isPhone()) {
        println("iPhone")
    }
    
    var type = Device.currentDevice.deviceType
    
    switch type {
    case Device.DeviceType.DT_iPhone4S:         println("iPhone4S")
    case Device.DeviceType.DT_iPhone5:          println("iPhone5")
    case Device.DeviceType.DT_iPhone6:          println("iPhone6")
    case Device.DeviceType.DT_iPhone6_Plus:     println("iPhone6_Plus")
    case Device.DeviceType.DT_iPad:             println("iPad")
    case Device.DeviceType.DT_iPad_Mini:        println("iPad_Mini")
    case Device.DeviceType.DT_iPad_Retina:      println("iPad_Retina")
    case Device.DeviceType.DT_iPad_Mini_Retina: println("iPad_Mini_Retina")
    default:                                    println("Unknown")
    }
}

