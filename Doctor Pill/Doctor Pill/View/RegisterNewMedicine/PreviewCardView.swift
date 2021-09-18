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
    var hora: String
    var nome: String
    var intrucoes: [Instrucoes]
    var posologia: String
    var notas: String
    let scannerButtonEnabled: Bool
    @EnvironmentObject var feedManager: FeedManager
    
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
        .padding(.bottom, (notas.isEmpty && intrucoes.isEmpty) ? 120 : 14)
    }
    
    fileprivate func botaoScanner() -> some View {
        return VStack(spacing: 0) {
            CustomDivider()
            
            Button(action: {
                if scannerButtonEnabled {
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
            
            Text(notas)
                .font(.body)
        }
        .frame(maxWidth: .infinity)
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
                                
                                if !notas.isEmpty {
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
                /* TODO: Siri falar informações do card */
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
            hora: "10:00",
            nome: "Dipirona",
            intrucoes: [
                .jejum,
                .agua,
                .aoAcordar,
                .bebidaAlcoolica
            ],
            posologia: "200mg",
            notas: "Lorem ipsum dolor sit amet, consectetur adi",
            scannerButtonEnabled: false
        )
    }
}
