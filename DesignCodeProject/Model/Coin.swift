//
//  Coin.swift
//  DesignCodeProject
//
//  Created by Akysh Akan on 13.05.2024.
//

import Foundation

struct Coin: Identifiable, Decodable {
    let id: Int
    let coin_name: String
    let acronym: String
    let logo: String
}

class CoinModel: ObservableObject {
    @Published var coins: [Coin] = []
    
    @MainActor
    func fetchCoins() async { 
        do {
            guard let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            coins = try JSONDecoder().decode([Coin].self, from: data)
        } catch let error {
            print(error)
            print("Error")
        }
    }
}
