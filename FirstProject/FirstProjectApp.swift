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
    
    var body: some Scene {
        WindowGroup {
//            NavigationStack {
                ContentView()
//            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            .onAppear {
                print(UIDevice.current.systemVersion)
                print(UIDevice.current.modelName)
            }
        }
    }
}
