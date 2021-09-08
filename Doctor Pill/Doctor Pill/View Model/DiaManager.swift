//
//  DiaManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import SwiftUI

class DiaManager: ObservableObject {
//    @Published @AppStorage("remediosTomados") var remediosTomados: [Tratamento: [(Remedio,DateComponents)]]
    @Published var remediosTomados: [Tratamento: [(Remedio,DateComponents)]]

    init() {
        //Pega do UserDefaults
        self.remediosTomados = [:]
    }
}

