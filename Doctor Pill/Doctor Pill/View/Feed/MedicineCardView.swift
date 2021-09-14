//
//  MedicineCardView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct MedicineCardView: View {
    let horario: Date = Date(timeIntervalSinceNow: 0)
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.white)
                        .frame(width: 60, height: 60)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "speaker.wave.3.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                })
            }
            .shadow(radius: 10)
            HStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("Nome do Remédio")
                        .font(.title2)
                    Text("Qtdade, Posologia")
                        .font(.callout)
                }
                Spacer()
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 234/255, blue: 121/255),Color(red: 251/255, green: 202/255, blue: 106/255)]), startPoint: .bottomLeading, endPoint: .top)
            )
            .cornerRadius(20)
        }
        .padding(.horizontal)
    }
}

struct MedicineCardView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineCardView()
    }
}
