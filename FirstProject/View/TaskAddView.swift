//
//  Home.swift
//  Task Manager (iOS)
//
//  Created by 이정후 on 2022/12/06.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var colorShceme
    @StateObject var taskModel: TaskViewModel = .init()
    // MARK: Matched Geometry Namespace
    @Namespace var animation
    
    // MARK: Fetching Task
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.deadline, ascending: false)], predicate: nil, animation: .easeInOut) var tasks: FetchedResults<Task>
    
    // MARK: Environment Values
    @Environment(\.self) var env
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                VStack(alignment: .leading, spacing: 8) {
                    Text("두드림")
                        .font(.callout)
                    Text("일정관리")
                        .font(.title2.bold())
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.vertical)
                
                CustomSegmentedBar()
                    .padding(.top,5)
                
                // MARK: TaskView
                TaskView()
            }
            .padding()
        }
        .overlay(alignment: .bottom) {
            // MARK: Add Button
            Button {
                taskModel.openEditTask.toggle()
            } label: {
                Label {
                    Text("일정 추가하기")
                        .font(.callout)
                        .fontWeight(.semibold)
//                        .padding()
                } icon: {
                    Image(systemName: "plus.app.fill")
                }
                .foregroundColor(.white)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(.blue,in: Capsule())
            }
            // MARK: Linear Gradient BG
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
//            .background
//            {
//                LinearGradient(colors: [
//                    .white.opacity(0.05),
//                    .white.opacity(0.4),
//                    .white.opacity(0.7),
//                    .white.opacity(0.7),
//                    .white
//                ], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
//            }
        }
        .fullScreenCover(isPresented: $taskModel.openEditTask) {
            taskModel.resetTaskData()
        } content: {
            AddNewTask()
                .environmentObject(taskModel)
        }
    }
    
    // MARK: TaskView
    @ViewBuilder
    func TaskView()->some View{
        LazyVStack(spacing: 20){
            // MARK: Custom Filtered Request View
            DynamicFilteredView(currentTab: taskModel.currentTab) { (task: Task) in
                TaskRowView(task: task)
            }
        }
        .padding(.top,20)
    }
    
    // MARK: Task Row View
    @ViewBuilder
    func TaskRowView(task: Task)->some View{
        VStack(alignment: .leading, spacing: 10) {
            HStack{
                Text(task.type ?? "")
                    .font(.callout)
                    .padding(.vertical,5)
                    .padding(.horizontal)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.3))
                    }
                
                Spacer()
                
                // MARK: Edit Button Only for Non Completed Tasks
                if !task.isCompleted || taskModel.currentTab != "놓친 일정"{
                    Button {
                        taskModel.editTask = task
                        taskModel.openEditTask = true
                        taskModel.setupTask()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                    }
                }
            }
            
            Text(task.title ?? "")
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.vertical,10)
            
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Label {
                        Text((task.deadline ?? Date()).formatted(date: .long, time: .omitted))
                    } icon: {
                        Image(systemName: "calendar")
                    }
                    .font(.caption)
                    
                    Label {
                        Text((task.deadline ?? Date()).formatted(date: .omitted, time: .shortened))
                    } icon: {
                        Image(systemName: "clock")
                    }
                    .font(.caption)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                if !task.isCompleted && taskModel.currentTab != "놓친 일정"{
                    Button {
                        // MARK: Updating Core Data
                        task.isCompleted.toggle()
                        try? env.managedObjectContext.save()
                    } label: {
                        Circle()
                            .strokeBorder(.black,lineWidth: 1.5)
                            .frame(width: 25, height: 25)
                            .contentShape(Circle())
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(task.color ?? "Yellow"))
        }
    }
    
    // MARK: Custom Segmented Bar
    @ViewBuilder
    func CustomSegmentedBar()->some View{
        // In Case if we Missed the Task
        let tabs = ["오늘","다음 일정","완료된 일정","놓친 일정"]
        HStack(spacing: 0){
            ForEach(tabs,id: \.self){tab in
                Text(tab)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .scaleEffect(0.9)
                    .foregroundColor(.black)
                    .padding(.vertical,6)
                    .frame(maxWidth: .infinity)
                    .background{
                        if taskModel.currentTab == tab{
                            Capsule()
                                .fill(.gray)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{taskModel.currentTab = tab}
                    }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        TaskMainView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        let darckColor = Color.black
        
        switch scheme {
        case .light : return lightColor
        case .dark : return darckColor
        @unknown default: return lightColor
        }
    }
}
