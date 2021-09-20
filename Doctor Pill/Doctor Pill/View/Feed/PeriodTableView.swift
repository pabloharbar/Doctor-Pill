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
    
    @State var remediosHoje: [PeriodosDoDia: [(remedio: Remedio, horario: TakenDate)]] = [
        .manha: [],
        .tarde: [],
        .noite: []
    ]
    
    func getHourString(_ date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        return "\(hour):\(minute)"
    }
    
    func takeMedicine(_ medicine: Remedio, expectedDate: Date) {
        feedManager.takeMedicine(medicine, expectedDate: expectedDate)
    }
    
    fileprivate func createPreviewCards(_ remedios: [(remedio: Remedio, horario: TakenDate)]) -> some View {
        return ForEach(remedios, id: \.self.remedio.id) { remedioHora in
            let remedio = remedioHora.remedio
            let horario = remedioHora.horario
            
            if horario.takenDate != nil {
                TakenPreviewCard(remedio: remedio)
            } else {
                PreviewCardView(hora: getHourString(horario.expectedDate), nome: remedio.nome, intrucoes: remedio.instrucoes, quantidade: remedio.quantidade, tipo: remedio.tipo, posologia: remedio.posologia, notas: remedio.notas, scannerButtonEnabled: true) {
                    takeMedicine(remedio, expectedDate: horario.expectedDate)
                }
                .environmentObject(feedManager)
            }
        }
    }
    
    func fetchData() {
        feedManager.loadMedicines(remediosManager.remedios)
        remediosHoje = feedManager.remediosHojePorTurno()
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
                createPreviewCards(remedios)
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
                createPreviewCards(remedios)
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
                createPreviewCards(remedios)
            }
        }
        .onAppear {
            print("onAppear")
            fetchData()
        }
        .onChange(of: remediosManager.remedios) { _ in
            print("onChange")
            fetchData()
        }
        .onChange(of: feedManager.remediosTomados) { _ in
            print("onChange remedioTomados")
            remediosHoje = feedManager.remediosHojePorTurno()
        }
    }

}

struct PeriodTableView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodTableView()
            .environmentObject(RemediosManager.fullState())
    }
}
