//
//  TratamentoModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation

struct Tratamento: Equatable, Hashable {
    
    let remedios: [Remedio]
    let duracaoEmDias: Int
    let proposito: String
    let id = UUID()
    
    init(remedios: [Remedio], duracaoEmDias: Int = 0, proposito: String) {
        self.remedios = remedios
        self.duracaoEmDias = duracaoEmDias
        self.proposito = proposito
    }
    
    static func == (lhs: Tratamento, rhs: Tratamento) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
