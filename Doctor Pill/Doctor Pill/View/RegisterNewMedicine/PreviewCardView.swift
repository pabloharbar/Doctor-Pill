//
//  PreviewCardView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 15/09/21.
//

import SwiftUI

struct PreviewCardView: View {
    var body: some View {
        VStack {
            Text("Horário")
                .padding(.top,5)
            
            VStack {
                HStack {
                    Circle().frame(width: 30, height: 30)
                    VStack {
                        Text("Dipirona")
                        Text("200 mg")
                    }
                    Spacer()
                }
                Divider()
                    .padding(.top, 60)
                HStack {
                    Image(systemName: "camera.fill")
                    Text("Escanear")
                }
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
        }
        .background(Color.green)
        .cornerRadius(20)
        .padding(.horizontal,40)
    }
}

struct PreviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCardView()
    }
}
