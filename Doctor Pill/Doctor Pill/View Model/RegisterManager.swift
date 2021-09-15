//
//  RegisterManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 15/09/21.
//

import Foundation

final class RegisterManager: ObservableObject {
    
    @Published var nome: String
    @Published var progressState: Int
    
    init() {
        self.nome = ""
        self.progressState = 1
    }
}
