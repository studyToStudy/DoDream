//
//  MailModel.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/11.
//

import Foundation
import SwiftUI
import MessageUI

struct MailModel : UIViewControllerRepresentable{
    
    var content: String
    var to: String
    var subject: String
    
    typealias UIViewControllerType = MFMailComposeViewController
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        
    }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        if MFMailComposeViewController.canSendMail(){
            let view = MFMailComposeViewController()
            view.mailComposeDelegate = context.coordinator
            view.setToRecipients([to])
            view.setSubject(subject)
            view.setMessageBody(content, isHTML: false)
            return view
        } else {
            return MFMailComposeViewController()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    class Coordinator : NSObject, MFMailComposeViewControllerDelegate{
        
        var parent : MailModel
        
        init(_ parent: MailModel){
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
        
       
    }
    func getDeviceIdentifier() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }

    // 현재 버전 가져오기
    func getCurrentVersion() -> String {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String else { return "" }
        return version
    }
    
}
