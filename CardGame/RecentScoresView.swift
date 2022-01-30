//
//  HighScoresView.swift
//  CardGame
//
//  Created by Preethi Narayan on 1/28/22.
//

import SwiftUI
import Foundation

struct RecentScoresView: View {
    
    @ObservedObject var model = ViewModel()
    
    @State var name = ""
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            VStack {
                Text("RECENT SCORES").font(.largeTitle).fontWeight(.black).foregroundColor(Color.white)
                List(model.list) {item in
                    Text(String(item.score)).font(.largeTitle)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .listRowBackground(Color.clear)
                            
                }
                .frame(width: 200.0, height: 200.0)
                Spacer()
                Spacer()
            }
            .frame(height: 500.0)
        }
    }
    
    init(score: Int) {
        model.updateData(id: "1", newScore: score)
        model.getData()
    }
}

struct RecentScoresView_Previews: PreviewProvider {
    static var previews: some View {
        RecentScoresView(score: 5)
    }
}
