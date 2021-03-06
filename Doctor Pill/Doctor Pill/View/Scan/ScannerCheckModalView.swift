//
//  ScannerCheckModalView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 13/09/21.
//

import SwiftUI

struct ScannerCheckModalView: View {
    var remedio: Remedio
    var hora: Date
    let scannerButtonEnabled: Bool
    var onCheck: () -> Void = {}
    @EnvironmentObject var feedManager: FeedManager
    
    var speechManager = SpeechManager()
    
    func getHourString(_ date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        return "\(hour):\(minute)"
    }
    
    fileprivate func detalhesRemedio() -> some View {
        return HStack(spacing: 12) {
            Circle().frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4) {
                Text(remedio.nome)
                    .font(.title2)
                Text(remedio.posologia)
                    .font(.callout)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom,14)
    }
    
    fileprivate func onClick() {
        feedManager.medicineOnClick()
        onCheck()
//        feedManager.takeMedicine(remedio, expectedDate: Date())
    }
    
    fileprivate func botaoConfirmar() -> some View {
        return Button(action: onClick) {
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
            ForEach(remedio.instrucoes, id: \.self) { instrucao in
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
                        Text(getHourString(hora))
                            .font(.headline)
                            .padding(8)
                        
                        VStack(spacing: 0) {
                            VStack(spacing: 18) {
                                detalhesRemedio()
                                
                                if !remedio.instrucoes.isEmpty {
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
                speechManager.speak(text: "Achou o rem??dio \(remedio.nome)! O hor??rio de tomar esse rem??dio ?? \(getHourString(hora)). Voc?? pode marcar como tomado apertando o cheque ao lado.")
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
            remedio: Remedio(nome: "Flancox", posologia: "500mg", quantidade: 4, tipo: .comprimido, formato: .capsula, vezesAoDia: 3, continuidade: (duracao: 4, frequencia: .dias), horarios: [Date()], instrucoes: [.agua, .aoAcordar], notas: "Super teste para m??dicos e suas observa????es muito ??teis para tomar o rem??dio"),
            hora: Date(),
            scannerButtonEnabled: false
        )
    }
}
