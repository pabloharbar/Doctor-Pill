//
//  ScannerCheckModalView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 13/09/21.
//

import SwiftUI

struct ScannerCheckModalView: View {
    var hora: String
    var nome: String
    var intrucoes: [Instrucoes]
    var posologia: String
    let scannerButtonEnabled: Bool
    @EnvironmentObject var feedManager: FeedManager
    
    var speechManager = SpeechManager()
    
    fileprivate func detalhesRemedio() -> some View {
        return HStack(spacing: 12) {
            Circle().frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4) {
                Text(nome)
                    .font(.title2)
                Text(posologia)
                    .font(.callout)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom,14)
    }
    
    fileprivate func botaoConfirmar() -> some View {
        return Button(action: {}) {
            Image(systemName: "checkmark")
                .font(.title2)
                .frame(width: 57, height: 57)
                .background(Color("PreviewGreen"))
        }
        .clipShape(Circle())
        .buttonStyle(PlainButtonStyle())
    }
    
    fileprivate func listaInstrucoes() -> some View {
        return HStack {
            ForEach(intrucoes, id: \.self) { instrucao in
                ConditionView(amount: 0, image: instrucao.getImage())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .topLeading) {
                Image(systemName: "speaker.wave.3.fill")
                    .font(.title2)
                    .offset(x: 22, y: 6)
                    .zIndex(10)
                
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Text(hora)
                            .font(.headline)
                            .padding(8)
                        
                        VStack(spacing: 0) {
                            VStack(spacing: 18) {
                                detalhesRemedio()
                                
                                if !intrucoes.isEmpty {
                                    listaInstrucoes()
                                }
                            }
                            .padding(13)
                        }
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                    .background(Color("PreviewGreen"))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
                .cornerRadius(20, corners: [.bottomLeft,.bottomRight])
            }
            .onTapGesture {
                speechManager.speak(text: "Achou o remédio \(nome)! O horário de tomar esse remédio é \(hora). Você pode marcar como tomado apertando o cheque ao lado.")
            }
            
            botaoConfirmar()
            .offset(x: 17, y: 112)
        }
        .padding(.leading, 14)
        .padding(.trailing, 20)
        .shadow(color: .black.opacity(0.1), radius: 17, x: 0, y: 8)
    }
}

struct ScannerCheckModalView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerCheckModalView(
            hora: "10:00",
            nome: "Dipirona",
            intrucoes: [
                .jejum,
                .agua,
                .aoAcordar,
                .bebidaAlcoolica
            ],
            posologia: "200mg",
            scannerButtonEnabled: false
        )
    }
}
