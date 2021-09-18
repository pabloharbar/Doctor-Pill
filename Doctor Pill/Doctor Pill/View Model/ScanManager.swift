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
        willSet {
            if recognizedText.last == "©" || recognizedText.last == "℗" || recognizedText.last == "®" || recognizedText.last == "™" {
                recognizedText.dropLast()
            }
        }
    }
    @Published var hasFoundCorrect: Bool
    
    let apiWrapper = APIWrapper()

    @Published var medicineName: String
    
    init() {
        self.scanState = .notFound
        self.recognizedText = ""
        self.hasFoundCorrect = false
        
        self.medicineName = ""
    }
    
    func displayResult() {
        //Chamar a api
        apiWrapper.decodeSimilars(recognizedText: self.recognizedText) { similars in
            print(similars)
            if !similars.isEmpty {
                //É o remedio certo
                self.hasFoundCorrect = true
                self.scanState = .found
                self.medicineName = similars.last!
            }
        }
    }
    
    
}
