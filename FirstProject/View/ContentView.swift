//
//  ContentView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/24.
//


//import LocalAuthentication
import SwiftUI

struct ContentView: View {
//    @State private var isUnlocked = false
    var body: some View {
        VStack{
            NavigationView {
                TabBox()
            }
            .navigationTitle("Todo List⏰")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ListViewModel())
    }
}
