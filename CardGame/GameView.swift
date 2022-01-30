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
                Image("logo").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 80.0)
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
            if cpuScore >= 10 {
                ZStack {
                    Rectangle()
                        .frame(width: 400.0, height: 700.0).foregroundColor(Color.orange)
                    VStack {
                        Text("CPU WINS").font(.title).foregroundColor(Color.white).multilineTextAlignment(.center)
                    
                        NavigationLink(destination: ContentView()) {
                            ZStack() {
                                Rectangle()
                                    .frame(width: 240.0, height: 70.0).foregroundColor(Color.white)
                                Text("PLAY AGAIN").font(.title).foregroundColor(Color.black).multilineTextAlignment(.center)
                            }
                        }.padding(10.0)
                    }
                }
            } else if playerScore >= 10 {
                ZStack {
                    Rectangle()
                        .frame(width: 400.0, height: 700.0).foregroundColor(Color.orange)
                    VStack {
                        Text("PLAYER WINS").font(.title).foregroundColor(Color.white).multilineTextAlignment(.center)
                        Text("PLAYER SCORE: " + (playerScore - cpuScore)).font(.title).foregroundColor(Color.white).multilineTextAlignment(.center)

                        NavigationLink(destination: ContentView()) {
                            ZStack() {
                                Rectangle()
                                    .frame(width: 240.0, height: 70.0).foregroundColor(Color.white)
                                Text("PLAY AGAIN").font(.title).foregroundColor(Color.black).multilineTextAlignment(.center)
                            }
                        }.padding(10.0)
                        
                        NavigationLink(destination: RecentScoresView(score: playerScore - cpuScore)) {
                            ZStack() {
                                Rectangle()
                                    .frame(width: 360.0, height: 70.0).foregroundColor(Color.white)
                                Text("VIEW RECENT SCORES").font(.title).foregroundColor(Color.black).multilineTextAlignment(.center)
                            }
                        }.padding(10.0)
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
