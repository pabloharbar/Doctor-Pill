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
    
//    Formulário parte 2
    @Published var quantidade: Int
    @Published var vezesAoDia: Int
    
//    Formulario parte 4
    @Published var notas: String
    
    
    
    init() {
        self.nome = ""
        self.progressState = 1
        self.posologia = ""
        self.notas = ""
        self.quantidade = 1
        self.vezesAoDia = 1
    }
    
    let conditions = ["Em jejum", "Antes da refeição", "Durante a refeição", "Depois da refeição", "Ingerir com água quente", "Ingerir com água", "Colocar na água (efervescente)", "Não Ingerir bebidas alcoóicas", "Sublingual", "Inalação", "Logo ao acordar", "Antes de dormir"]
    
    func getImageByCondition() -> some View {
        return AnyView(Image(systemName: "xmark"))
    }
    }
