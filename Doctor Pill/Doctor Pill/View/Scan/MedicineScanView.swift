//
//  MedicineScanView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 17/09/21.
//

import SwiftUI

struct MedicineScanView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var scanManager: ScanManager
    @EnvironmentObject var feedManager: FeedManager
    
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
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(scanManager.scanState.getColor())
        .cornerRadius(29, corners: [.bottomLeft, .bottomRight])
        .padding(.bottom, 20)
        .background(Color.white)
    }
    
    fileprivate func scannerFrame() -> some View {
        return ZStack(alignment: .bottom) {
            Rectangle()
                .fill(scanManager.scanState.getColor())
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
            ScanViewController(recognizedText: $scanManager.recognizedText)
            
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

//            Text(scanManager.recognizedText)
//                .padding()
//                .offset(y: 250)
//                .foregroundColor(.white)

            scannerAim()
            
            if scanManager.scannerCardShowing {
                VStack {
                    Spacer()
                    ScannerCheckModalView(hora: feedManager.medicineToSearch!.horário, nome: feedManager.medicineToSearch!.nome, intrucoes: feedManager.medicineToSearch!.instrucoes, posologia: feedManager.medicineToSearch!.posologia, scannerButtonEnabled: false)
                        .offset(y: -120)
                    Spacer()
                }
            }
            
        }
        .foregroundColor(.black)
        .onTapGesture {
            scanManager.scanState = .notFound
            scanManager.scannerCardShowing = false
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: scanManager.recognizedText, perform: { _ in
            scanManager.displaySpecificResult(nome: feedManager.medicineToSearch!.nome)
        })
    }
}

struct MedicineScanView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineScanView()
    }
}
