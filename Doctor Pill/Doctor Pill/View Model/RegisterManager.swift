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
//    Formulario parte 1
    @Published var nome: String
    @Published var posologia: String
    
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
        self.quantidade = 1
        self.tipo = .comprimido
        self.vezesAoDia = 1
        self.formato = .redondo
        self.continuidade = nil
        self.horarios = []
        self.notas = ""
        self.instrucoes = []
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
    
    let conditions = ["Em jejum", "Antes da refeição", "Durante a refeição", "Depois da refeição", "Ingerir com água quente", "Ingerir com água", "Colocar na água (efervescente)", "Não Ingerir bebidas alcoóicas", "Sublingual", "Inalação", "Logo ao acordar", "Antes de dormir"]
    
    func getImageByCondition() -> some View {
        return AnyView(Image(systemName: "xmark"))
    }
    }
