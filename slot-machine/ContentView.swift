//
//  ContentView.swift
//  slot-machine
//
//  Created by FURKAN AYAZ on 30.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State public var symbols = ["eating", "happy", "love"]
    @State public var nubmers = [0, 1, 2]
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
                        Hexagon().frame(width: 100, height: 120).foregroundStyle(.white.opacity(0.8)).shadow(color: .black.opacity(0.5), radius: 1, y: 3).overlay(content: {
                            Image(symbols.first!).resizable().frame(width: 80, height: 80)
                                .shadow(color: .black.opacity(0.5), radius: 1, y: 3)
                        })
                        
                        Hexagon().frame(width: 100, height: 120).foregroundStyle(.white.opacity(0.8)).shadow(color: .black.opacity(0.5), radius: 1, y: 3)
                            .overlay(content: {
                                Image(symbols[1]).resizable().frame(width: 80, height: 80).shadow(color: .black.opacity(0.5), radius: 1, y: 3)
                            })
                    }
                })
                
            })
        }
    }
}

#Preview {
    ContentView()
}
