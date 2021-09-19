//
//  DiaManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import SwiftUI



class DiaManager: ObservableObject {
//    @AppStorage("remediosTomados") var remediosTomados: [Tratamento: [(Remedio,Date)]]
//    @Published var remediosTomados: [Tratamento: [(Remedio,Date)]]
    @Published var remediosTomados: [Remedio: Date]
    let data = UserDefaultsWrapper()

    init() {
        //Pega do UserDefaults
        self.remediosTomados = [:]
    }
}

