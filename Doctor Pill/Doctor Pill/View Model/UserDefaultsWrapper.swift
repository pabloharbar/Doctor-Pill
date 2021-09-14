//
//  UserDefaultsWrapper.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 09/09/21.
//

import Foundation

class UserDefaultsWrapper {
    static func setTratamento(model: Tratamento) {
        let data = try? JSONEncoder().encode(model)
        UserDefaults.standard.set(data, forKey: "tratamento")
    }
    
    static func setHistorico(model: RemediosTomados) {
        let data = try? JSONEncoder().encode(model)
        UserDefaults.standard.set(data, forKey: "remediosTomados")
    }
    
    static func fetchTratamento() -> Tratamento? {
        guard let data = UserDefaults.standard.data(forKey: "tratamento") else {
            return nil
        }
        
        let model = try? JSONDecoder().decode(Tratamento.self, from: data)
        return model
    }
    
    static func fetchHistorico() -> RemediosTomados? {
        guard let data = UserDefaults.standard.data(forKey: "remediosTomados") else {
            return nil
        }
        
        let model = try? JSONDecoder().decode(RemediosTomados.self, from: data)
        return model
    }
    
    static func clearData(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
