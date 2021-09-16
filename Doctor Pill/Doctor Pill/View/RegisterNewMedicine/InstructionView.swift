//
//  InstructionView.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 15/09/21.
//

import SwiftUI

struct InstructionView: View {
    let amount = 1

    var body: some View {
        HStack(spacing: 2) {
            Text("\(amount)")
                .font(.system(size: 36, weight: .light, design: .default))
            Image(systemName: "pills")
        }
        .padding(8)
        .frame(minWidth: 67, idealHeight: 63)
        .background(Color.white)
        .cornerRadius(20)
        .clipped()
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: -3)
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
