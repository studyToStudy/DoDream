//
//  FaceIDView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/04.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject
    var viewModel: ViewModel
    var body: some View {
        VStack {
                    Spacer()
                    Text("Biometric Auth")
                        .font(.title)
                    Spacer()
                        .frame(height: 20)
                    Button(action: {
                        self.viewModel.auth()
                    }) {
                        Text("인증하기")
                    }
                    Spacer()
                    if viewModel.loggedIn {
                        Text("인증 성공!")
                    }
                    Spacer()
                }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(ViewModel())
    }
}
