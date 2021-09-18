//
//  RegisterThirdPage.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 17/09/21.
//

import SwiftUI

struct RegisterThirdPage: View {
    @EnvironmentObject var registerManager: RegisterManager
    
    var body: some View {
        VStack {
            HStack {
                Text("HORÁRIOS")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .padding([.leading,.top])
                Spacer()
            }
            Divider()
            List {
                ForEach(registerManager.horarios.indices, id: \.self) { i in
                    HStack {
                        Text("\(Int(registerManager.quantidade)) comprimido" + (registerManager.quantidade >= 1 ? " às" : "s às"))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        Spacer()
                        DatePicker("Pick a date", selection: $registerManager.horarios[i], displayedComponents: .hourAndMinute)
                            .datePickerStyle(GraphicalDatePickerStyle())
                           
                    }
                }
            }
        }
    }
}

struct RegisterThirdPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterThirdPage()
            .environmentObject(RegisterManager())
    }
}
