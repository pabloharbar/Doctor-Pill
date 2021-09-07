//
//  FeedView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI

struct FeedView: View {
    @State var sheetPresented = false
    @State private var recognizedText = "Tap button to start scanning"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(
                        destination: ZStack {
                                ScanViewController(recognizedText: $recognizedText)
                                    .border(Color.red)

                                Text(recognizedText)
                                    .padding()
                                    .offset(y: 250)

                                Image(systemName: "plus")
                                    .font(.title2)
                                    .foregroundColor(.blue.opacity(0.75))
                                    .offset(y: 55)
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                        label: {
                            Image(systemName: "doc.text.viewfinder")
                                .font(.system(size: 24))
                                .foregroundColor(.gray)
                        })
                        
                    
//                    Button(action: {
//
//                    }, label: {
//                        Image(systemName: "doc.text.viewfinder")
//                            .font(.system(size: 24))
//                            .foregroundColor(.gray)
//                    })
                    Spacer()
                    Button(action: {
                        sheetPresented.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    })
                }
                .padding(.horizontal)
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .sheet(isPresented: $sheetPresented) {
                RegisterView()
        }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
