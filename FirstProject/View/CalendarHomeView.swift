//
//  CalendarHomeView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/05.
//

import SwiftUI

struct CalendarHomeView: View {
    var body: some View {
        CalendarView()
            .preferredColorScheme(.light)
    }
}

struct CalendarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView()
    }
}
