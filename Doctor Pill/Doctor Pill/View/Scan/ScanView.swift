//
//  ScanView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI
import AVFoundation

struct ScanView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var scanManager: ScanManager


    var speechManager = SpeechManager()

    
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
            ForEach(scanManager.scanState.getIconsName(), id: \.self) { iconName in
                Image(systemName: iconName)
            }
        }
        .font(.system(size: 24))
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity)
        .padding(.top, 30)
        .background(scanManager.scanState.getColor())
        .cornerRadius(29, corners: [.bottomLeft, .bottomRight])
        .padding(.bottom, 20)
        .background(Color.white)
        .offset(y: -30)
    }

    fileprivate func scannerFrame() -> some View {
        return ZStack(alignment: .bottom) {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("PadraoDark"), Color("PadraoLight")]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(29, corners: [.bottomLeft,.bottomRight])
                .frame(height: UIScreen.main.bounds.height * 0.7 + 35)
            
            RoundedRectangle(cornerRadius: 29)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.63 - 35)
                .blendMode(.destinationOut)
                .overlay(
                    RoundedRectangle(cornerRadius: 29)
                        .stroke(scanManager.scanState.getColor(), lineWidth: 10)
                )
                .offset(y: -35)
            
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
            ScanViewController(recognizedText: $scanManager.recognizedText)
            closeButton()

                .zIndex(3)
            
            VStack(spacing: 0) {
                scannerFrame()
                    .zIndex(2)
                scanResult()
                    .zIndex(1)
                    
                HStack {
                    HStack {
                        Button(action: {
                            let textRead = scanManager.scanState == .notFound ? "Continue escaneando até encontrar um remédio" : scanManager.scanState == .found ? "O remédio \(scanManager.medicineName) está registrado na sua rotina" : ""
                            speechManager.speak(text: textRead)
                        }, label: {
                            Image(systemName: "speaker.wave.3.fill")
                                .font(.system(size: 24))
                        })
                        Text(scanManager.scanState == .notFound ? "..." : scanManager.medicineName)
                            .font(.title2)
                        Spacer()
                    }
                    .padding()
                }
                .background(
                    Color.white
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 8, x: 0, y: 8)
                                )
                .padding()
                .padding(.bottom,20)
                .background(Color.white.edgesIgnoringSafeArea(.bottom))
                .offset(y: -35)
                
            }


            Text(scanManager.recognizedText)
                .padding()
                .offset(y: 250)
                .foregroundColor(.white)

            scannerAim()
            
        }
        .foregroundColor(.black)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: scanManager.recognizedText, perform: { _ in
            scanManager.displayResult()
        })
        .onDisappear(perform: {
            scanManager.scanState = .notFound
        })
    }
}



struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
