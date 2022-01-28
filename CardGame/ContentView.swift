//
//  ContentView.swift
//  CardGame
//
//  Created by Preethi Narayan on 1/23/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack() {
            Image("background").ignoresSafeArea()
            VStack() {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit)
                Spacer()
                VStack() {
                    NavigationLink(destination: InstructionsView()) {
                        ZStack() {
                            Rectangle()
                                .frame(width: 240.0, height: 70.0).foregroundColor(Color.orange)
                            Text("HOW TO PLAY").font(.title).foregroundColor(Color.white).multilineTextAlignment(.center)
                        }
                    }.padding(10.0)
                    
                    NavigationLink(destination: GameView()) {
                        ZStack() {
                            Rectangle()
                                .frame(width: 240.0, height: 70.0).foregroundColor(Color.orange)
                            Text("START GAME").font(.title).foregroundColor(Color.white).multilineTextAlignment(.center)
                        }
                    }.padding(10.0)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
