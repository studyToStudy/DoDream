//
//  PopUpView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/03.
//

import SwiftUI

struct PopUpView: View {
    
    @State var customAlert = false
    @State var HUD = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                Button(action: {
                    
                    withAnimation {
                        customAlert.toggle()
                    }
                    
                }) {
                    Text("Custom AlertView")
                }
            }
            if customAlert {
                CustomAlertView(show: $customAlert)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func alertView() {
        
        let alert = UIAlertController(title: "Description", message: "두드림 설명", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) {(_) in
            
        }
        
        // adding into alertView
        alert.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            
        })
    }
}

struct BlurView : UIViewRepresentable {
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        
        return view
    }
}

struct CustomAlertView : View {
    
    @Binding var show : Bool
    var body: some View {
    
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            VStack(spacing: 25) {
                Image(systemName: "figure.run.square.stack.fill")
                
                Text("두드림 사용법")
                    .font(.custom("THEGaeideuk", size: 30))
                    .foregroundColor(.primary)
                
                Text("하루에 하나씩, 작은 목표들을 이뤄가며 성취감을 얻어 가는 건 어떨까요?")
                    .font(.custom("THEGaeideuk", size: 20))
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(BlurView())
            .cornerRadius(25)
            
            Button(action: {
                
                withAnimation {
                    show.toggle()
                }
            }) {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.purple)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.35)
        )
    }
}


struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}
