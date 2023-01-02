//
//  SupportEmail.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/02.
//

import Foundation
import UIKit
import SwiftUI

struct SupportEmail {
    let toAddress: String
    let subject: String
    let messageHeader: String
    var body: String {
        """
        -------------------
        이곳에 내용을 작성해주세요. 오타 발견 문의는 아래 양식에 맞춰 작성해주세요.
        <예시>
        에러: 앱 로딩시 튕김현상이 일어나요 ㅠ
        
        건의: 캘린더 기능도 추가해주세요~!
        -------------------
        iOS: \(UIDevice.current.systemVersion)
        Device Model : \(UIDevice.current.modelName)
        """
    }
    func send(openURL: OpenURLAction) {
        let urlString = "mailto: \(toAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        guard let url = URL(string: urlString) else { return }
        openURL(url) { accepted in
            if !accepted {
                print("""
                    이메일 설정을 확인해 주세요
                    """
                )
            }
        }
    }
}
