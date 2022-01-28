//
//  GameView.swift
//  CardGame
//
//  Created by Preethi Narayan on 1/25/22.
//

import SwiftUI

struct GameView: View {
    
    @State private var playerCard = "back"
    @State private var cpuCard = "back"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack() {
            Image("background").ignoresSafeArea()
            VStack() {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).padding(/*@START_MENU_TOKEN@*/.horizontal, 80.0/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack() {
                    
                    Image(playerCard).resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 20.0)
                    
                    Image(cpuCard).resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 20.0)
                    
                }
                Spacer()
                Button (action: {
                    // generate new cards randomly
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // change cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // update score
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if playerRand < cpuRand {
                        cpuScore += 1
                    }
            
                }, label:{
                    Image("dealbutton").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 80.0)
                })
                Spacer()
                HStack() {
                    Spacer()
                    VStack(){
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack(){
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
