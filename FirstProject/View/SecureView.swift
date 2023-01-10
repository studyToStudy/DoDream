//
//  SecureView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/10.
//

import SwiftUI
import LocalAuthentication

struct SecureView: View {
    @State private var someToggle = false
    @State private var isUnlocked = false
    
    var body: some View {
        var context = LAContext()
        VStack {
            Toggle("FaceID", isOn: $someToggle)
            if isUnlocked {
                
            } else {
                
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
            let context = LAContext()
            var error: NSError?

            // check whether biometric authentication is possible
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // it's possible, so go ahead and use it
                let reason = "We need to unlock your data."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    // authentication has now completed
                    if success {
                        isUnlocked = true
                    } else {
                        // there was a problem
                    }
                }
            } else {
                // no biometrics
            }
        }
}

struct SecureView_Previews: PreviewProvider {
    static var previews: some View {
        SecureView()
    }
}
