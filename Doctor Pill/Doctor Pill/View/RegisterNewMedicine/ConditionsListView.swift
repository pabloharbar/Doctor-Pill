//
//  ConditionsListView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 16/09/21.
//

import SwiftUI

struct ConditionsListView: View {
    @EnvironmentObject var registerManager: RegisterManager
    
    var body: some View {
        VStack {
            ForEach(Instrucoes.allCases, id: \.self) { condition in
                Button(action: {
                    registerManager.manageConditionList(condition: condition)
                }, label: {
                    HStack {
                        condition.getImage()
                        Text(condition.rawValue)
                        Spacer()
                        if registerManager.instrucoes
                            .contains(condition) {
                            Image(systemName: "checkmark")
                                .font(.headline)
                                .foregroundColor(Color("CheckmarkRed"))
                        }
                    }
                    .padding(.horizontal)
                })
                .buttonStyle(PlainButtonStyle())
                Divider()
            }
        }
    }
}

struct ConditionsListView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsListView()
            .environmentObject(RegisterManager())
    }
}
