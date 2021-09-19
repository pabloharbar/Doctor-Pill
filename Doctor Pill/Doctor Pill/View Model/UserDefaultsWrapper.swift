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
    
    static func fetchTratamento() -> Tratamento? {
        guard let data = UserDefaults.standard.data(forKey: "tratamento") else {
            return nil
        }
        
        let model = try? JSONDecoder().decode(Tratamento.self, from: data)
        return model
    }
    
    static func setHistorico(model: RemediosTomados) {
        let data = try? JSONEncoder().encode(model)
        UserDefaults.standard.set(data, forKey: "historico")
    }
    
    static func fetchHistorico() -> RemediosTomados? {
        guard let data = UserDefaults.standard.data(forKey: "historico") else {
            return nil
        }
        
        let model = try? JSONDecoder().decode(RemediosTomados.self, from: data)
        return model
    }
    
    static func setRemedios(model: [Remedio]) {
        let data = try? JSONEncoder().encode(model)
        UserDefaults.standard.set(data, forKey: "remedios")
    }
    
    static func fetchRemedios() -> [Remedio]? {
        guard let data = UserDefaults.standard.data(forKey: "remedios") else {
            return nil
        }
        
        let model = try? JSONDecoder().decode([Remedio].self, from: data)
        return model
    }
    
    static func setRemediosTomados(model: [Date: [Remedio: [TakenDate]]]) {
        let data = try? JSONEncoder().encode(model)
        UserDefaults.standard.set(data, forKey: "remediosTomados")
    }

    static func fetchRemediosTomados() -> [Date: [Remedio: [TakenDate]]]? {
        guard let data = UserDefaults.standard.data(forKey: "remediosTomados") else {
            return nil
        }
        
        let model = try? JSONDecoder().decode([Date: [Remedio: [TakenDate]]].self, from: data)
        return model
    }
    
    static func clearData(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
