//
//  FaceIDData.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/04.
//

import Foundation
import LocalAuthentication
import SwiftUI

struct Face

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
                // authenticated successfully
            } else {
                // there was a problem
            }
        }
    } else {
        // no biometrics
    }
}
