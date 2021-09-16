//
//  ListInputView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 16/09/21.
//

import SwiftUI

struct ListInputView: View {
    @EnvironmentObject var registerManager: RegisterManager

    @State var minutes: Date = Date()
    
    var body: some View {
        createListInput()
    }
    
    fileprivate func createListInput() -> some View {

        switch registerManager.progressState {
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
                HStack(spacing: 0) {
                    Picker(selection: $registerManager.quantidade, label: Text("Quantidade"), content: {
                        ForEach(1...10, id: \.self) { i in
                            Text("\(i)")
                                .tag(registerManager.tipo == .meioComprimido ? Float(i/2) : Float(i))
                        }
                    })
                    .frame(width: 40, height: 50)
                    .clipped()
                    
                    Picker(selection: $registerManager.tipo, label: Text("Tipo"), content: {
                        ForEach(TipoRemedio.allCases, id:\.self) { formato in
                            Text(formato.rawValue)
                            
                        }
                    })
                    .frame(width: 150, height: 50, alignment: .center)
                    .clipped()
                    
                    Text(", ")
                    
                    Picker(selection: $registerManager.vezesAoDia, label: Text("Tipo"), content: {
                        ForEach(1...5, id:\.self) { i in
                            Text("\(i)")
                                .tag(i)
                            
                        }
                    })
                    .frame(width: 40, height: 50, alignment: .center)
                    .clipped()
                    
                    Text(registerManager.vezesAoDia > 1 ? " vezes ao dia" : " vez ao dia")
                }
                .padding()
                Divider()
                HStack {
                    Text("Formato")
                    Spacer()
                    Picker(selection: $registerManager.formato, label: Text("Formato"), content: {
                        ForEach(FormatoRemedio.allCases, id: \.self) { formato in
                            Text("\(formato.rawValue)")
                                .tag(formato)
                        }
                    })
                    .frame(width: 100, height: 50, alignment: .center)
                    .clipped()
                }
                .padding(.horizontal)
                Divider()
                Toggle(isOn: $registerManager.usoContinuo, label: {
                    Text("Contínuo")
                })
                .padding(.horizontal)
                .toggleStyle(SwitchToggleStyle(tint: Color("DarkNight")))
                Divider()
                HStack {
                    Text("Não Contínuo")
                    Spacer()
                    Text("por")
                    Picker(selection: $registerManager.duracao, label: Text("Duração"), content: {
                        ForEach(1...100, id: \.self) { i in
                            Text("\(i)")
                                .tag(i)
                        }
                    })
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    Picker(selection: $registerManager.frequencia, label: Text("Frequência"), content: {
                        ForEach(FrequenciaRemedo.allCases, id: \.self) { i in
                            Text(i.rawValue)
                                .tag(i)
                        }
                    })
                    .frame(width: 120, height: 50, alignment: .center)
                    .clipped()
                }
                .padding(.horizontal)
                Divider()
            })
            
        case 3:
//            let hours = (0...24)
//            let minutes = (0...59)
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
                    ForEach((1...registerManager.vezesAoDia), id: \.self) { count in
                        HStack {
                            Text("\(Int(registerManager.quantidade)) comprimido" + (registerManager.quantidade >= 1 ? " às" : "s às"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            Spacer()
                            DatePicker("Pick a date", selection: $minutes, displayedComponents: .hourAndMinute)
                                .datePickerStyle(GraphicalDatePickerStyle())
                               
                        }
                    }
                }
//                .onAppear {
//                    UITableView.appearance().isScrollEnabled = false
//                }
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
            .environment(\.locale, .init(identifier: "br"))
    }
}
