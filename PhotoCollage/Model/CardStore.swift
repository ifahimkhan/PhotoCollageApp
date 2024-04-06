//
//  CardStore.swift
//  PhotoCollage
//
//  Created by Fahim on 3/26/24.
//

import SwiftUI

class CardStore: ObservableObject{
    @Published var cards:[Card]=[]
    @Published var selectedElement:CardElement?

    init(defaultData:Bool = false) {
        cards = defaultData ? initialCards : load()
    }


    func index(for card: Card) -> Int? {
        cards.firstIndex{$0.id == card.id}
    }

    func remove(for card:Card){
        if let index = index(for: card){
            cards.remove(at: index)
        }
    }
    
}
extension CardStore {
    // 1
    func load() -> [Card] {
        var cards: [Card] = []
        // 2
        let path = URL.documentsDirectory.path
        guard
            let enumerator = FileManager.default
                .enumerator(atPath: path),
            let files = enumerator.allObjects as? [String]
        else { return cards }
        // 3
        let cardFiles = files.filter { $0.contains(".rwcard") }
        for cardFile in cardFiles {
            do { // 4
                let path = path + "/" + cardFile
                let data =
                try Data(contentsOf: URL(fileURLWithPath: path))
                // 5
                let decoder = JSONDecoder()
                let card = try decoder.decode(Card.self, from: data)
                cards.append(card)
            } catch {
                print("Error: ", error.localizedDescription)
            }
        }
        return cards
    }
    func addCard() -> Card {
      let card = Card(backgroundColor: Color.random())
      cards.append(card)
      card.save()
      return card
    }
}
