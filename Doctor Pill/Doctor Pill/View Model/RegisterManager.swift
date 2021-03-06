//
//  RegisterManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 15/09/21.
//

import Foundation
import SwiftUI

final class RegisterManager: ObservableObject {
    @Published var progressState: Int
    
    /* Informações da primeira página */
//    @Published var foto: Image?
    @Published var nome: String
    @Published var posologia: String
//    @Published var tratamento: Tratamento
    
    /* Informações da segunda página */
    @Published var quantidade: Double
    @Published var tipo: TipoRemedio
    @Published var vezesAoDia: Int {
        didSet {
            if oldValue < vezesAoDia {
                for _ in oldValue..<vezesAoDia {
                    self.horarios.append(Date())
                }
            } else {
                for index in stride(from: oldValue - 1, through: vezesAoDia, by: -1) {
                    self.horarios.remove(at: index)
                }
            }
        }
    }
    @Published var formato: FormatoRemedio
    @Published var continuidade: (duracao: Int, frequencia: FrequenciaRemedo)?
    
    @Published var usoContinuo: Bool
    @Published var duracao: Int
    @Published var frequencia: FrequenciaRemedo
    
    /* Informações da terceira página */
    @Published var horarios: [Date]
    
    /* Informações da última página */
    @Published var notas: String
    @Published var instrucoes: [Instrucoes]
    
    init() {
        self.progressState = 1
        self.nome = ""
        self.posologia = ""
//        self.tratamento = Tratamento(remedios: [], proposito: "")
        self.quantidade = 1.0
        self.tipo = .comprimido
        self.vezesAoDia = 1
        self.formato = .redondo
        self.continuidade = nil
        self.horarios = [Date()]
        self.notas = ""
        self.instrucoes = []
        
        self.usoContinuo = true
        self.duracao = 1
        self.frequencia = .dias
    }
    
    func criarRemedio() -> Remedio {
        let remedio = Remedio(
            nome: nome,
            posologia: posologia,
            quantidade: quantidade,
            tipo: tipo,
            formato: formato,
            vezesAoDia: vezesAoDia,
            continuidade: continuidade,
            horarios: horarios,
            instrucoes: instrucoes,
            notas: notas
        )
        
        return remedio

//        tratamento.adicionarRemedio(remedio)
    }
    
    func manageConditionList(condition: Instrucoes) {
        if !self.instrucoes.contains(condition) {
            self.instrucoes.append(condition)
        } else {
            let index = self.instrucoes.firstIndex(of: condition)!
            self.instrucoes.remove(at: index)
        }
        
        
    }
    
}
