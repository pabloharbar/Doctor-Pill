//
//  DayPeriodButtonView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct DayPeriodButtonView: View {
    @EnvironmentObject var feedManager: FeedManager
    @Binding var scrollToTarget: Int?
    var body: some View {
        HStack(spacing: 30) {
            Button(action: {
                scrollToTarget = 1
            }, label: {
                Image(systemName: "sunrise")
                    .frame(width: 64, height: 64, alignment: .center)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 234/255, blue: 121/255),Color(red: 251/255, green: 202/255, blue: 106/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                    .cornerRadius(20)
            })
            
            Button(action: {
                scrollToTarget = 2
            }, label: {
                Image(systemName: "sun.max")
                    .frame(width: 64, height: 64, alignment: .center)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 169/255, blue: 142/255),Color(red: 251/255, green: 184/255, blue: 106/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                        )
                    .cornerRadius(20)
            })
            
            Button(action: {
                scrollToTarget = 3
            }, label: {
                Image(systemName: "moon.stars")
                    .frame(width: 64, height: 64, alignment: .center)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 98/255, green: 208/255, blue: 1),Color(red: 175/255, green: 170/255, blue: 1)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                    .cornerRadius(20)
            })
        }
        .foregroundColor(.black)
        .font(.system(size: 36))
    }
}

struct DayPeriodButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DayPeriodButtonView(scrollToTarget: .constant(3))
    }
}
