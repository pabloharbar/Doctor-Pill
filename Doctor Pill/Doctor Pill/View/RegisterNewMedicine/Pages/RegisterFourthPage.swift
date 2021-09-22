//
//  RegisterFourthPage.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 17/09/21.
//

import SwiftUI

struct RegisterFourthPage: View {
    @EnvironmentObject var registerManager: RegisterManager
    
    var body: some View {
        ScrollView {
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
        }
    }
}

struct RegisterFourthPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFourthPage()
            .environmentObject(RegisterManager())
    }
}
