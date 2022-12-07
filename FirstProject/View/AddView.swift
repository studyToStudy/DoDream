//
//  AddView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/06.
//

import SwiftUI

struct AddView: View {
    
    @State var textFiledText: String = ""
    
    var body: some View {
        ScrollView {
            TextField("텍스트를 입력하세요.", text: $textFiledText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.908))
                .cornerRadius(10)
            
            Button(action: {
                
            },
                   label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .padding(14)
        .navigationTitle("Add an Item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}