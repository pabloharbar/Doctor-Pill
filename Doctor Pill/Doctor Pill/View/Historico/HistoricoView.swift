//
//  HistoricoView.swift
//  Doctor Pill
//
//  Created by Pablo Penas on 14/09/21.
//

import SwiftUI

struct HistoricoView: View {
    @State var searchField = ""
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Histórico")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.top)
                SearchView(search: $searchField)
                    .padding(.bottom)
                
                HStack {
                    Text("Tratamento Atual")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.vertical)
                
                CardHistoricoView()
                
                HStack {
                    Text("Tratamentos Inativos")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.vertical)
                VStack(spacing: 20) {
                    CardHistoricoView()
                    CardHistoricoView()
                    CardHistoricoView()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SearchView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").opacity(0.2)
            TextField("Search", text: $search)

        }
        .padding(7)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(9)
        
    }
}

struct HistoricoView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricoView()
    }
}
