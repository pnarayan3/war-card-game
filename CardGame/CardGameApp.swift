//
//  CardGameApp.swift
//  CardGame
//
//  Created by Preethi Narayan on 1/23/22.
//

import SwiftUI
import Firebase

@main
struct CardGameApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }.navigationViewStyle(StackNavigationViewStyle())
                .accentColor(Color.white)
        }
    }
}

struct Previews_CardGameApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
