//
//  DiaManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import SwiftUI



class DiaManager: ObservableObject {
//    @AppStorage("remediosTomados") var remediosTomados: [Tratamento: [(Remedio,DateComponents)]]
//    @Published var remediosTomados: [Tratamento: [(Remedio,DateComponents)]]
    @Published var remediosTomados: [Remedio: DateComponents]
    let data = UserDefaultsWrapper()

    init() {
        //Pega do UserDefaults
        self.remediosTomados = [:]
    }
}

