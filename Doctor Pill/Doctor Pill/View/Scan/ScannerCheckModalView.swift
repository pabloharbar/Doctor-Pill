//
//  ScannerCheckModalView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 13/09/21.
//

import SwiftUI

struct ScannerCheckModalView: View {
    @Binding var modalShowing: Bool
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    Image(systemName: "infinity.circle")
                        .font(.system(size: 36))
                    VStack(alignment: .leading) {
                        Text("Nome do remédio")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                        Text("Nome do tratamento/função")
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                    Button(action: {
                        modalShowing = false
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    })
                }
                HStack {
                    Text("09 : 41")
                        .font(.system(size: 22))
                        .padding(.horizontal)
                    Spacer()
                    Image(systemName: "pills")
                        .font(.system(size: 24))
                        .padding(.horizontal)
                }
                .padding(.vertical)
                Button("OUVIR CARD NOVAMENTE") {
                    
                }
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(Color.green)
                .border(Color.black, width: 1)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .foregroundColor(.black)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 1)
        )
        }
        .padding()
        
    }
}

struct ScannerCheckModalView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerCheckModalView(modalShowing: .constant(true))
    }
}
