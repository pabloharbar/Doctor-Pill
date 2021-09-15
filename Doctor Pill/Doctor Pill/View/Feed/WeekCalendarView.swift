//
//  WeekCalendarView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct WeekCalendarView: View {
    var body: some View {
        VStack {
            Divider()
            generateWeek(currentDay: .terca)
        }
    }
    
    @ViewBuilder func generateWeek(currentDay: DiasDaSemana) -> some View {
        let diasDaSemana: [DiasDaSemana] = [.domingo,.segunda,.terca,.quarta,.quinta,.sexta,.sabado]
        HStack() {
            ForEach(diasDaSemana,id: \.self) { dia in
                if dia == currentDay {
                    Text("\(getDayText(currentDay: dia))")
                        .font(.body)
//                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.black)
                        .cornerRadius(12)
                        .overlay(
                            Triangle()
                                .fill(Color.black)
                                .frame(width: 21, height: 14)
                                .rotationEffect(.init(degrees: 180))
                                .offset(y: -28)
                            
                        )
                    
                } else {
                    Text("\(getDayText(currentDay: dia))")
                        .font(.body)
                        .padding()
                }
            }
            
        }
    }
    func getDayText(currentDay: DiasDaSemana) -> String {
        switch currentDay {
        case .segunda:
            return "S"
        case .terca:
            return "T"
        case .quarta:
            return "Q"
        case .quinta:
            return "Q"
        case .sexta:
            return "S"
        case .sabado:
            return "S"
        case .domingo:
            return "D"
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct WeekCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        WeekCalendarView()
    }
}
