//
//  DoubleExtension.swift
//  Doctor Pill
//
//  Created by Thiago Medeiros on 17/09/21.
//

import Foundation

extension Double {
    func formatNumber() -> String {
        if self == Double(Int(self)) {
            return "\(Int(self))"
        }
        return String(format: "%.1f", self)
    }
}

extension Float {
    func formatNumber() -> String {
        if self == Float(Int(self)) {
            return "\(Int(self))"
        }
        return String(format: "%.1f", self)
    }
}
