//
//  RemediosManager.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 17/09/21.
//

import Foundation
import SwiftUI

enum PeriodosDoDia {
    case manha
    case tarde
    case noite
}

class RemediosManager: ObservableObject {
    @Published var remedios: [Remedio]
    
    init() {
        //Pega do UserDefaults
        self.remedios = UserDefaultsWrapper.fetchRemedios() ?? []
    }
    
    static func fullState() -> RemediosManager {
        let manager = RemediosManager()
        
        let remedios = [
            Remedio(nome: "Flancox", posologia: "500mg", quantidade: 4, tipo: .comprimido, formato: .capsula, vezesAoDia: 3, continuidade: (duracao: 4, frequencia: .dias), horarios: [Date()], instrucoes: [.agua, .aoAcordar], notas: "Super teste para médicos e suas observações muito úteis para tomar o remédio")
        ]
        
        manager.remedios = remedios
        
        return manager
    }
    
    func adicionarRemedio(_ remedio: Remedio) {
        remedios.append(remedio)
        UserDefaultsWrapper.setRemedios(model: remedios)
    }
    
    func removerRemedio(_ remedio: Remedio) {
        remedios.removeAll { remedioLista in
            return remedio.id == remedioLista.id
        }
    }
}
