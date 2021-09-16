//
//  RemedioModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import UIKit

enum TipoRemedio: Int, Codable {
    case pastilha
    case comprimido
}

enum Instrucoes: Int, Codable {
    case comerAntes
    case jejum
    case naoIngerirAlcool
}

enum FormatoRemedio: Int, Codable {
    case redondo
    case quadrado
    case piramidal
    case capsula
}

enum FrequenciaRemedo: String, Codable {
    case dias
    case semanas
}

struct Remedio: Equatable, Codable {
    let id: UUID
    let nome: String
    let posologia: String
    let quantidade: Float
    let tipo: TipoRemedio
    let formato: FormatoRemedio
    let vezesAoDia: Int
    let continuidadeDuracao: Int?
    let continuidadeFrequencia: FrequenciaRemedo?
    var horarios: [Date]
    let instrucoes: [Instrucoes]
    let notas: String
    //    let foto: Data?
    
    init(nome: String, posologia: String, quantidade: Float, tipo: TipoRemedio, formato: FormatoRemedio, vezesAoDia: Int, continuidade: (duracao: Int, frequencia: FrequenciaRemedo)?, horarios: [Date], instrucoes: [Instrucoes], notas: String, id: UUID = UUID()) {
        self.id = id
        self.nome = nome
        self.posologia = posologia
        self.quantidade = quantidade
        self.tipo = tipo
        self.formato = formato
        self.vezesAoDia = vezesAoDia
        self.continuidadeDuracao = continuidade?.duracao
        self.continuidadeFrequencia = continuidade?.frequencia
        self.horarios = horarios
        self.instrucoes = instrucoes
        self.notas = notas
//        self.foto = foto?.pngData()
    }
    
    /*static func == (lhs: Remedio, rhs: Remedio) -> Bool {
        return lhs.nome == rhs.nome &&
            lhs.posologia == rhs.posologia &&
            lhs.quantidade == rhs.quantidade &&
            lhs.tipo == rhs.tipo &&
            lhs.formato == rhs.formato &&
            lhs.vezesAoDia == rhs.vezesAoDia &&
            lhs.continuidade?.duracao == rhs.continuidade?.duracao &&
            lhs.continuidade?.frequencia == rhs.continuidade?.frequencia &&
            lhs.horarios == rhs.horarios &&
            lhs.instrucoes == rhs.instrucoes &&
            lhs.notas == rhs.notas
    }*/
    
    static func == (lhs: Remedio, rhs: Remedio) -> Bool {
        return lhs.id == rhs.id
    }
}
