//
//  ListInputView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 16/09/21.
//

import SwiftUI

struct ListInputView: View {
    @EnvironmentObject var registerManager: RegisterManager
    var body: some View {
        createListInput(registerManager: registerManager)
    }
    var state = 4
    fileprivate func createListInput(registerManager: RegisterManager) -> some View {
        
//        switch registerManager.progressState {
        switch state {
        case 1:
            return AnyView(VStack {
                HStack {
                    Text("INFORMAÇÕES")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .padding([.leading,.top])
                    Spacer()
                }
                Divider()
            
                List {
                    HStack {
                        Text("Adicionar foto")
                            .foregroundColor(.primary)
                        Spacer()
                        Text("Galeria")
                            .foregroundColor(.primary.opacity(0.6))
                    }
                    ListTextField(label: "Nome", text: $registerManager.nome)
                    ListTextField(label: "Posologia", text: $registerManager.posologia)
                }
            })
            
        case 2:
            return AnyView(VStack {
                HStack {
                    Text("QUANTIDADE")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .padding([.leading,.top])
                    Spacer()
                }
                Divider()
                Divider()
                List {
                    
                    ListTextField(label: "Nome", text: $registerManager.nome)
                    ListTextField(label: "Posologia", text: $registerManager.nome)
                }
            })
            
        case 3:
            return AnyView(VStack {
                HStack {
                    Text("HORÁRIOS")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .padding([.leading,.top])
                    Spacer()
                }
                Divider()
                List {
                    ListTextField(label: "Nome", text: $registerManager.nome)
                    ListTextField(label: "Posologia", text: $registerManager.nome)
                }
            })
            
        case 4:
            return AnyView(VStack {
                HStack {
                    Text("NOTAS")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .padding([.leading,.top])
                    Spacer()
                }
                Divider()
                TextField("Notas do médico", text: $registerManager.notas)
                    .padding()
                Divider()
                HStack {
                    Text("CONDIÇÕES")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .padding([.leading,.top])
                    Spacer()
                }
                Divider()
                ConditionsListView()
            })
            
        default:
            return AnyView(VStack {
                HStack {
                    Text("INFORMAÇÕES")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .padding([.leading,.top])
                    Spacer()
                }
                Divider()
                List {
                    ListTextField(label: "Nome", text: $registerManager.nome)
                    ListTextField(label: "Posologia", text: $registerManager.nome)
                }
            })
        }
    }
}

struct ListInputView_Previews: PreviewProvider {
    static var previews: some View {
        ListInputView()
            .environmentObject(RegisterManager())
    }
}
