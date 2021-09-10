//
//  RemedioModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import UIKit

enum Formato: Int, Codable {
    case pastilha
    case comprimido
}

enum Instrucoes: Int, Codable {
    case comerAntes
    case jejum
    case naoIngerirAlcool
}

struct Remedio: Equatable, Codable {
    let nome: String
    let quandoIngerir: QuandoIngerirModel
    let foto: Data?
    let dosagem: Int
    let formato: Formato
    let instrucoes: [Instrucoes]
    let id: UUID
    
    init(nome: String, quandoIngerir: QuandoIngerirModel, foto: UIImage?, dosagem: Int, formato: Formato, instrucoes: [Instrucoes], id: UUID = UUID()) {
        self.nome = nome
        self.quandoIngerir = quandoIngerir
        self.dosagem = dosagem
        self.formato = formato
        self.instrucoes = instrucoes
        self.foto = foto?.pngData()
        self.id = id
    }
    
    static func == (lhs: Remedio, rhs: Remedio) -> Bool {
        return lhs.nome == rhs.nome &&
            lhs.quandoIngerir == rhs.quandoIngerir &&
            lhs.dosagem == rhs.dosagem &&
            lhs.instrucoes == rhs.instrucoes
    }
}
