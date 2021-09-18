//
//  FormatoView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct FormatoView: View {
    var body: some View {
        List {
            ForEach(Instrucoes.allCases, id: \.self) { instrucao in
                HStack {
                    instrucao.getImage()
                    Text(instrucao.rawValue)
                }
                .padding(.leading)
                .font(.system(size: 17))
            }
        }
    }
}

struct FormatoView_Previews: PreviewProvider {
    static var previews: some View {
        FormatoView()
    }
}
