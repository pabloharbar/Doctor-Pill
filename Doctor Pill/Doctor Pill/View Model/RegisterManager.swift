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
    @Published var tratamento: Tratamento
    
    /* Informações da segunda página */
    @Published var quantidade: Float
    @Published var tipo: TipoRemedio
    @Published var vezesAoDia: Int
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
        self.tratamento = Tratamento(remedios: [], proposito: "")
        self.quantidade = 1.0
        self.tipo = .comprimido
        self.vezesAoDia = 1
        self.formato = .redondo
        self.continuidade = nil
        self.horarios = []
        self.notas = ""
        self.instrucoes = []
        
        self.usoContinuo = true
        self.duracao = 1
        self.frequencia = .dias
    }
    
    func salvarRemedio() {
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

        tratamento.adicionarRemedio(remedio)
    }
    
}
