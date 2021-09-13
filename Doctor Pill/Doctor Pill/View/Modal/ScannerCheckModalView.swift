//
//  ScannerCheckModalView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 13/09/21.
//

import SwiftUI

struct ScannerCheckModalView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "infinity.circle")
                    .font(.system(size: 36))
                VStack(alignment: .leading) {
                    Text("Nome do remédio")
                    Text("Nome do tratamento/função")
                }
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "xmark")
                })
            }
            HStack {
                Text("9:41")
                Spacer()
                Image("")
            }
            Button("Ouvir card novamente") {
                
            }
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 1)
        )
        
    }
}

struct ScannerCheckModalView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerCheckModalView()
    }
}
