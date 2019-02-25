//
//  Device.swift
//  DeviceType
//
//  Created by ZhaoWei on 14-9-28.
//  Copyright (c) 2014年 csdept. All rights reserved.
//

import Foundation
import UIKit

public enum DeviceType: Int
{
    case dt_unknown = 0
    case dt_iPhone4             //iPhone4、iPhone4S
    case dt_iPhone5             //iPhone5、iPhone5C和iPhone5S
    case dt_iPhone6             //iPhone6、iPhone6S、iPhone7
    case dt_iPhone6_Plus        //iPhone6 Plus、iPhone6S Plus、iPhone7 Plus
    case dt_iPhone_X            //iPhoneX、iPhoneXS
    case dt_iPhone_XR           //iPhoneXR
    case dt_iPhone_XS_Max       //iPhoneXS Max
    case dt_iPad                //iPad1、iPad2
    case dt_iPad_Mini           //iPad mini1
    case dt_iPad_Retina         //New iPad、iPad4和iPad Air
    case dt_iPad_Mini_Retina    //iPad mini2
    case dt_iPad_Pro_12_9_Inch  //iPad Pro 12.9
    case dt_iPad_Pro_10_5_Inch  //iPad Pro 10.5
}

extension UIDevice {
    
    /// 根据屏幕分辨率判断设备类型
    public var deviceType: DeviceType {
        guard let size = UIScreen.main.currentMode?.size else {
            return .dt_unknown
        }
        
        switch size {
        case CGSize(width: 640 , height: 960 ): return .dt_iPhone4
        case CGSize(width: 640 , height: 1136): return .dt_iPhone5
        case CGSize(width: 750 , height: 1334): return .dt_iPhone6
        case CGSize(width: 1242, height: 2208): return .dt_iPhone6_Plus
        case CGSize(width: 1125, height: 2436): return .dt_iPhone_X
        case CGSize(width: 828 , height: 1792): return .dt_iPhone_XR
        case CGSize(width: 750 , height: 1624): return .dt_iPhone_XR
        case CGSize(width: 1242, height: 2688): return .dt_iPhone_XS_Max
        case CGSize(width: 1024, height: 768 ): return .dt_iPad
        case CGSize(width: 768 , height: 1024): return .dt_iPad_Mini
        case CGSize(width: 2048, height: 1536): return .dt_iPad_Retina
        case CGSize(width: 1536, height: 2048): return .dt_iPad_Mini_Retina
        case CGSize(width: 2732, height: 2048): return .dt_iPad_Pro_12_9_Inch
        case CGSize(width: 2224, height: 1668): return .dt_iPad_Pro_10_5_Inch
        default: return .dt_unknown
        }
    }
    
    /// 判断当前设备是不是iPhone设备
    public var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /// 判断当前设备是不是iPad设备
    public var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    /// 判断当前设备是不是iPad mini
    public var isPadMini: Bool {
        return deviceType == .dt_iPad_Mini || deviceType == .dt_iPad_Mini_Retina
    }
    
    /// 判断当前设备是不是iPhone4
    public var isIPhone4: Bool {
        return deviceType == .dt_iPhone4
    }
    
    /// 判断当前设备是不是iPhone5
    public var isIPhone5: Bool {
        return deviceType == .dt_iPhone5
    }
    
    ///  判断当前设备是不是iPhone6
    public var isIPhone6: Bool {
        return deviceType == .dt_iPhone6
    }
    
    /// 判断当前设备是不是iPhone6 Plus
    public var isIPhone6Plus: Bool {
        return deviceType == .dt_iPhone6_Plus
    }
    
    /// 判断当前设备是不是iPhoneX
    public var isIPhoneX: Bool {
        return deviceType == .dt_iPhone_X
    }
    
    /// 判断当前设备是不是iPhoneXR
    public var isIPhoneXR: Bool {
        return deviceType == .dt_iPhone_XR
    }
    
    /// 判断当前设备是不是iPhoneXS Max
    public var isIPhoneXSMax: Bool {
        return deviceType == .dt_iPhone_XS_Max
    }
    
    /// 判断当前设备是不是刘海屏
    public var isNotchScreen: Bool {
        return isIPhoneX || isIPhoneXR || isIPhoneXSMax
    }
    
    /// 判断当前设备是不是横屏
    public var isLandscape: Bool {
        return orientation.isLandscape
    }
    
    /// 状态栏的高度
    public var statusBarHeight: CGFloat {
        return isIPhoneX ? 44 : 20
    }
    
    /// 下巴的高度
    public var jawHeight: CGFloat {
        return isIPhoneX ? 34 : 0
    }
}

extension UIDevice {
    /// 判断当前设备的系统版本是否大于或者等于version
    public func isGE(_ version: String) -> Bool {
        return compare(version: version) != .orderedAscending
    }
    
    fileprivate func compare(version: String) -> ComparisonResult {
        return UIDevice.current.systemVersion.compare(version, options: NSString.CompareOptions.numeric)
    }
}

extension Bundle {
    public static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    public static var appName: String {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as! String
    }
    
    public static var bundleID: String {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as! String
    }
}




