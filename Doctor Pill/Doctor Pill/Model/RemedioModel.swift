//
//  RemedioModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import UIKit

enum Formato {
    case pastilha
    case comprimido
}

enum Instrucoes {
    case comerAntes
    case jejum
    case naoIngerirAlcool
}

struct Remedio: Equatable {
    let nome: String
    let quandoIngerir: QuandoIngerirModel
    let foto: UIImage?
    let dosagem: Int
    let formato: Formato
    let instrucoes: [Instrucoes]
    
    init(nome: String, quandoIngerir: QuandoIngerirModel, foto: UIImage?, dosagem: Int, formato: Formato, instrucoes: [Instrucoes]) {
        self.nome = nome
        self.quandoIngerir = quandoIngerir
        self.dosagem = dosagem
        self.formato = formato
        self.instrucoes = instrucoes
        self.foto = foto
        
    }
    
    static func == (lhs: Remedio, rhs: Remedio) -> Bool {
        return lhs.nome == rhs.nome &&
            lhs.quandoIngerir == rhs.quandoIngerir &&
            lhs.dosagem == rhs.dosagem &&
            lhs.instrucoes == rhs.instrucoes
    }
}
