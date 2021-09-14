//
//  FormatoView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct FormatosPadroes: Hashable {
    let name: String
    let image: Image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

struct FormatoView: View {
    let formatosPadroes: [FormatosPadroes] = TratamentosManager.formatosPadroes
    var body: some View {
        List {
            ForEach(formatosPadroes, id: \.self) { formato in
                HStack {
                    formato.image
                    Text(formato.name)
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
