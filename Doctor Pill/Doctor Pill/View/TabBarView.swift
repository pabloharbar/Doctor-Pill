//
//  TabBarView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 10/09/21.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedView = 1 {
        willSet {
            if newValue == 2 {
                isCameraActive = true
            }
        }
    }
    @State var isCameraActive = false
    @State var recognizedText = ""
    
    var body: some View {
        TabView(selection: $selectedView) {
            FeedView()
                .tabItem {
                    Label("Minha Rotina", systemImage: "calendar")
                }
                .tag(1)
            
            PreScanView()
                .tabItem {
                    Button(action: {
                        isCameraActive = true
                    }, label: {
                        Label("Escaner", systemImage: "camera.fill")
                    })
                    
                }
                .tag(2)
            
            TreatmentsView()
                .tabItem {
                    Label("Histórico", systemImage: "clock.arrow.circlepath")
                }
                .tag(3)
            
        }
        .fullScreenCover(isPresented: $isCameraActive, onDismiss: { isCameraActive = true }, content: {
            ScanView(recognizedText: $recognizedText)
                
        })
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
