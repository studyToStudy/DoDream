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
    
    var body: some View {
        ScrollView {
             TextField("Write your Dream", text: $textFiledText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.908))
                .cornerRadius(10)
                .foregroundColor(.black)

            Button(action: saveButtonPressed, label: {
                Text("저장".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .disabled(self.textFiledText.isEmpty)
            })
        }
        .padding(14)
        .navigationTitle("Memo🖊️")
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
