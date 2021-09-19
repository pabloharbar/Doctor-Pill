//
//  TakenPreviewCard.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 19/09/21.
//

import SwiftUI

struct TakenPreviewCard: View {
    var remedio: Remedio
    
    fileprivate func detalhesRemedio() -> some View {
        return HStack(spacing: 12) {
            Circle()
                .fill(Color.white)
                .frame(width: 50, height: 50)
                .overlay(Circle().stroke(lineWidth: 1))
            VStack(alignment: .leading, spacing: 4) {
                Text(remedio.nome)
                    .font(.title2)
                Text("\(remedio.quantidade.formatNumber()) \(remedio.tipo.rawValue.lowercased())\(remedio.quantidade > 1 ? "s" : ""), \(remedio.posologia)")
                    .font(.callout)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 19) {
                Image(systemName: "speaker.wave.3.fill")
                    .font(.title2)

                Text("UHUL! REMÉDIO TOMADO!")
                    .font(.headline)
                
                Spacer()
            }
            detalhesRemedio()
        }
        .padding(14)
        .background(Color("PreviewGreen"))
        .cornerRadius(20)
        .padding(.vertical, 14)
        .onTapGesture {
            // TODO
        }
    }
}

struct TakenPreviewCard_Previews: PreviewProvider {
    static var previews: some View {
        TakenPreviewCard(remedio: Remedio(nome: "Flancox", posologia: "500mg", quantidade: 4, tipo: .comprimido, formato: .capsula, vezesAoDia: 3, continuidade: (duracao: 4, frequencia: .dias), horarios: [Date()], instrucoes: [.agua, .aoAcordar], notas: "Super teste para médicos e suas observações muito úteis para tomar o remédio"))
    }
}
