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
    
    func HoleShapeMask(in rect: CGRect) -> Path {
        var shape = RoundedRectangle(cornerRadius: 29).path(in: rect)
        shape.addPath(Circle().path(in: rect))
        return shape
    }
    
    fileprivate func closeButton() -> some View {
        return VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .black, design: .default))
                })
                .foregroundColor(.black)
                .padding(24)
                
                Spacer()
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity)
    }
    
    fileprivate func scanResult() -> some View {
        return HStack(spacing: 0) {
            ForEach(scanState.getIconsName(), id: \.self) { iconName in
                Image(systemName: iconName)
            }
        }
        .font(.system(size: 24))
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(scanState.getColor())
        .cornerRadius(29, corners: [.bottomLeft, .bottomRight])
        .padding(.bottom, 20)
        .background(Color.white)
    }
    
    fileprivate func scannerFrame() -> some View {
        return ZStack(alignment: .bottom) {
            Rectangle()
                .fill(scanState.getColor())
                .frame(height: UIScreen.main.bounds.height * 0.62)
            
            RoundedRectangle(cornerRadius: 29)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height / 2)
                .blendMode(.destinationOut)
            
        }
        .compositingGroup()
    }
    
    fileprivate func scannerAim() -> some View {
        return Image(systemName: "plus")
            .font(.title.weight(.black))
            .offset(y: (UIScreen.main.bounds.height * 0.4) - 24)
                .foregroundColor(.black.opacity(0.75))
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            ScanViewController(recognizedText: $recognizedText)
            
            VStack(spacing: 0) {
                scannerFrame()
                
                scanResult()
                
                Image("Ritalina")
                    .resizable()
                    .scaledToFill()
                    .offset(y: 25)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.20)
                    .clipShape(RoundedRectangle(cornerRadius: 29))
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                    .padding(.bottom, (UIScreen.main.bounds.height * 0.1) - 35)
                    .background(Color.white.edgesIgnoringSafeArea(.bottom))
                /*
                RoundedRectangle(cornerRadius: 29)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.20)
                */
            }

            closeButton()

            Text(recognizedText)
                .padding()
                .offset(y: 250)
                .foregroundColor(.white)

            scannerAim()
            
            if scannerCardShowing {
                ScannerCheckModalView(modalShowing: $scannerCardShowing)
            }
            
            /*GeometryReader { geometry in
                VStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            if scanState != .found {
                                self.speechManager.speak(text: scanState == .notFound ? "Continue escaneando até achar um remédio" : scanState == .notRegistered ? "Esse remédio não está cadastrado no seu App." : "")
                            } else {
                                scannerCardShowing = true
                            }

                        }) {
                            ScanButtonView(scanState: $scanState)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(width: geometry.size.width, height: 200)
                    
                    
                    
                    
                }
            }*/
        }
        .foregroundColor(.black)
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
