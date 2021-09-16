//
//  ConditionView.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 15/09/21.
//

import SwiftUI

struct ConditionView: View {
    let amount: Int
    let image: Image

    var body: some View {
        HStack(spacing: 2) {
            if amount > 0 {
                Text("\(amount)")
                    .font(.system(size: 36, weight: .light, design: .default))
            }
            image
        }
        .padding(8)
        .frame(minWidth: 67, minHeight: 63, maxHeight: 63)
        .background(Color.white)
        .cornerRadius(20)
        .clipped()
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: -3)
    }
}

struct ConditionView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionView(amount: 1, image: Image("tipo_comprimido"))
    }
}
