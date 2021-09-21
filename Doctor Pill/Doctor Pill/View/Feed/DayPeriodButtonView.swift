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
                        LinearGradient(gradient: Gradient(colors: [Color("DarkMorning"),Color("LightMorning")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                    .cornerRadius(20)
            })
            
            Button(action: {
                scrollToTarget = 2
            }, label: {
                Image(systemName: "sun.max")
                    .frame(width: 64, height: 64, alignment: .center)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("DarkAfternoon"),Color("LightAfternoon")]), startPoint: .leading, endPoint: .topTrailing)
                        )
                    .cornerRadius(20)
            })
            
            Button(action: {
                scrollToTarget = 3
            }, label: {
                Image(systemName: "moon.stars")
                    .frame(width: 64, height: 64, alignment: .center)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("LightNight"),Color("DarkNight")]), startPoint: .bottomLeading, endPoint: .topTrailing)
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
