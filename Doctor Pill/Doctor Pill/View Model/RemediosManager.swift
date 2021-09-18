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
        self.remedios = []
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
    }
    
    func removerRemedio(_ remedio: Remedio) {
        remedios.removeAll { remedioLista in
            return remedio.id == remedioLista.id
        }
    }
    
    func remediosHojePorTurno() -> [PeriodosDoDia: [(remedio: Remedio, horario: Date)]] {
        var manha: [(Remedio, Date)] = []
        var tarde: [(Remedio, Date)] = []
        var noite: [(Remedio, Date)] = []
        
        for remedio in remedios {
            for horario in remedio.horarios {
                let calendar = Calendar.current
                let componentesHorario = Calendar.current.dateComponents([.hour, .minute], from: horario)
                
                let componentesManha = DateComponents(hour: 5, minute: 0)
                let componentesTarde = DateComponents(hour: 12, minute: 0)
                let componentesNoite = DateComponents(hour: 18, minute: 0)
                let horaManha = calendar.date(from: componentesManha)!
                let horaTarde = calendar.date(from: componentesTarde)!
                let horaNoite = calendar.date(from: componentesNoite)!
                let horarioBase = calendar.date(from: componentesHorario)!
                
                print(horario)
                print(horaManha)
                print(horaTarde)
                print(horaNoite)
                
                if horarioBase >= horaManha && horarioBase < horaTarde {
                    // Horário é de manhã
                    manha.append((remedio, horario))
                } else if horarioBase >= horaTarde && horarioBase < horaNoite {
                    // Horário é de tarde
                    tarde.append((remedio, horario))
                } else {
                    // Horário é de noite
                    noite.append((remedio, horario))
                }
            }
        }
        
        return [
            .manha: manha,
            .tarde: tarde,
            .noite: noite
        ]
    }
}
