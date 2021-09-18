//
//  RegisterSecondPage.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 17/09/21.
//

import SwiftUI

struct RegisterSecondPage: View {
    @EnvironmentObject var registerManager: RegisterManager
    
    var body: some View {
        VStack {
            HStack {
                Text("QUANTIDADE")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .padding([.leading,.top])
                Spacer()
            }
            Divider()
            HStack(spacing: 5) {
                Picker(selection: $registerManager.quantidade, label: Text("Quantidade"), content: {
                    ForEach(Array(stride(from: 0.5, through: 10, by: 0.5)), id: \.self) { num in
                        Text(num.formatNumber())
                            .tag(registerManager.tipo == .meioComprimido ? Float(num) / 2 : Float(num))
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
            if !registerManager.usoContinuo {
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
            }
        }
    }
}

struct RegisterSecondPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSecondPage()
            .environmentObject(RegisterManager())
    }
}
