//
//  FirstProjectApp.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/24.
//

import SwiftUI
//import EventKit

@main
struct FirstProjectApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
//            NotiView()
                ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
