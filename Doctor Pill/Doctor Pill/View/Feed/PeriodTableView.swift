//
//  PeriodTableView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct PeriodTableView: View {
    @EnvironmentObject var remediosManager: RemediosManager
    @EnvironmentObject var feedManager: FeedManager
    
    @State var remediosHoje: [PeriodosDoDia: [(remedio: Remedio, horario: Date)]] = [
        .manha: [],
        .tarde: [],
        .noite: []
    ]
    
    func getHourString(_ date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        return "\(hour):\(minute)"
    }
    
    var body: some View {
        VStack {            
            HStack(spacing: 20) {
                Text("\(Image(systemName: "sunrise")) Manhã")
                    .fontWeight(.bold)
                VStack {
                    Divider()
                }
            }
            .id(1)
            .padding()
            .font(.system(size: 22))
            
            if let remedios = remediosHoje[.manha] {
                ForEach(remedios, id: \.self.remedio.id) { remedioHora in
                    let remedio = remedioHora.remedio
                    let horario = remedioHora.horario
                    
                    PreviewCardView(hora: getHourString(horario), nome: remedio.nome, intrucoes: remedio.instrucoes, posologia: remedio.posologia, notas: remedio.notas, scannerButtonEnabled: true)
                        .environmentObject(feedManager)
                        
                }
            }
            
            HStack(spacing: 20) {
                Text("\(Image(systemName: "sun.max")) Tarde")
                    .fontWeight(.bold)
                VStack {
                    Divider()
                }
            }
            .id(2)
            .padding()
            .font(.system(size: 22))
            
            if let remedios = remediosHoje[.tarde] {
                ForEach(remedios, id: \.self.remedio.id) { remedioHora in
                    let remedio = remedioHora.remedio
                    let horario = remedioHora.horario
                    
                    PreviewCardView(hora: getHourString(horario), nome: remedio.nome, intrucoes: remedio.instrucoes, posologia: remedio.posologia, notas: remedio.notas, scannerButtonEnabled: true)
                        .environmentObject(feedManager)
                }
            }
            
            HStack(spacing: 20) {
                Text("\(Image(systemName: "moon.stars")) Noite")
                    .fontWeight(.bold)
                VStack {
                    Divider()
                }
            }
            .id(3)
            .padding()
            .font(.system(size: 22))
            
            if let remedios = remediosHoje[.noite] {
                ForEach(remedios, id: \.self.remedio.id) { remedioHora in
                    let remedio = remedioHora.remedio
                    let horario = remedioHora.horario
                    
                    PreviewCardView(hora: getHourString(horario), nome: remedio.nome, intrucoes: remedio.instrucoes, posologia: remedio.posologia, notas: remedio.notas, scannerButtonEnabled: true)
                        .environmentObject(feedManager)
                }
            }
        }
        .onAppear {
            print("apareceu!")
            remediosHoje = remediosManager.remediosHojePorTurno()
            print(remediosHoje)
        }
        .onChange(of: remediosManager.remedios) { _ in
            print("Tem remédio novo na área!")
            remediosHoje = remediosManager.remediosHojePorTurno()
            print(remediosHoje)
        }
    }

}

struct PeriodTableView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodTableView()
            .environmentObject(RemediosManager.fullState())
    }
}
