//
//  ScanViewController.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI
import VisionKit
import AVFoundation

struct ScanViewController: UIViewControllerRepresentable {
    @Binding var recognizedText: String

    func makeCoordinator() -> LiveTextControllerCoordinator {
        LiveTextControllerCoordinator(recognizedText: $recognizedText)
    }

    func makeUIViewController(context: Context) -> VisionViewController {
        let visionViewController = VisionViewController(text: recognizedText)
        visionViewController.delegate = context.coordinator
        return visionViewController
    }
    
    func updateUIViewController(_ uiViewController: VisionViewController, context: Context) {
        //
    }
}

class LiveTextControllerCoordinator: NSObject, TextFoundDelegate {
    @Binding var recognizedText: String
    
    init(recognizedText: Binding<String>) {
        self._recognizedText = recognizedText
    }

    func textWasFound(result: Bool) {
//        print("textWasFound \(result)")
    }
    
    func foundText(result: String) {
        recognizedText = result
    }
}
