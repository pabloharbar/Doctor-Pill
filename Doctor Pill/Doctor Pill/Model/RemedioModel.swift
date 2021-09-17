//
//  RemedioModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 05/09/21.
//

import Foundation
import SwiftUI

enum TipoRemedio: String, Codable, CaseIterable {
    case comprimido = "Comprimido"
    case seringa = "Seringa"
    case meioComprimido = "Meio Comprimido"
    case envelope = "Envelope"
    case pomada = "Pomada"
    case shampoo = "Shampoo"
    case adesivo = "Adesivo"
    case locao = "Loção"
    case capsula = "Cápsula"
    case sabaoLiquido = "Sabão Líquido"
    case spray = "Spray"
    case sabaoBarra = "Sabão em Barra"
    case gotas = "Gotas"
    case xarope = "Xarope"
    
    func getImage() -> Image {
        switch self {
        case .comprimido:
            return Image("tipo_comprimido")
        case .seringa:
            return Image("tipo_seringa")
        case .meioComprimido:
            return Image("tipo_meio_comprimido")
        case .envelope:
            return Image("tipo_envelope")
        case .pomada:
            return Image("tipo_pomada")
        case .shampoo:
            return Image("tipo_shampoo")
        case .adesivo:
            return Image("tipo_adesivo")
        case .locao:
            return Image("tipo_locao")
        case .capsula:
            return Image("tipo_capsula")
        case .sabaoLiquido:
            return Image("tipo_sabao_liquido")
        case .spray:
            return Image("tipo_spray")
        case .sabaoBarra:
            return Image("tipo_sabao_barra")
        case .gotas:
            return Image("tipo_gotas")
        case .xarope:
            return Image("tipo_xarope")
        }
    }
}

enum Instrucoes: String, Codable, CaseIterable {
    case jejum = "Em jejum"
    case antesRefeicao = "Antes da refeição"
    case duranteRefeicao = "Durante a refeição"
    case depoisRefeicao = "Depois da refeição"
    case aguaQuente = "Ingerir com água quente"
    case agua = "Ingerir com água"
    case efervescente = "Colocar na água (efervescente)"
    case bebidaAlcoolica = "Não ingerir bebidas alcoólicas"
    case sublingual = "Sublingual"
    case inlacao = "Inalação"
    case aoAcordar = "Logo ao acordar"
    case antesDormir = "Antes de dormir"
    case jejumLiquido = "Em jejum de líquidos"
    
    func getImage() -> Image {
        switch self {
        case .jejum:
            return Image("instrucao_jejum")
        case .antesRefeicao:
            return Image("instrucao_antes_refeicao")
        case .duranteRefeicao:
            return Image("instrucao_durante_refeicao")
        case .depoisRefeicao:
            return Image("instrucao_depois_refeicao")
        case .aguaQuente:
            return Image("instrucao_agua_quente")
        case .agua:
            return Image("instrucao_agua")
        case .efervescente:
            return Image("instrucao_efervescente")
        case .bebidaAlcoolica:
            return Image("instrucao_proibido_bebida_alcoolica")
        case .sublingual:
            return Image("instrucao_sublingual")
        case .inlacao:
            return Image("instrucao_inacao")
        case .aoAcordar:
            return Image("instrucao_ao_acordar_mini")
        case .antesDormir:
            return Image("instrucao_antes_dormir_mini")
        case .jejumLiquido:
            return Image("instrucao_jejum_liquido")
        }
    }
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
