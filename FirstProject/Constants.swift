//
//  Constants.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/01.
//

import Foundation
import SwiftUI

struct Constants {
    struct haptic {
        static let rigid = UIImpactFeedbackGenerator(style: .rigid)
        static let heavy = UIImpactFeedbackGenerator(style: .heavy)
        static let medium = UIImpactFeedbackGenerator(style: .medium)
        static let light = UIImpactFeedbackGenerator(style: .light)
    }
}
