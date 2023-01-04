//
//  TaskCombineView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/04.
//

import SwiftUI

struct TaskCombineView: View {
    
    @StateObject var taskVM = TaskViewModel()
    
    @State var searched = ""
    
    var body: some View {
            NavigationView{
                VStack{
                    TaskSearchView(taskVM: taskVM)
                    SortPickerView(taskVM : taskVM)
                    TaskListView(taskVM : taskVM)
                }
                .modifier(MainViewModifier(taskVM : taskVM))
            }
    }
}

struct TaskCombineView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCombineView()
    }
}
