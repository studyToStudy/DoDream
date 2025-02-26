//
//  AddNewTask.swift
//  Task Manager (iOS)
//
//  Created by 이정후 on 2022/12/06.
//

import SwiftUI

struct AddNewTask: View {
    @EnvironmentObject var taskModel: TaskViewModel
    @Environment(\.colorScheme) var colorShceme
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    var body: some View {
        VStack(spacing: 12){
            Text("일정")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
                .overlay(alignment: .trailing) {
                    Button {
                        if let editTast = taskModel.editTask{
                            env.managedObjectContext.delete(editTast)
                            try? env.managedObjectContext.save()
                            env.dismiss()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                    .opacity(taskModel.editTask == nil ? 0 : 1)
                }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("카드 테마")
                    .font(.caption)
                    .foregroundColor(colorShceme == .dark ? .white : .black)
                
                // MARK: Sample Card Colors
                let colors: [String] = ["Yellow","Green","Blue","Purple","Red","Orange"]
                
                HStack(spacing: 15){
                    ForEach(colors,id: \.self){color in
                        Circle()
                            .fill(Color(color))
                            .frame(width: 25, height: 25)
                            .background{
                                if taskModel.taskColor == color{
                                    Circle()
                                        .strokeBorder(.gray)
                                        .padding(-3)
                                }
                            }
                            .contentShape(Circle())
                            .onTapGesture {
                                taskModel.taskColor = color
                            }
                    }
                }
                .padding(.top,10)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.top,30)
            
            Divider()
                .padding(.vertical,10)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("일정")
                    .font(.caption)
                    .foregroundColor(colorShceme == .dark ? .white : .black)
                
                Text(taskModel.taskDeadline.formatted(date: .abbreviated, time: .omitted) + ", " + taskModel.taskDeadline.formatted(date: .omitted, time: .shortened))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top,8)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    taskModel.showDatePicker.toggle()
                } label: {
                    Image(systemName: "calendar")
                        .foregroundColor(colorShceme == .dark ? .white : .black)
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("일정 제목")
                    .font(.caption)
                    .foregroundColor(colorShceme == .dark ? .white : .black)
                
                TextField("", text: $taskModel.taskTitle)
                    .keyboardType(.default)
                    .frame(maxWidth: .infinity)
                    .padding(.top,8)
            }
            .padding(.top,10)
            
            Divider()
            
            // MARK: Sample Task Types
            let taskTypes: [String] = ["기본","중간","중요"]
            VStack(alignment: .leading, spacing: 12) {
                Text("일정 중요도")
                    .font(.caption)
                    .foregroundColor(colorShceme == .dark ? .white : .black)
                HStack(spacing: 12){
                    ForEach(taskTypes,id: \.self){type in
                        Text(type)
                            .font(.callout)
                            .padding(.vertical,8)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(taskModel.taskType == type ? .white : .black)
                            .background{
                                if taskModel.taskType == type{
                                    Capsule()
                                        .fill(.primary)
//                                        .matchedGeometryEffect(id: "TYPE", in: animation)
                                }else{
                                    Capsule()
                                        .strokeBorder(.primary)
                                }
                            }
//                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation{taskModel.taskType = type}
                            }
                    }
                }
                .padding(.top,8)
            }
            .padding(.vertical,10)
            
            Divider()
            
            // MARK: Save Button
            Button {
                // MARK: If Success Closing View
                if taskModel.addTask(context: env.managedObjectContext){
                    env.dismiss()
                }
            } label: {
                Text("저장")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,12)
                    .foregroundColor(.black)
                    .background{
                        Capsule()
                            .strokeBorder(.primary)
//                            .fill(.white)
                    }
            }
            .frame(maxHeight: .infinity,alignment: .leading)
            .padding(.bottom,10)
            .disabled(taskModel.taskTitle == "")
            .opacity(taskModel.taskTitle == "" ? 0.6 : 1)
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .padding()
        .overlay {
            ZStack{
                if taskModel.showDatePicker{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            taskModel.showDatePicker = false
                        }
                    
                    // MARK: Disabling Past Dates
                    DatePicker.init("", selection: $taskModel.taskDeadline,in: Date.now...Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                        .background(colorShceme == .dark ? .blue : .white,in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .padding()
                }
            }
            .animation(.easeInOut, value: taskModel.showDatePicker)
        }
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask()
            .environmentObject(TaskViewModel())
    }
}
