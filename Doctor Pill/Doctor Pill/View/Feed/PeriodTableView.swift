//
//  PeriodTableView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

enum PeriodosDoDia {
    case manha
    case tarde
    case noite
}

struct PeriodTableView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("\(Image(systemName: "sunrise")) Manhã")
                    .fontWeight(.bold)
                VStack {
                    Divider()
                }
            }
            .padding()
            .font(.system(size: 22))
            MedicineCardView()
            MedicineCardView()
            HStack(spacing: 20) {
                Text("\(Image(systemName: "sun.max")) Tarde")
                    .fontWeight(.bold)
                VStack {
                    Divider()
                }
            }
            .padding()
            .font(.system(size: 22))
            
            MedicineCardView()
            MedicineCardView()
            HStack(spacing: 20) {
                Text("\(Image(systemName: "moon.stars")) Noite")
                    .fontWeight(.bold)
                VStack {
                    Divider()
                }
            }
            .padding()
            .font(.system(size: 22))
            MedicineCardView()
            MedicineCardView()
        }
    }

}

struct PeriodTableView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodTableView()
    }
}
