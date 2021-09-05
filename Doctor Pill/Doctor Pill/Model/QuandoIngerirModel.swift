//
//  QuandoIngerirModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation

enum DiasDaSemana: CaseIterable {
    case segunda
    case terca
    case quarta
    case quinta
    case sexta
    case sabado
    case domingo
}

struct QuandoIngerirModel {
    let horarioReferencia: DateComponents
    let periodicidade: Int
    let diasDaSemana: [DiasDaSemana]
    
    init(hora: Int, minutos: Int, periodicidade: Int = 24, diasDaSemana: [DiasDaSemana]) {
        self.horarioReferencia = DateComponents(hour: hora, minute: minutos)
        self.periodicidade = periodicidade
        self.diasDaSemana = diasDaSemana
    }
}
