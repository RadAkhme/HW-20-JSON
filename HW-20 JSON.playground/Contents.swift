import Foundation


func magicTheGatheringURL(_ cardName: String) -> String {
    var magicTheGatheringComponents = URLComponents()
    magicTheGatheringComponents.scheme = "https"
    magicTheGatheringComponents.host = "api.magicthegathering.io"
    magicTheGatheringComponents.path = "/v1/cards"
    magicTheGatheringComponents.queryItems = [URLQueryItem(name: "name", value: cardName)]

    return magicTheGatheringComponents.description
}

func getData(cardsUrlRequest: [String]) {
    for request in cardsUrlRequest {
        let urlRequest = URL(string: magicTheGatheringURL(request))
        guard let url = urlRequest else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error - \(String(describing: (error?.localizedDescription) ?? ""))")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            
            let decoder = JSONDecoder()
            do {
                let mtg = try decoder.decode(Cards.self, from: data)
                print(mtg.printAllCards(cardsUrlRequest))
            } catch {
                print(error)
            }
        }.resume()
    }
}


getData(cardsUrlRequest: ["Black Lotus", "Opt"])
