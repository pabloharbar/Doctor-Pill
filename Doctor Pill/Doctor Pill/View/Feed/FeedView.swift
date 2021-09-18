//
//  FeedView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 06/09/21.
//

import SwiftUI

struct FeedView: View {
    @State var registerSheetIsShowing = false
    @State var scrollToTarget: Int?
    @EnvironmentObject var feedManager: FeedManager
    @EnvironmentObject var scanManager: ScanManager
    
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
            
            Text(feedManager.createDateLabel())
                .font(.system(size: 22))
                .fontWeight(.heavy)
            WeekCalendarView(selectedDay: $feedManager.daySelected)
                .padding(.horizontal)
            
            ScrollView {
                ScrollViewReader { (proxy: ScrollViewProxy) in
                    VStack {
                        DayPeriodButtonView(scrollToTarget: $scrollToTarget)
                            .padding(.bottom)
                        
                        PeriodTableView()
                            .environmentObject(feedManager)
                    }
                    .onChange(of: scrollToTarget) { target in
                        if let target = target {
                            scrollToTarget = nil

                            withAnimation {
                                proxy.scrollTo(target, anchor: .top)
                            }
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $registerSheetIsShowing, content: {
            RegisterView()
                .colorScheme(.light)
        })
        .fullScreenCover(isPresented: $feedManager.scannerCardShowing,onDismiss: {
            feedManager.scannerCardShowing = false
        } , content: {
            MedicineScanView()
                .colorScheme(.light)
                .environmentObject(scanManager)
        })
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(FeedManager())
            .environmentObject(RemediosManager.fullState())
    }
}
