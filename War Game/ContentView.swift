//
//  ContentView.swift
//  War Game
//
//  Created by Amir on 03/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = 2
    @State private var cpuCard = 2
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            // background
            GeometryReader { geometry in
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                // logo
                Image("logo")
                Spacer()
                
                // cards
                HStack {
                    Spacer()
                    Image("card" + String(playerCard))
                    Spacer()
                    Image("card" + String(cpuCard))
                    Spacer()
                }
                Spacer()
                
                // deal button
                Button {
                    let cardsRange = 2...14
                    playerCard = Int.random(in: cardsRange)
                    cpuCard = Int.random(in: cardsRange)
                    
                    if playerCard > cpuCard {
                        playerScore += 1
                    }
                    else if cpuCard > playerCard {
                        cpuScore += 1
                    }
                } label: {
                    Image("dealbutton")
                }
                
                Spacer()
                
                // results
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .padding(.bottom, 10)
                            .font(.system(size: 20))
                        Text(String(playerScore))
                            .font(.system(size: 35))
                    }.foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .padding(.bottom, 10)
                            .font(.system(size: 20))
                        Text(String(cpuScore))
                            .font(.system(size: 35))
                    }.foregroundColor(.white)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
