//
//  FeedView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI

struct FeedView: View {
    @State var registerSheetIsShowing = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    registerSheetIsShowing = true
                }, label: {
                    HStack(spacing: -5) {
                        Image(systemName: "plus")
                        Image(systemName: "pills")
                    }
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                })
            }
            .padding()
            Text("Hoje, 1 de Setembro")
                .font(.system(size: 22))
                .fontWeight(.heavy)
            WeekCalendarView()
                .padding(.horizontal)
            ScrollView {
                DayPeriodButtonView()
                    .padding(.bottom)
                
                PeriodTableView()
            }
        }
        .fullScreenCover(isPresented: $registerSheetIsShowing, content: {
            RegisterView()
        })
    }
    
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
