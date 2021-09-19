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
                recognizedText.dropLast()
            }
        }
    }
    @Published var hasFoundCorrect: Bool
    @Published var scannerCardShowing: Bool
    @Published var medicineName: String
    
    let apiWrapper = APIWrapper()
    
    init() {
        self.scanState = .notFound
        self.recognizedText = ""
        self.hasFoundCorrect = false
        
        self.medicineName = ""
        self.scannerCardShowing = false
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
                self.scannerCardShowing = true
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
                    self.hasFoundCorrect = true
                    self.scanState = .found
                    self.medicineName = similars.last!
                    self.scannerCardShowing = true
                }
            }
        }
    }
    
}
