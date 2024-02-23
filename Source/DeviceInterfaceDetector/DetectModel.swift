//
//  DetMod.swift
//
//  Detect the device to create the user interface
//  Mainly oriented ios, ipad and mac silicon, the code for other devices (watch, tv, vision…) has to be written
//
//  Created by Stéphane Bressani on 21.02.2024.
//  Inspired from : https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model
//

import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit)
import AppKit
#endif


public class DetectModel {
    /// Constructor
    public init() {
        
    }
    
    /// Get the type of lib
    public func lib() -> UILib {
#if canImport(UIKit)
        return .uiKit
#else
#if canImport(AppKit)
        return .appKit
#else
        return .unrecognized
#endif
#endif
    }
    
    /// Get the type of hardware
    public func hardware() -> Hardware {
#if targetEnvironment(simulator)
        return .simulator
#else
        return .hardware
#endif
    }
    
    /// Get the device model
    /// Actually, only iPhone, iPad and Mac Silicon are implemented
    public func deviceModel() -> Model {
#if canImport(UIKit)
    #if targetEnvironment(simulator)
        switch ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]! {
            //iPad
                case "iPad2,1"   : return .iPad2
                case "iPad2,2"   : return .iPad2
                case "iPad2,3"   : return .iPad2
                case "iPad2,4"   : return .iPad2
                case "iPad3,1"   : return .iPad3
                case "iPad3,2"   : return .iPad3
                case "iPad3,3"   : return .iPad3
                case "iPad3,4"   : return .iPad4
                case "iPad3,5"   : return .iPad4
                case "iPad3,6"   : return .iPad4
                case "iPad6,11"  : return .iPad5 //iPad 2017
                case "iPad6,12"  : return .iPad5
                case "iPad7,5"   : return .iPad6 //iPad 2018
                case "iPad7,6"   : return .iPad6
                case "iPad7,11"  : return .iPad7 //iPad 2019
                case "iPad7,12"  : return .iPad7
                case "iPad11,6"  : return .iPad8 //iPad 2020
                case "iPad11,7"  : return .iPad8
                case "iPad12,1"  : return .iPad9 //iPad 2021
                case "iPad12,2"  : return .iPad9
                case "iPad13,18" : return .iPad10
                case "iPad13,19" : return .iPad10
                    
            //iPad Mini
                case "iPad2,5"   : return .iPadMini
                case "iPad2,6"   : return .iPadMini
                case "iPad2,7"   : return .iPadMini
                case "iPad4,4"   : return .iPadMini2
                case "iPad4,5"   : return .iPadMini2
                case "iPad4,6"   : return .iPadMini2
                case "iPad4,7"   : return .iPadMini3
                case "iPad4,8"   : return .iPadMini3
                case "iPad4,9"   : return .iPadMini3
                case "iPad5,1"   : return .iPadMini4
                case "iPad5,2"   : return .iPadMini4
                case "iPad11,1"  : return .iPadMini5
                case "iPad11,2"  : return .iPadMini5
                case "iPad14,1"  : return .iPadMini6
                case "iPad14,2"  : return .iPadMini6
                    
            //iPad Pro
                case "iPad6,3"   : return .iPadPro9_7
                case "iPad6,4"   : return .iPadPro9_7
                case "iPad7,3"   : return .iPadPro10_5
                case "iPad7,4"   : return .iPadPro10_5
                case "iPad6,7"   : return .iPadPro12_9
                case "iPad6,8"   : return .iPadPro12_9
                case "iPad7,1"   : return .iPadPro2_12_9
                case "iPad7,2"   : return .iPadPro2_12_9
                case "iPad8,1"   : return .iPadPro11
                case "iPad8,2"   : return .iPadPro11
                case "iPad8,3"   : return .iPadPro11
                case "iPad8,4"   : return .iPadPro11
                case "iPad8,9"   : return .iPadPro2_11
                case "iPad8,10"  : return .iPadPro2_11
                case "iPad13,4"  : return .iPadPro3_11
                case "iPad13,5"  : return .iPadPro3_11
                case "iPad13,6"  : return .iPadPro3_11
                case "iPad13,7"  : return .iPadPro3_11
                case "iPad8,5"   : return .iPadPro3_12_9
                case "iPad8,6"   : return .iPadPro3_12_9
                case "iPad8,7"   : return .iPadPro3_12_9
                case "iPad8,8"   : return .iPadPro3_12_9
                case "iPad8,11"  : return .iPadPro4_12_9
                case "iPad8,12"  : return .iPadPro4_12_9
                case "iPad13,8"  : return .iPadPro5_12_9
                case "iPad13,9"  : return .iPadPro5_12_9
                case "iPad13,10" : return .iPadPro5_12_9
                case "iPad13,11" : return .iPadPro5_12_9
                    
            //iPad Air
                case "iPad4,1"   : return .iPadAir
                case "iPad4,2"   : return .iPadAir
                case "iPad4,3"   : return .iPadAir
                case "iPad5,3"   : return .iPadAir2
                case "iPad5,4"   : return .iPadAir2
                case "iPad11,3"  : return .iPadAir3
                case "iPad11,4"  : return .iPadAir3
                case "iPad13,1"  : return .iPadAir4
                case "iPad13,2"  : return .iPadAir4
                case "iPad13,16" : return .iPadAir5
                case "iPad13,17" : return .iPadAir5
                    
            //iPhone
                case "iPhone3,1" : return .iPhone4
                case "iPhone3,2" : return .iPhone4
                case "iPhone3,3" : return .iPhone4
                case "iPhone4,1" : return .iPhone4S
                case "iPhone5,1" : return .iPhone5
                case "iPhone5,2" : return .iPhone5
                case "iPhone5,3" : return .iPhone5C
                case "iPhone5,4" : return .iPhone5C
                case "iPhone6,1" : return .iPhone5S
                case "iPhone6,2" : return .iPhone5S
                case "iPhone7,1" : return .iPhone6Plus
                case "iPhone7,2" : return .iPhone6
                case "iPhone8,1" : return .iPhone6S
                case "iPhone8,2" : return .iPhone6SPlus
                case "iPhone8,4" : return .iPhoneSE
                case "iPhone9,1" : return .iPhone7
                case "iPhone9,3" : return .iPhone7
                case "iPhone9,2" : return .iPhone7Plus
                case "iPhone9,4" : return .iPhone7Plus
                case "iPhone10,1" : return .iPhone8
                case "iPhone10,4" : return .iPhone8
                case "iPhone10,2" : return .iPhone8Plus
                case "iPhone10,5" : return .iPhone8Plus
                case "iPhone10,3" : return .iPhoneX
                case "iPhone10,6" : return .iPhoneX
                case "iPhone11,2" : return .iPhoneXS
                case "iPhone11,4" : return .iPhoneXSMax
                case "iPhone11,6" : return .iPhoneXSMax
                case "iPhone11,8" : return .iPhoneXR
                case "iPhone12,1" : return .iPhone11
                case "iPhone12,3" : return .iPhone11Pro
                case "iPhone12,5" : return .iPhone11ProMax
                case "iPhone12,8" : return .iPhoneSE2
                case "iPhone13,1" : return .iPhone12Mini
                case "iPhone13,2" : return .iPhone12
                case "iPhone13,3" : return .iPhone12Pro
                case "iPhone13,4" : return .iPhone12ProMax
                case "iPhone14,4" : return .iPhone13Mini
                case "iPhone14,5" : return .iPhone13
                case "iPhone14,2" : return .iPhone13Pro
                case "iPhone14,3" : return .iPhone13ProMax
                case "iPhone14,6" : return .iPhoneSE3
                case "iPhone14,7" : return .iPhone14
                case "iPhone14,8" : return .iPhone14Plus
                case "iPhone15,2" : return .iPhone14Pro
                case "iPhone15,3" : return .iPhone14ProMax
                case "iPhone15,4" : return .iPhone15
                case "iPhone15,5" : return .iPhone15Plus
                case "iPhone16,1" : return .iPhone15Pro
                case "iPhone16,2" : return .iPhone15ProMax
                default           : return .unrecognized
        }
    #else
            return UIDevice.current.type
    #endif
#else
#if canImport(AppKit)
        return .silicon
#else
        return .unrecognized
#endif
#endif
    }
}
