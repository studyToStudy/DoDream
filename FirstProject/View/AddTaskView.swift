//
//  AddTaskView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/05.
//

import SwiftUI

struct AddTaskView: View {
    var onAdd: (Tasks) -> ()
    @Environment(\.dismiss) private var dismiss
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskCategory: Category = .수업
    @State private var animateColor: Color = Category.수업.color
    @State private var animate: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                }
                Text("Create New Task")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .padding(.vertical, 15)
                
                TitleView("NAME")
                
                TextField("Make new Video", text: $taskName)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(.white.opacity(0.7))
                    .frame(height: 1)

                
                TitleView("DATE")
                    .padding(.top, 15)
                
                HStack(alignment: .bottom, spacing: 12) {
                    HStack(spacing: 12) {
                        Text(taskDate.toString("EEEE dd, MMMM"))
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            
                        Image(systemName: "calendar")
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                DatePicker("", selection: $taskDate, displayedComponents: [.date])
                                    .blendMode(.destinationOver)
                            }
                    }
                    .offset(y: -5)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .fill(.white.opacity(0.7))
                            .frame(height: 1)
                            .offset(y: 5)
                    }
                    HStack(spacing: 12) {
                        Text(taskDate.toString("hh:mm a"))
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            
                        Image(systemName: "clock")
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                DatePicker("", selection: $taskDate, displayedComponents: [.hourAndMinute])
                                    .blendMode(.destinationOver)
                            }
                    }
                    .offset(y: -5)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .fill(.white.opacity(0.7))
                            .frame(height: 1)
                            .offset(y: 5)
                    }
                    
                }
                .padding(.bottom, 15)
            }
            .hAlign(.leading)
            .padding(15)
            .background {
                ZStack {
                    taskCategory.color
                    
                }
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                TitleView("DESCRIPTION", .gray)
                
                TextField("About Your Task", text: $taskDescription)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .padding(.top, 2)
                
                Rectangle()
                    .fill(.black.opacity(0.2))
                    .frame(height: 1)
                
                TitleView("CATEGORY", .gray)
                    .padding(.top, 15)
                
                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 20), count: 3), spacing: 15) {
                    ForEach(Category.allCases, id: \.rawValue) { category in
                        Text(category.rawValue.uppercased())
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .hAlign(.center)
                            .padding(.vertical, 5)
                            .background {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(category.color.opacity(0.3))
                            }
                            .foregroundColor(category.color)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                guard !animate else { return }
                                animateColor = category.color
                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1, blendDuration: 1)) {
                                    animate = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    animate = false
                                    taskCategory = category
                                }
                            }
                    }
                }
                .padding(.top, 5)
                
                Button {
                    let task = Tasks(dateAdded: taskDate, taskName: taskName, taskDescription: taskDescription, taskCategory: taskCategory)
                    onAdd(task)
                    dismiss()
                } label: {
                    Text("Create Task")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.vertical, 15)
                        .hAlign(.center)
                        .background {
                            Capsule()
                                .fill(animateColor.gradient)
                        }
                }
                .vAlign(.bottom)
                .disabled(taskName == "" || animate)
                .opacity(taskName == "" ? 0.6 : 1)
            }
            .padding(15)
        }
        .vAlign(.top)
    }
    
    @ViewBuilder
    func TitleView(_ value: String, _ color: Color = .white.opacity(0.7)) -> some View {
        Text(value)
            .font(.system(size: 12))
            .fontWeight(.regular)
            .foregroundColor(color)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView { task in
            
        }
    }
}
