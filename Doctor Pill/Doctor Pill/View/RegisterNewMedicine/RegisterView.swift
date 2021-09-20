//
//  RegisterView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI

struct RegisterView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var registerManager = RegisterManager()
    @EnvironmentObject var remediosManager: RemediosManager
    
    func getHourString(_ date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        return "\(hour):\(minute)"
    }
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            if registerManager.progressState == 1 {
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                registerManager.progressState -= 1
                            }
                        }, label: {
                            Text(registerManager.progressState == 1 ? "Cancelar" : "Voltar")
                                .foregroundColor(.black)
                        })
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Novo Remédio")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                }
                .padding(.horizontal)
                Spacer()
                
                if let horario = registerManager.horarios[0] {
                    PreviewCardView(hora: getHourString(horario), nome: registerManager.nome, intrucoes: registerManager.instrucoes, quantidade: registerManager.quantidade, tipo: registerManager.tipo, posologia: registerManager.posologia, notas: registerManager.notas, scannerButtonEnabled: false)
                } else {
                    PreviewCardView(hora: "Horário", nome: registerManager.nome, intrucoes: registerManager.instrucoes, quantidade: registerManager.quantidade, tipo: registerManager.tipo, posologia: registerManager.posologia, notas: registerManager.notas, scannerButtonEnabled: false)
                }
            }
            .padding(.bottom, 24)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 208/255, green: 219/255, blue: 1), Color(red: 127/255, green: 155/255, blue: 251/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .cornerRadius(24, corners: [.bottomLeft,.bottomRight])
                    .edgesIgnoringSafeArea(.top)
            )
            
            Spacer()
            
            ListInputView()
                .environmentObject(registerManager)

            ProgressView(progressState: $registerManager.progressState)
                .padding()
            
            Button(action: {
                if registerManager.progressState < 4 {
                    registerManager.progressState += 1
                } else {
                    let remedio = registerManager.criarRemedio()
                    remediosManager.adicionarRemedio(remedio)
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                HStack {
                    Spacer()
                    Text(registerManager.progressState == 4 ? "Adicionar" : "Próximo")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color("DarkNight"))
                .cornerRadius(24)
            }
            .padding(.bottom,40)
            .padding(.horizontal,70)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .ignoresSafeArea(.keyboard)
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(RemediosManager())
    }
}
