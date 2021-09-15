//
//  DayPeriodButtonView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct DayPeriodButtonView: View {
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sunrise")
                .frame(width: 64, height: 64, alignment: .center)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 234/255, blue: 121/255),Color(red: 251/255, green: 202/255, blue: 106/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                )
                .cornerRadius(20)
            Image(systemName: "sun.max")
                .frame(width: 64, height: 64, alignment: .center)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 169/255, blue: 142/255),Color(red: 251/255, green: 184/255, blue: 106/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                .cornerRadius(20)
            Image(systemName: "moon.stars")
                .frame(width: 64, height: 64, alignment: .center)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(red: 98/255, green: 208/255, blue: 1),Color(red: 175/255, green: 170/255, blue: 1)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                        )
                .cornerRadius(20)
        }
        .font(.system(size: 36))
    }
}

struct DayPeriodButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DayPeriodButtonView()
    }
}
