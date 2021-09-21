//
//  MedicineCardView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct MedicineCardView: View {
    let horario: Date = Date(timeIntervalSinceNow: 0)
    @State var remedio: Remedio
    
    func getHourString() -> String {
        let hour = Calendar.current.component(.hour, from: remedio.horarios[0])
        let minute = Calendar.current.component(.minute, from: remedio.horarios[0])
        return "\(hour):\(minute)"
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "speaker.wave.3.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                })
                Text(getHourString())
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            
            HStack(spacing: 13) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(remedio.nome)
                        .font(.title2)
                    Text("\(remedio.quantidade.formatNumber()) \(remedio.tipo.rawValue.lowercased())\(remedio.quantidade > 1 ? "s" : ""), \(remedio.posologia)")
                        .font(.callout)
                }
                Spacer()
            }
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("DarkMorning"),Color("LightMorning")]), startPoint: .bottomLeading, endPoint: .topTrailing)
        )
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct MedicineCardView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineCardView(remedio: RemediosManager.fullState().remedios[0])
    }
}
