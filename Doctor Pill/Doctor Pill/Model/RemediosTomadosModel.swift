//
//  RemediosTomadosModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 09/09/21.
//

import Foundation

struct RemediosTomados: Codable {
    var ids: [UUID]
    var horarios: [DateComponents]
}
