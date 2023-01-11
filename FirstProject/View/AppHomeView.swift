//
//  AppHomeView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/11.
//

import SwiftUI
import Combine

// MARK:- App Home View
struct AppHomeView: View {
    @EnvironmentObject var appLockViewModel: AppLockViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $appLockViewModel.isAppLockEnabled, label: {
                    Text("App Lock")
                })
                .onChange(of: appLockViewModel.isAppLockEnabled, perform: { value in
                    appLockViewModel.appLockStateChange(appLockState: value)
                })
            }
            .navigationTitle("App Home")
        }
    }
}

// MARK:- App Lock View
struct AppLockView: View {
    @EnvironmentObject var appLockViewModel: AppLockViewModel
   
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "lock.circle")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.red)
            
            Text("App Locked")
                .font(.title)
                .foregroundColor(.red)
            
            Button("Open") {
                appLockViewModel.appLockValidation()
            }
            .foregroundColor(.primary)
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.red)
                
            )
            Spacer(minLength: 0)
        }.padding(.top, 50)
    }
}
