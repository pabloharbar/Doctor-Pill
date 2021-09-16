//
//  FeedManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 15/09/21.
//

import Foundation
import SwiftUI

final class FeedManager: ObservableObject {
    @Published var daySelected: DiasDaSemana
    
    let now = Date(timeIntervalSinceNow: 0)
    let calendar = Calendar.current
    
    init() {
        self.daySelected = DiasDaSemana.init(rawValue: calendar.component(.weekday, from: now) - 1)! //enum começa em 0
    }
    
    func createDateLabel() -> String {
        var offset = 0
        let currentDayIsSelected = daySelected.rawValue + 1 == calendar.component(.weekday, from: now)
        
        if  !currentDayIsSelected {
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
}
