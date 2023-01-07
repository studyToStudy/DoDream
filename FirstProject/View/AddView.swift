//
//  AddView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/06.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFiledText: String = ""
    @State private var searchText = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
             TextField("Write your Dream", text: $textFiledText)
                .keyboardType(.default)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.908))
                .cornerRadius(10)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .focused($isFocused)

            Button(action: saveButtonPressed, label: {
                Text("저장".uppercased())
                    .font(.custom("THEGaeideuk", size: 25))
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .disabled(self.textFiledText.isEmpty)
            })
        }
        .padding(14)
        .navigationTitle("퀵노트🖊️")
        .font(.custom("THEGaeideuk", size: 30))
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFiledText)
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
