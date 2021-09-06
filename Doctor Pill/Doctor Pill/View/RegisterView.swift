//
//  RegisterView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI

struct RegisterView: View {
//    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    //var state apenas para teste \/
    @State var nomeDoRemedio = ""
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancelar")
                            .foregroundColor(.red)
                    })
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("Novo Remédio")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding()
            }
            .padding(.horizontal)
            Divider()
            Text("Insira o nome do remédio:")
                .font(.callout)
            TextField("Nome do remédio", text: $nomeDoRemedio)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Salvar")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(20)
            })
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
