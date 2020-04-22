//
//  Device.swift
//  DeviceType
//
//  Created by ZhaoWei on 14-9-28.
//  Copyright (c) 2014年 csdept. All rights reserved.
//

import Foundation
import UIKit

public enum DeviceType: Int, CustomStringConvertible
{
    case dt_unknown = 0
    case dt_iPhone4             // iPhone4/4S
    case dt_iPhone5             // iPhone5/5C/5S/SE
    case dt_iPhone6             // iPhone6/6S/7/8/SE2
    case dt_iPhone6_Plus        // iPhone6/6S/7/8 Plus
    case dt_iPhone_X            // iPhoneX/XS/11 Pro
    case dt_iPhone_XR           // iPhoneXR/11
    case dt_iPhone_XS_Max       // iPhoneXS/11 Pro Max
    // iPad
    case dt_iPad                // iPad 1~2代或iPad mini 1代
    case dt_iPad_Retina         // iPad 3~6代或iPad Air 1~2代或iPad mini2~5代
    case dt_iPad_Pro_12_9_Inch  // iPad Pro 12.9 1~4代
    case dt_iPad_Pro_11_Inch    // iPad Pro 11 1~2代
    case dt_iPad_Pro_10_5_Inch  // iPad Pro 10.5或iPad Air 3代
    case dt_iPad_10_2_Inch      // iPad 7代
    
    public var description: String {
        switch self {
        case .dt_unknown:
            return "未知型号"
        case .dt_iPhone4:
            return "iPhone4/4S"
        case .dt_iPhone5:
            return "iPhone5/5C/5S/SE"
        case .dt_iPhone6:
            return "iPhone6/6S/7/8/SE2"
        case .dt_iPhone6_Plus:
            return "iPhone6/6S/7/8 Plus"
        case .dt_iPhone_X:
            return "iPhoneX/XS/11 Pro"
        case .dt_iPhone_XR:
            return "iPhoneXR/11"
        case .dt_iPhone_XS_Max:
            return "iPhoneXS/11 Pro Max"
        case .dt_iPad:
            return "iPad 1~2代或iPad mini 1代"
        case .dt_iPad_Retina:
            return "iPad 3~6代或iPad Air 1~2代或iPad mini2~5代"
        case .dt_iPad_Pro_12_9_Inch:
            return "iPad Pro 12.9 1~4代"
        case .dt_iPad_Pro_11_Inch:
            return "iPad Pro 11 1~2代"
        case .dt_iPad_Pro_10_5_Inch:
            return "iPad Pro 10.5或iPad Air 3代"
        case .dt_iPad_10_2_Inch:
            return "iPad 7代"
        }
    }
}

extension UIDevice {
    
    /// 根据屏幕分辨率判断设备类型
    public var deviceType: DeviceType {
        guard let size = UIScreen.main.currentMode?.size else {
            return .dt_unknown
        }
        
        switch size {
        // iPhone
        case CGSize(width: 640 , height: 960 ): return .dt_iPhone4
        case CGSize(width: 640 , height: 1136): return .dt_iPhone5
        case CGSize(width: 750 , height: 1334): return .dt_iPhone6
        case CGSize(width: 1242, height: 2208): return .dt_iPhone6_Plus
        case CGSize(width: 1125, height: 2436): return .dt_iPhone_X
        case CGSize(width: 828 , height: 1792): return .dt_iPhone_XR
        case CGSize(width: 750 , height: 1624): return .dt_iPhone_XR
        case CGSize(width: 1242, height: 2688): return .dt_iPhone_XS_Max
        // iPad
        case CGSize(width: 768 , height: 1024): return .dt_iPad
        case CGSize(width: 1536, height: 2048): return .dt_iPad_Retina
        case CGSize(width: 2048, height: 2732): return .dt_iPad_Pro_12_9_Inch
        case CGSize(width: 1668, height: 2388): return .dt_iPad_Pro_11_Inch
        case CGSize(width: 1668, height: 2224): return .dt_iPad_Pro_10_5_Inch
        case CGSize(width: 1620, height: 2160): return .dt_iPad_10_2_Inch
        default: return .dt_unknown
        }
    }
    
    /// 判断当前设备是不是iPhone设备
    public var isPhone: Bool {
        return userInterfaceIdiom == .phone
    }
    
    /// 判断当前设备是不是iPad设备
    public var isPad: Bool {
        return userInterfaceIdiom == .pad
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
        return isNotchScreen ? 44 : 20
    }
    
    /// 下巴的高度
    public var jawHeight: CGFloat {
        return isNotchScreen ? 34 : 0
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




