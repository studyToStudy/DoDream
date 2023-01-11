//
//  SecurityView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/11.
//

import SwiftUI
import LocalAuthentication

struct SecurityView: View {
    
    @State private var isOpenFaceIdLock = false
    @State private var isGoOpenAuth: Bool = false
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                // ...
                HStack(spacing: 0) {
                    Toggle(isOn: $isOpenFaceIdLock) {
                        HStack {
                            Text("FaceID")
                                .font(.callout)
                                .foregroundColor(.black)
                        }
                    }                    .onChange(of: isOpenFaceIdLock) { value in
                        // 코드작성
                    }
                }
            }
        }
        .onAppear {
            self.isOpenFaceIdLock = UserDefaults.standard.bool(forKey: "isOpenFaceIdLock")
        }
        
    }
    
    struct SecurityView_Previews: PreviewProvider {
        static var previews: some View {
            SecurityView()
        }
    }
}
