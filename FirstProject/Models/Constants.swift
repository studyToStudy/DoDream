//
//  Constants.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/02.
//

import Foundation

struct Constants{
    
    var email = ""
    
    let noSupportText = "아이폰 이메일 설정을 다시 확인해주세요"
    let contentPreText =    """
                            이곳에 내용을 작성해주세요.
                                                     
                            오타 발견 문의 시 아래 양식에 맞춰 작성해주세요.
                                                     
                            <예시>
                            에러 발견 : 앱 로딩시 튕김 현상이 일어납니다 ㅠㅠ
                                                     
                            -------------------
                                                     
                            Device Model : \(self.getDeviceIdentifier())
                            Device OS : \(UIDevice.current.systemVersion)
                            App Version : \(self.getCurrentVersion())
                                                     
                            -------------------
                            """
    
    let sendButtonText = "Give Feedback"
    let subject = "Feedback"
    
    static let shared = Constants()
    
    init(){
        if let file = Bundle.main.path(forResource: "Email", ofType: "txt"){
            do {
                self.email = try String(contentsOfFile: file)
            } catch let error {
                print(error)
            }
        }
    }
}
