//
//  ContentView.swift
//  slot-machine
//
//  Created by FURKAN AYAZ on 30.11.2024.
//

import SwiftUI

struct Menu: View {
    @State public var symbols = ["eating", "happy", "love", "scary", "sleeping"]
    @State public var nubmers = [0, 1, 2, 3, 4]
    @State public var counter = 0
    @State private var showingAlert: Choice?
    
    var body: some View {
        ZStack {
            Image("sunshine").resizable().ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 80, content: {
                
                HStack {
                    Image("fire").resizable().scaledToFit().shadow(color: .orange, radius: 1, y: 3)
                    
                    Text("Slot Machine")
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .shadow(color: .orange, radius: 1, y: 3)
                    Image("fire").resizable().scaledToFit().shadow(color: .orange, radius: 1, y: 3)
                }.frame(width: .infinity, height: 50, alignment: .center)
                
                VStack(spacing: 15, content: {
                    HStack(spacing: 35) {
                        createSymbol(symbol: symbols.first!)
                        createSymbol(symbol: symbols[1])
                    }
                    
                    createSymbol(symbol: symbols[2])
                    
                    HStack(spacing: 35, content: {
                        createSymbol(symbol: symbols[3])
                        createSymbol(symbol: symbols[4])
                    })
                })
                
                Button(action: { print("Spin is clicked.") }, label: {
                    RoundedRectangle(cornerRadius: 10).fill(Color.orange).frame(width: .infinity, height: 50).overlay(content: {
                        Text("Spin").font(.system(size: 25, weight: .black)).foregroundStyle(.black).shadow(color: .gray.opacity(0.8), radius: 1, y: 3)
                    })
                }).padding(.horizontal, 85).shadow(color: .gray.opacity(0.8), radius: 1, y: 5)
            })
        }
    }
    
    private func createSymbol(symbol: String) -> some View {
        return Hexagon().frame(width: 100, height: 120).foregroundStyle(.white.opacity(0.8)).shadow(color: .black.opacity(0.5), radius: 1, y: 3).overlay(alignment: .center, content: {
            Image(symbol).resizable().frame(width: 80, height: 80)
                .shadow(color: .black.opacity(0.5), radius: 1, y: 3)
        })
    }
}

#Preview {
    Menu()
}
