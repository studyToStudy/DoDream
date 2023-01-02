//
//  UIDevice.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/02.
//

import Foundation
import UIKit

extension UIDevice {
    var modelName: String {
    
#if targetEnvironment(simulator)
    let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
#else
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif
        return identifier
    }
}
