//
//  RegisterFirstPage.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 17/09/21.
//

import SwiftUI

struct RegisterFirstPage: View {
    @EnvironmentObject var registerManager: RegisterManager

    var body: some View {
        VStack {
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
        }
    }
}

struct RegisterFirstPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFirstPage()
            .environmentObject(RegisterManager())
    }
}
