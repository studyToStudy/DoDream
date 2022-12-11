//
//  FaceIDModel.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/04.
//

import Foundation

import LocalAuthentication

class ViewModel: ObservableObject {
    
    @Published
    var loggedIn: Bool = false
    
    func auth() {
        let context = LAContext()
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "인증이 필요합니다") {
            [weak self] (res, err) in
            DispatchQueue.main.async {
                self?.loggedIn = res
            }
        }
    }
}
