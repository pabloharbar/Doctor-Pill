//
//  FeedManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 15/09/21.
//

import Foundation
import SwiftUI

struct TakenDate: Codable, Equatable {
    let expectedDate: Date
    var takenDate: Date?
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.expectedDate == rhs.expectedDate
    }
}

final class FeedManager: ObservableObject {
    @Published var daySelected: DiasDaSemana
    @Published var scannerCardShowing: Bool

    @Published var remediosTomados: [Date: [Remedio: [TakenDate]]]
    
    let now = Date()
    
    init() {
        self.daySelected = DiasDaSemana.init(rawValue: Calendar.current.component(.weekday, from: now) - 1)! //enum começa em 0
        self.scannerCardShowing = false
        self.remediosTomados = UserDefaultsWrapper.fetchRemediosTomados() ?? [Date: [Remedio: [TakenDate]]]()
    }
    
    func createDateLabel() -> String {
        let calendar = Calendar.current
        var offset = 0
        let currentDayIsSelected = daySelected.rawValue + 1 == calendar.component(.weekday, from: now)
        
        if !currentDayIsSelected {
            offset = daySelected.rawValue + 1 - calendar.component(.weekday, from: now)
        }
        
        let selectedDate = Date(timeInterval: TimeInterval(86400 * offset), since: now)
        
        var text = currentDayIsSelected ? "Hoje, " : ""
            text += "\(calendar.component(.day, from: selectedDate))" + " de "
        
        let month = (calendar.component(.month, from: selectedDate))
        
        switch month {
        case 1:
            text += "Janeiro"
        case 2:
            text += "Fevereiro"
        case 3:
            text += "Março"
        case 4:
            text += "Abril"
        case 5:
            text += "Maio"
        case 6:
            text += "Junho"
        case 7:
            text += "Julho"
        case 8:
            text += "Agosto"
        case 9:
            text += "Setembro"
        case 10:
            text += "Outubro"
        case 11:
            text += "Novembro"
        case 12:
            text += "Dezembro"
        default:
            break
        }
        return text
    }
    
    func loadMedicines(_ medicines: [Remedio]) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        if !remediosTomados.keys.contains(today) {
            remediosTomados[today] = [:]
        }
        for medicine in medicines {
            if remediosTomados[today]![medicine] == nil {
                remediosTomados[today]![medicine] = []
                for horario in medicine.horarios {
                    remediosTomados[today]![medicine]?.append(TakenDate(expectedDate: horario, takenDate: nil))
                }
            }
        }
        print("FeedManager: Medicines loaded!")
    }
    
    func takeMedicine(_ medicine: Remedio, expectedDate: Date) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let index = remediosTomados[today]![medicine]!.firstIndex() { takenDate in
            takenDate.expectedDate == expectedDate
        }!
        remediosTomados[today]![medicine]![index].takenDate = Date()
//            remediosTomados[today]![medicine]!.append(TakenDate(expectedDate: expectedDate, takenDate: Date()))
        print(remediosTomados[today]![medicine]!)
        UserDefaultsWrapper.setRemediosTomados(model: remediosTomados)
    }
    
    func remediosHojePorTurno() -> [PeriodosDoDia: [(remedio: Remedio, horario: TakenDate)]] {
        print("FeedManager: remediosHojePorTurno")
        var manha: [(Remedio, TakenDate)] = []
        var tarde: [(Remedio, TakenDate)] = []
        var noite: [(Remedio, TakenDate)] = []
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let todayMedicines = remediosTomados[today]!.keys
        
        for remedio in todayMedicines {
            for horario in remediosTomados[today]![remedio]! {
                let calendar = Calendar.current
                let componentesHorario = Calendar.current.dateComponents([.hour, .minute], from: horario.expectedDate)
                
                let componentesManha = DateComponents(hour: 5, minute: 0)
                let componentesTarde = DateComponents(hour: 12, minute: 0)
                let componentesNoite = DateComponents(hour: 18, minute: 0)
                let horaManha = calendar.date(from: componentesManha)!
                let horaTarde = calendar.date(from: componentesTarde)!
                let horaNoite = calendar.date(from: componentesNoite)!
                let horarioBase = calendar.date(from: componentesHorario)!
                
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
        print(manha)
        print(tarde)
        print(noite)
        
        return [
            .manha: manha,
            .tarde: tarde,
            .noite: noite
        ]
    }
}
