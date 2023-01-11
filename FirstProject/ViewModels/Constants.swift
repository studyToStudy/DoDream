//
//  Constants.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/11.
//

import Foundation

struct Constants{
    
    var email = ""
    
    let noSupportText = "애플 메일 계정이 있는지 확인해 주세요"
    let contentPreText = """
                         두드림을 사용하시고 버그나 기타 문의사항이 있으시다면 말씀해주세요.
                         
                         아래 양식을 참고해서 작성해주세요.
                         
                         <예시>
                         앱 실행시 화면이 깨져요ㅠㅠ
                         다른 기능도 추가해주세요!
                         
                         -------------------
                         사용해주서 감사합니다. 개발자 드림
                         (jenghoo515@gmail.com)
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
