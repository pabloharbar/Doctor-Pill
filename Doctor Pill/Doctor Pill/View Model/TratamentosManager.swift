//
//  TratamentosManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import SwiftUI

class TratamentosManager: ObservableObject {
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
    
    static let formatosPadroes = [
        FormatosPadroes(name: "Comprimido", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Injeção", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Envelope", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Pomada", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Gotas", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Xarope", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Comprimido", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Comprimido", image: Image(systemName: "pills")),
        FormatosPadroes(name: "Comprimido", image: Image(systemName: "pills")),
    ]

}
