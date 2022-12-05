//
//  ListRowView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/05.
//

import SwiftUI

struct ListLowView: View {
    let title: String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

struct ListLowView_Previews: PreviewProvider {
    static var previews: some View {
        ListLowView(title: "This is The first Item")
    }
}
