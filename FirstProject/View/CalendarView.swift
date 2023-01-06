//
//  CalendarView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/05.
//

import SwiftUI

struct CalendarView: View {
//    @EnvironmentObject var calendarTaskViewModel : CalendarTaskViewModel
    @State private var currentDay: Date = .init()
    @State private var tasks: [Tasks] = []
//    @AppStorage("task") private var task: [Tasks] = []
    @State private var addNewTask: Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            TimelineView()
                .padding(15)
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            HeaderView()
        }
        .fullScreenCover(isPresented: $addNewTask) {
            AddTaskView { task in
                tasks.append(task)
            }
        }
    }
    
    // timeline
    @ViewBuilder
    func TimelineView() -> some View {
        ScrollViewReader { proxy in
            let hours = Calendar.current.hours
            let midHour = hours[hours.count / 2]
            VStack {
                ForEach(hours, id: \.self) { hour in
                    TimelineViewRow(hour)
                        .id(hour)
                }
            }
            .onAppear {
                proxy.scrollTo(midHour)
            }
        }
    }
    
    // timeline view row
    
    @ViewBuilder
    func TimelineViewRow( _ date: Date) -> some View {
        HStack(alignment: .top) {
            Text(date.toString("h a"))
                .font(.system(size: 14))
                .fontWeight(.regular)
                .frame(width: 45, alignment: .leading)
            
            // 필터링
            let calendar = Calendar.current
            let filteredTasks = tasks.filter {
                if let hour = calendar.dateComponents([.hour], from: date).hour,
                   let taskHour = calendar.dateComponents([.hour], from: $0.dateAdded).hour,
                   hour == taskHour && calendar.isDate($0.dateAdded, inSameDayAs: currentDay){
                    return true
                }
                return false
            }
            
            if filteredTasks.isEmpty {
                Rectangle()
                    .stroke(.gray.opacity(0.5), style: StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .bevel, dash: [5], dashPhase: 5))
                    .frame(height: 0.5)
                    .offset(y: 10)
            } else {
                VStack(spacing: 10) {
                    ForEach(filteredTasks) { task in
                       TaskRow(task)
                    }
                }
            }
        }
        .hAlign(.leading)
        .padding(.vertical, 15)
    }
    
    // Task Row
    @ViewBuilder
    func TaskRow(_ task: Tasks) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(task.taskName.uppercased())
                .font(.system(size: 16))
                .fontWeight(.regular)
                .foregroundColor(task.taskCategory.color)
            
            if task.taskDescription != "" {
                Text(task.taskDescription)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(task.taskCategory.color.opacity(0.8))
            }
        }
        .hAlign(.leading)
        .padding(12)
        .background {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(task.taskCategory.color)
                    .frame(width: 4)
                
                Rectangle()
                    .fill(task.taskCategory.color.opacity(0.25))
            }
        }
    }
    
    // header
    @ViewBuilder
    func HeaderView() -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Today")
                        .font(.system(size: 30))
                    Text("Welcome, DoDream")
                        .font(.system(size: 14))
                }
                .hAlign(.leading)
                
                Button {
                    addNewTask.toggle()
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "plus")
                        Text("Add Task")
                            .font(.system(size: 15))
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        Capsule()
                            .fill(Color("Blue").gradient)
                    }
                    .foregroundColor(.white)
                }
            }
            Text(Date().toString("MMM YYYY"))
                .font(.system(size: 16))
                .hAlign(.leading)
                .padding(.top, 15)
            
            WeekRow()
        }
        .padding(15)
        .background {
            VStack(spacing: 0) {
                Color.white
                
                Rectangle()
                    .fill(.linearGradient(
                        colors:[
                            .white,
                            .clear
                        ], startPoint: .top, endPoint: .bottom))
                    .frame(height: 20)
            }
            .ignoresSafeArea()
        }
    }
    
    // week
    @ViewBuilder
    func WeekRow() -> some View {
        HStack(spacing: 0) {
            ForEach(Calendar.current.currentWeek){weekDay in
                let status = Calendar.current.isDate(weekDay.date, inSameDayAs: currentDay)
                VStack(spacing: 6) {
                    Text(weekDay.string.prefix(3))
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                    Text(weekDay.date.toString("dd"))
                        .font(.system(size: 16))
                        .fontWeight(status ? .medium : .regular)
                }
                // 오늘 날짜 하이라이팅
                .foregroundColor(status ? Color("Blue") : .gray)
                .hAlign(.center)
                .contentShape(Rectangle())
                // 요일 선택
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentDay = weekDay.date
                    }
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, -15)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView()
    }
}

// MARK: View Extension

extension View {
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}


// MARK: Date Extension
// Date 형식 변환
extension Date {
    func toString(_ format: String) -> String {
        let formmater = DateFormatter()
        formmater.dateFormat = format
        return formmater.string(from: self)
    }
}

// MARK: Calendar
extension Calendar {
    var hours: [Date] {
        let startOfDay = self.startOfDay(for: Date())
        var hours: [Date] = []
        for index in 0..<24 {
            if let date = self.date(byAdding: .hour, value: index, to: startOfDay) {
                hours.append(date)
            }
        }
        return hours
    }
    
    var currentWeek : [WeekDay] {
        guard let firstWeekDay = self.dateInterval(of: .weekOfMonth, for: Date())?.start
            else {return []}
        var week : [WeekDay] = []
        for index in 0..<7 {
            if let day = self.date(byAdding: .day, value: index,to: firstWeekDay) {
                let weekDaySymbol : String = day.toString("EEEE")
                let isToday = self.isDateInToday(day)
                week.append(.init(string: weekDaySymbol, date: day, isToday: isToday))
            }
        }
        return week
    }
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var string: String
        var date: Date
        var isToday: Bool = false
    }
}
