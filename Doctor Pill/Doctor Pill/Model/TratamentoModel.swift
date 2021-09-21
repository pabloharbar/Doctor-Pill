//
//  TratamentoModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation

struct Tratamento: Equatable, Hashable, Codable {
    
    var remedios: [Remedio]
    let duracaoEmDias: Int
    let proposito: String
    let id: UUID
    
    init(remedios: [Remedio], proposito: String, duracaoEmDias: Int = 0,  id: UUID = UUID()) {
        self.remedios = remedios
        self.proposito = proposito
        self.duracaoEmDias = duracaoEmDias
        self.id = id
    }
    
    static func == (lhs: Tratamento, rhs: Tratamento) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func contemRemedio(_ remedio: Remedio) -> Bool {
        for remedioTratamento in remedios {
            if remedioTratamento == remedio {
                return true
            }
        }

        return false
    }
    
    mutating func adicionarRemedio(_ remedio: Remedio) {
        remedios.append(remedio)
    }
}
