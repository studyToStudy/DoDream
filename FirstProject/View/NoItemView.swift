//
//  NoItemView.swift
//  DoDream
//
//  Created by 이정후 on 2022/12/31.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Do Dream😄")
                    .font(.custom("THEGaeideuk", size: 40))
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("DoDream 추가하기!")
                            .font(.custom("THEGaeideuk", size: 20))
                            .foregroundColor(.blue)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                    })
                .padding(.horizontal)
//                .scaleEffect(animate ? 1.1 : 1.0)
//                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
    }
}
