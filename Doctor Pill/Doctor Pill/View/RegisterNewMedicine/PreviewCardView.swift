//
//  PreviewCardView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 15/09/21.
//

import SwiftUI

struct CustomDivider: View {
    let color: Color = .black
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct PreviewCardView: View {
    var remedio: Remedio
    var hora: Date
//    var nome: String
//    var intrucoes: [Instrucoes]
//    var quantidade: Double
//    var tipo: TipoRemedio
//    var posologia: String
//    var notas: String
    let scannerButtonEnabled: Bool
    var onCheck: () -> Void = {}
    var speechManager = SpeechManager()
    @EnvironmentObject var feedManager: FeedManager
    
    func getHourString(_ date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        return "\(hour):\(minute)"
    }
    
    fileprivate func detalhesRemedio() -> some View {
        return HStack(spacing: 12) {
            Circle()
                .fill(Color.white)
                .frame(width: 50, height: 50)
                .overlay(Circle().stroke(lineWidth: 1))
            VStack(alignment: .leading, spacing: 4) {
                Text(remedio.nome)
                    .font(.title2)
                HStack {
                    Text("\(remedio.quantidade.formatNumber()) \(remedio.tipo.rawValue.lowercased())\(remedio.quantidade > 1 ? "s" : ""), \(remedio.posologia)")
                }
                .font(.callout)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom, (remedio.notas.isEmpty && remedio.instrucoes.isEmpty) ? 120 : 14)
    }
    
    fileprivate func botaoScanner() -> some View {
        return VStack(spacing: 0) {
            CustomDivider()
            
            Button(action: {
                if scannerButtonEnabled {
                    feedManager.copyMedicineToScan(remedio: remedio, hora: hora, onCheck: onCheck)
                    feedManager.scannerCardShowing = true
                }
            }) {
                HStack {
                    Image(systemName: "camera.fill")
                    Text("Escanear")
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .foregroundColor(.black)
            }
        }
        .background(Color.white)
        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
    
    fileprivate func notasMedico() -> some View {
        return VStack(alignment: .leading) {
            Text("Observações de médico.")
                .font(.footnote)
            
            Text(remedio.notas)
                .font(.body)
        }
        .frame(maxWidth: .infinity)
    }
    
    fileprivate func botaoConfirmar() -> some View {
        return Button(action: self.onCheck) {
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
                        Text(remedio.horarios.first != nil ? getHourString(hora) : "Horário")
                            .font(.headline)
                            .padding(8)
                        
                        VStack(spacing: 0) {
                            VStack(spacing: 18) {
                                detalhesRemedio()
                                
                                if !remedio.instrucoes.isEmpty {
                                    listaInstrucoes()
                                }
                                
                                if !remedio.notas.isEmpty {
                                    notasMedico()
                                }
                            }
                            .padding(13)
                        }
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                    .background(Color("PreviewGreen"))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                    botaoScanner()
                }
            }
            .onTapGesture {
                speechManager.speak(text: "Você deve tomar \(remedio.quantidade.formatNumber())  \(remedio.quantidade > 1 ? "\(remedio.tipo.rawValue)s" : "\(remedio.tipo.rawValue)") do remédio \(remedio.nome) às \(getHourString(hora)). Observações do médico: \(remedio.notas)")
            }
            
            botaoConfirmar()
            .offset(x: 17, y: 112)
        }
        .padding(.leading, 14)
        .padding(.trailing, 20)
        .shadow(color: .black.opacity(0.1), radius: 17, x: 0, y: 8)
    }
}

struct PreviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCardView(
            remedio: Remedio(nome: "Flancox", posologia: "500mg", quantidade: 4, tipo: .comprimido, formato: .capsula, vezesAoDia: 3, continuidade: (duracao: 4, frequencia: .dias), horarios: [Date()], instrucoes: [.agua, .aoAcordar], notas: "Super teste para médicos e suas observações muito úteis para tomar o remédio"),
            hora: Date(),
//            nome: "Dipirona",
//            intrucoes: [
//                .jejum,
//                .agua,
//                .aoAcordar,
//                .bebidaAlcoolica
//            ], quantidade: 1, tipo: .comprimido,
//            posologia: "200mg",
//            notas: "Lorem ipsum dolor sit amet, consectetur adi",
            scannerButtonEnabled: false
        )
    }
}
