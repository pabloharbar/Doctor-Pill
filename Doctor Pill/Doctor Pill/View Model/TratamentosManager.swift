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
    
    static let instrucoesPadrao = [
        InstrucoesPadrao(name: "Em jejum", image: Image("instrucao_jejum")),
        InstrucoesPadrao(name: "Antes da refeição", image: Image("instrucao_antes_refeicao")),
        InstrucoesPadrao(name: "Durante a refeição", image: Image("instrucao_durante_refeicao")),
        InstrucoesPadrao(name: "Depois da refeição", image: Image("instrucao_depois_refeicao")),
        InstrucoesPadrao(name: "Ingerir com água quente", image: Image("instrucao_agua_quente")),
        InstrucoesPadrao(name: "Ingerir com água", image: Image("instrucao_agua")),
        InstrucoesPadrao(name: "Colocar na água (efervescente)", image: Image("instrucao_efervescente")),
        InstrucoesPadrao(name: "Não ingerir bebidas alcoólicas", image: Image("instrucao_proibido_bebida_alcoolica")),
        InstrucoesPadrao(name: "Sublingual", image: Image("instrucao_sublingual")),
        InstrucoesPadrao(name: "Inalação", image: Image("instrucao_inacao")),
        InstrucoesPadrao(name: "Logo ao acordar", image: Image("instrucao_ao_acordar_mini")),
        InstrucoesPadrao(name: "Antes de dormir", image: Image("instrucao_antes_dormir_mini")),
    ]
}
