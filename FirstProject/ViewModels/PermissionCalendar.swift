//
//  PermissionCalendar.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/16.
//

import Foundation
// EKEventStore 사용시 필수
import EventKitUI

class PermissionCalendar: ObservableObject {
    
    let eventStore = EKEventStore()
    
    switch EKEventStore().authorizationStatus(for: .event)
}
