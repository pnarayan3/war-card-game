//
//  InstructionsView.swift
//  CardGame
//
//  Created by Preethi Narayan on 1/25/22.
//

import SwiftUI

struct InstructionsView: View {
    
    var body: some View {
        ZStack() {
            Image("background").ignoresSafeArea()
            VStack() {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 80.0)
                
                VStack(alignment: .center) {
                    Text("This is War, the game where you win points by playing a higher card than your opponent")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.all, 30.0)
                    Text("1. Tap the \"DEAL\" button to deal the next round of cards.\n\n2. You earn a point when your card has a higher face value than the CPU's card. The CPU earns a point when your card has lower face value than the CPU's card.\n\n3. No points are awarded when there is a tie in face values.\n\n4. The first player to reach 10 points wins! The winner's final score is calculated by taking the difference between their score and their opponent's score.")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .frame(width: 350.0)
                    
                }
                Spacer()
                Spacer()
            }
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
