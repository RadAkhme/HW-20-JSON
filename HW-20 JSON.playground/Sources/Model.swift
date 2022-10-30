import Foundation


public struct Cards: Decodable {
    var cards: [Card]
    
    public func printAllCards(_ cardName: [String]) {
        let cards = cards.filter { card in
           cardName.contains(card.name)
        }
        
        for card in cards {
            card.printCard()
        }
    }
}

struct Card: Decodable {
    var name: String
    var manaCost: String?
    var type: String
    var setName: String
    var text: String
    var artist: String
    
    func printCard() {
        print("\nНазвание карты: \(name)")
        print("Мановая Стоимость: \(manaCost ?? "У данной карты не было мановой стоимости")")
        print("Тип: \(type)")
        print("Текст: \(text)")
        print("Название сета: \(setName)")
        print("Автор: \(artist)")
    }
}
