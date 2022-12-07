//
//  FirstProjectApp.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/24.
//

import SwiftUI

@main
struct FirstProjectApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
        }
    }
}
