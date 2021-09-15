//
//  ProgressView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 15/09/21.
//

import SwiftUI

struct ProgressView: View {
    @Binding var progressState: Int
    var body: some View {
        HStack {
            ForEach((1...4), id: \.self) { i in
                if i == progressState {
                    Circle()
                        .frame(width: 10, height: 10)
                } else {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progressState: .constant(2))
    }
}
