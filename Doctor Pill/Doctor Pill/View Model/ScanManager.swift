//
//  ScanManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 17/09/21.
//

import Foundation

final class ScanManager: ObservableObject {
    @Published var scanState: ScanState
    @Published var recognizedText: String {
        didSet {
            if recognizedText.last == "©" || recognizedText.last == "℗" || recognizedText.last == "®" || recognizedText.last == "™" {
                let cleanText = recognizedText.dropLast()
                recognizedText = String(cleanText)
                
            }
        }
    }
//    @Published var hasFoundCorrect: Bool
    @Published var scannerCardShowing: Bool
    @Published var medicineName: String
    
    var remediosCadastrados: [Remedio]
    
    let apiWrapper = APIWrapper()
    
    init() {
        self.scanState = .notFound
        self.recognizedText = ""
//        self.hasFoundCorrect = false
        
        self.medicineName = ""
        self.scannerCardShowing = false
        self.remediosCadastrados = UserDefaultsWrapper.fetchRemedios() ?? []
    }
    
    func displayResult() {
        //Chamar a api
        apiWrapper.decodeSimilars(recognizedText: self.recognizedText) { similars in
            print(similars)
            if !similars.isEmpty {
                let remediosFiltrados = self.remediosCadastrados.filter { remedio in
                    return similars.contains(remedio.nome)
                }
                if remediosFiltrados.isEmpty {
                    self.scanState = .notRegistered
                } else {
                    self.scanState = .found
                }
                
                self.medicineName = similars.last!
            }
        }
    }
    
    func displaySpecificResult(nome: String) {
        //Chamar a api
        apiWrapper.decodeSimilars(recognizedText: self.recognizedText) { similars in
            print(similars)
            if !similars.isEmpty {
                //É o remedio certo
                if similars.contains(nome) {
//                    self.hasFoundCorrect = true
                    self.scanState = .found
                    self.medicineName = similars.last!
                    self.scannerCardShowing = true
                } else {
                    self.scanState = .notRegistered
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.scanState = .notFound
                    }
                }
            }
        }
    }
    
}
