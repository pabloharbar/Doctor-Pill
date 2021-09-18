//
//  ListInputView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 16/09/21.
//

import SwiftUI

struct ListInputView: View {
    @EnvironmentObject var registerManager: RegisterManager
    
    fileprivate func defaultPage() -> some View {
        return VStack {
            HStack {
                Text("Passou da página certa")
                    .font(.title)
                    .textCase(.uppercase)
                    .padding()
            }
        }
    }
    
    var body: some View {
        VStack {
            switch registerManager.progressState {
            case 1:
                RegisterFirstPage()
            case 2:
                RegisterSecondPage()
            case 3:
                RegisterThirdPage()
            case 4:
                RegisterFuorthPage()
            default:
                defaultPage()
            }
        }
        .background(Color.white)
    }
}

struct ListInputView_Previews: PreviewProvider {
    static var previews: some View {
        ListInputView()
            .environmentObject(RegisterManager())
            .environment(\.locale, .init(identifier: "br"))
    }
}
