//
//  CardHistoricoView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct CardHistoricoView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Tratamento")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    Text("jan. 2020 - set. 2021")
                        .font(.system(size: 14))
                }
                Spacer()
                Image(systemName: "chart.bar.doc.horizontal.fill")
                    .rotationEffect(.init(degrees: -90))
                    .font(.system(size: 24))
            }
            HStack {
                Text("3 remédios registrados")
                Spacer()
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "eye")
                Text("Ver remédios")
            }
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

struct CardHistoricoView_Previews: PreviewProvider {
    static var previews: some View {
        CardHistoricoView()
    }
}
