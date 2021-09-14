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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var scannerCardShowing = false
    
    
    var speechManager = SpeechManager()
    
    let apiWrapper = APIWrapper()
    
    func displayResult() {
        //Chamar a api
        apiWrapper.decodeSimilars(recognizedText: recognizedText) { similars in
            print(similars)
            if !similars.isEmpty {
                //É o remedio certo
                hasFoundCorrect = true
                scanState = .found
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
                        Text("Fechar")
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
            
            if scannerCardShowing {
                ScannerCheckModalView(modalShowing: $scannerCardShowing)
            }
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    ZStack {
                        VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
                            .frame(width: geometry.size.width, height: 200)
                        Button(action: {
                            if scanState != .found {
                                self.speechManager.speak(text: scanState == .notFound ? "Continue escaneando até achar um remédio" : scanState == .notRegistered ? "Esse remédio não está cadastrado no seu App." : "")
                            } else {
                                scannerCardShowing = true
                            }
                            
                        }, label: {
                            ScanButtonView(scanState: $scanState)
                                .foregroundColor(.black)
                        })
                    }
                }
            }
        }
        .onTapGesture {
            scannerCardShowing = false
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: recognizedText, perform: { _ in
            displayResult()
        })
    }
}



struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(recognizedText: .constant(""))
    }
}
