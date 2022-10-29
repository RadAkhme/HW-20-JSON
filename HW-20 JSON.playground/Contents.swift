import UIKit


func magicTheGatheringURL(_ cardName: String) -> String {
    var magicTheGatheringComponents = URLComponents()
    magicTheGatheringComponents.scheme = "https"
    magicTheGatheringComponents.host = "api.magicthegathering.io"
    magicTheGatheringComponents.path = "/v1/cards"
    magicTheGatheringComponents.queryItems = [URLQueryItem(name: "name", value: cardName)]

    return magicTheGatheringComponents.description
}
