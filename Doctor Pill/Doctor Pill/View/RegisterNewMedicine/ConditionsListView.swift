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
        List {
            ForEach(Instrucoes.allCases, id: \.self) { condition in
                Button(action: {
                    
                }, label: {
                    HStack {
                        condition.getImage()
                        Text(condition.rawValue)
                    }
                })
                .buttonStyle(PlainButtonStyle())
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
