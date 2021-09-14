//
//  SpeechManager.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import Foundation
import AVFoundation



final class SpeechManager: NSObject {
    private var speechSynthesizer = AVSpeechSynthesizer()

      override init() {
        super.init()
        self.speechSynthesizer.delegate = self
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch let error {
            print(error)
        }
      }
      
      func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
        utterance.rate = AVSpeechUtteranceMinimumSpeechRate
        utterance.volume = 100.0

        speechSynthesizer.speak(utterance)
        print(AVSpeechSynthesisVoice.speechVoices())
      }
}
