//
//  ContentView.swift
//  slot-machine
//
//  Created by FURKAN AYAZ on 30.11.2024.
//

import SwiftUI

struct Menu: View {
    @State public var symbols = ["eating", "happy", "love"]
    @State public var numbers = [0, 1, 2]
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
                }.frame(width: nil, height: 50)
                
                VStack(spacing: 15, content: {
                    HStack(spacing: 35) {
                        createSymbol(symbol: symbols[self.numbers[0]])
                        createSymbol(symbol: symbols[self.numbers[1]])
                    }
                    
                    createSymbol(symbol: symbols[self.numbers[2]])
                    
                    HStack(spacing: 35, content: {
                        createSymbol(symbol: symbols[self.numbers[0]])
                        createSymbol(symbol: symbols[self.numbers[1]])
                    })
                })
                
                Button(action: {
                    
                    self.numbers[0] = Int.random(in: 0...self.numbers.count - 1)
                    self.numbers[1] = Int.random(in: 0...self.numbers.count - 1)
                    self.numbers[2] = Int.random(in: 0...self.numbers.count - 1)
                    
                    counter += 1
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        self.showingAlert = Choice.success
                        counter = 0
                    }
                    
                    if counter > 5 {
                        self.showingAlert = .failure
                        counter = 0
                    }
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 10).fill(Color.orange).frame(width: 250, height: 50).overlay(content: {
                        Text("Spin").font(.system(size: 25, weight: .black)).foregroundStyle(.black).shadow(color: .gray.opacity(0.8), radius: 1, y: 3)
                    })
                }).shadow(color: .gray.opacity(0.8), radius: 1, y: 5)
            }).alert(item: $showingAlert) { alert -> Alert in
                return switch(alert) {
                case .success:
                    Alert(title: Text("Yeahhh! you won"), message: Text("Born with the charm"), dismissButton: .cancel())
                case .failure:
                    Alert(title: Text("Oooopss!"), message: Text("Better luck next time"), dismissButton: .cancel())
                }
            }
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
