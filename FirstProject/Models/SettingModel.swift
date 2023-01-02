//
//  SettingModel.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/02.
//

import Foundation
import UIKit
import MessageUI

final class SettingViewModel {
    /// 문의 및 의견 내용
    func commentsBodyString() -> String {
        return """
                이곳에 내용을 작성해주세요. 오타 발견 문의는 아래 양식에 맞춰 작성해주세요.
                <예시>
                글귀 ID : 글귀 4 (글귀 클릭 시 상단에 표시)
                수정 전 : 실수해도 되.
                수정 후 : 실수해도 돼.
                -------------------
                Device Model : \(getDeviceIdentifier())
                Device OS : \(UIDevice.current.systemVersion)
                App Version : \(getCurrentVersion())
                -------------------
                """
    }

    /// 메일 전송 실패 Alert
    func sendMailFailAlert() -> UIAlertController {
        let sendMailErrorAlert = UIAlertController(
            title: "메일 전송 실패",
            message: "메일을 보내려면 'Mail' 앱이 필요합니다. App Store에서 해당 앱을 복원하거나 이메일 설정을 확인하고 다시 시도해주세요.",
            preferredStyle: .alert
        )

        let goAppStoreAction = UIAlertAction(title: "App Store로 이동하기", style: .default) { _ in
            // 앱스토어로 이동하기(Mail)
            let store = "https://apps.apple.com/kr/app/mail/id1108187098"
            if let url = URL(string: store), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        let cancleAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)

        sendMailErrorAlert.addAction(goAppStoreAction)
        sendMailErrorAlert.addAction(cancleAction)
        return sendMailErrorAlert
    }

    /// 앱스토어로 이동
    func goToStore(_ appName: String) {
        var store = ""
        switch appName {
        case "모닥이":
            store = "https://apps.apple.com/kr/app/%EB%AA%A8%EB%8B%A5%EC%9D%B4/id1596424726"
        case "Scoit":
            store = "https://apps.apple.com/kr/app/scoit/id1576850548"
        case "h:ours":
            store = "https://apps.apple.com/kr/app/h-ours/id1605524722"
        default:
            break
        }

        if let url = URL(string: store), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    /// 앱스토어 리뷰 화면으로 이동
    func goToAppRating() {
        let store = "https://apps.apple.com/kr/app/%EB%AA%A8%EB%8B%A5%EC%9D%B4/id1596424726"
        if let url = URL(string: store), UIApplication.shared.canOpenURL(url) {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems =  [URLQueryItem(name: "action", value: "write-review")]

            guard let writeReviewURL = components?.url else { return }

            if #available(iOS 10.0, *) {
                UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(writeReviewURL)
            }
        }
    }

    /// 현재 버전 가져오기
    func getCurrentVersion() -> String {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String else { return "" }
        return version
    }

    /// 최신 버전 가져오기
    func getUpdatedVersion() -> String {
        guard let url = URL(string: "http://itunes.apple.com/lookup?bundleId=com.alswl.Modakyi"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
              let results = json["results"] as? [[String: Any]],
                  results.count > 0,
            let appStoreVersion = results[0]["version"] as? String else { return "" }
        return appStoreVersion
    }

    /// 기기 Identifier 찾기
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
}
