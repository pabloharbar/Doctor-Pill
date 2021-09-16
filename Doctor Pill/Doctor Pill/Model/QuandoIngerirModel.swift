//
//  QuandoIngerirModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation

enum DiasDaSemana: Int, CaseIterable, Codable, Hashable {
    case domingo
    case segunda
    case terca
    case quarta
    case quinta
    case sexta
    case sabado
}

struct QuandoIngerirModel: Equatable, Codable {
    let horarioReferencia: DateComponents
    let periodicidade: Int
    let diasDaSemana: [DiasDaSemana]
    
    init(hora: Int, minutos: Int, periodicidade: Int = 24, diasDaSemana: [DiasDaSemana]) {
        self.horarioReferencia = DateComponents(hour: hora, minute: minutos)
        self.periodicidade = periodicidade
        self.diasDaSemana = diasDaSemana
    }

    static func == (lhs: QuandoIngerirModel, rhs: QuandoIngerirModel) -> Bool {
        return lhs.horarioReferencia == rhs.horarioReferencia &&
            lhs.periodicidade == rhs.periodicidade &&
            lhs.diasDaSemana == rhs.diasDaSemana
    }
}
