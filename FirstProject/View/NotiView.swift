//
//  NotiView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/11.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotifiaction() {
        let content = UNMutableNotificationContent()
        content.title = "오늘도 좋은 하루 보내세요"
        content.subtitle = "일정 관리 화이팅!"
        content.sound = .default
        content.badge = 1
        // 시간
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // 일정
        var dateComponents = DateComponents()
        dateComponents.hour = 9
        dateComponents.minute = 0
        // 위치
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString
                                            , content: content
                                            , trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct NotiView: View {
//    let center = UNUserNotificationCenter.current()
    @State private var someToggle = true
    var body: some View {
        VStack {
            List {
                Toggle("알림 설정", isOn: $someToggle)
                
            }
        }
    }
}

struct NotiView_Previews: PreviewProvider {
    static var previews: some View {
        NotiView()
    }
}
