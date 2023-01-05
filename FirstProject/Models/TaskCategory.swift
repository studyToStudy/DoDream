//
//  TaskCategory.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/05.
//

import SwiftUI

// MARK: Category Enum with Color

enum Category: String, CaseIterable {
    case 수업 = "수업"
    case 약속 = "약속"
    case 운동 = "운동"
    case modifiers = "Modifiers"
    case challenge = "Challenge"
    case coding = "Coding"
    
    var color: Color {
        switch self {
        case .수업:
            return Color("Gray")
        case .약속:
            return Color("Green")
        case .운동:
            return Color("Pink")
        case .modifiers:
            return Color("Blue")
        case .challenge:
            return Color.purple
        case .coding:
            return  Color.brown
        }
    }
}
