//
//  ViewModel.swift
//  CardGame
//
//  Created by Preethi Narayan on 1/28/22.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list = [RecentScore]()
    
    func getData() {
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("highScores").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all documents and create HighScores
                        self.list = snapshot.documents.map { doc in
                            return RecentScore(id: doc.documentID,
                                             position: doc["position"] as? String ?? "",
                                             score: doc["score"] as? Int ?? 0)
                        }
                    }
                }
            }
        }
    }
    
    func updateData(id: String, newScore: Int) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("highScores").document(id).setData(["score": newScore], merge: true)
    }
}
