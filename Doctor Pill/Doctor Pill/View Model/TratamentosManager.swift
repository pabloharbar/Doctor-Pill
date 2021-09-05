//
//  TratamentosManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import SwiftUI

class TratamentoManager: ObservableObject {
    @Published var tratamentos: [Tratamento]
    
    init() {
        //Pega do UserDefaults
        self.tratamentos = []
    }
    
    
}
