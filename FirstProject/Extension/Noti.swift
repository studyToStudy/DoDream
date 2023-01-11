//
//  Noti.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/11.
//

import Foundation

extension Example1 {
    private func goToSettings(){
        // must execute in main thread
        DispatchQueue.main.async {

            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:],
            completionHandler: nil)
        }
    }
}
