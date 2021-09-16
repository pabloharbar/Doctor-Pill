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
    @State var nomeDoRemedio = ""
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancelar")
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
                
                
                
                
                
            }
            .padding(.top,50)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 208/255, green: 219/255, blue: 1), Color(red: 127/255, green: 155/255, blue: 251/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
            )
//            .cornerRadius(24)
            .cornerRadius(24, corners: [.bottomLeft,.bottomRight]) //Extension
            .ignoresSafeArea()
            
            Spacer()
            
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
            ProgressView(progressState: $registerManager.progressState)
                .padding()
            
            Button(action: {
                registerManager.progressState += 1
            }, label: {
                HStack {
                    Spacer()
                    Text("Próximo")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.purple)
                .cornerRadius(24)
            })
            .padding(.bottom,40)
            .padding(.horizontal,70)
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}