//
//  APIResponseModel.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 09/09/21.
//

import Foundation

struct APIResponse: Decodable {
    let sent: String
    let name: String
    let active_principle: String
    let similars: [String]
}
