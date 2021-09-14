//
//  ScanView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI
import AVFoundation

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

struct ScanView: View {
    @Binding var recognizedText: String
    @State var scanState: ScanState = .notFound
    @State var hasFoundCorrect = false
    
    var speechManager = SpeechManager()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let apiWrapper = APIWrapper()
    
    func displayResult() {
        //Chamar a api
        apiWrapper.decodeSimilars(recognizedText: recognizedText) { similars in
            print(similars)
            if !similars.isEmpty {
                //É o remedio certo
                hasFoundCorrect = true
            }
        }
    }
    
    var body: some View {
        ZStack {
            ScanViewController(recognizedText: $recognizedText)
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Button")
                        Image(systemName: "xmark")
                    })
                    .padding(24)
                    Spacer()
                }
                .padding(.vertical)
                .background(VisualEffectView(effect: UIBlurEffect(style: .systemMaterial)))
                Spacer()
            }
            Text(recognizedText)
                .padding()
                .offset(y: 250)

            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.blue.opacity(0.75))
            if hasFoundCorrect {
                Image(systemName: "checkmark.seal.fill")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .offset(y: -200)
            }
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    ZStack {
                        VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
                            .frame(width: geometry.size.width, height: 200)
                        Button(action: {
                            self.speechManager.speak(text: "Olá Mundo")
//                            speak(speech: "Continue escaneando até encontrar um remédio")
                        }, label: {
                            ScanButtonView(scanState: $scanState)
                                .foregroundColor(.black)
                        })
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
//        .onChange(of: recognizedText, perform: { _ in
//            displayResult()
//        })
    }
}



struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(recognizedText: .constant(""))
    }
}
