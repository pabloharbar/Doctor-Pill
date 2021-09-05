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
    
    func adicionarTratamento(tratamento: Tratamento) {
        tratamentos.append(tratamento)
    }
    
    func removerTratamentos(tratamento: Tratamento) {
        tratamentos.removeAll(where: { tratamentoLista in
            return tratamento.id == tratamentoLista.id
        })
    }
}
