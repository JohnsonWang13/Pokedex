//
//  PokemonDetailPresentationModel.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import Foundation

struct PokemonDetailPresentationModel {
    let id: Int
    let name: String
    let types: [String]
    let thumbnailImageURL: URL
    let stats: Stats
    let speciesURL: URL
    
    public struct Stats: Equatable {
        let hp: Int
        let attack: Int
        let defense: Int
        let specialAttack: Int
        let specialDefense: Int
        let speed: Int
        
        public init(hp: Int, attack: Int, defense: Int, specialAttack: Int, specialDefense: Int, speed: Int) {
            self.hp = hp
            self.attack = attack
            self.defense = defense
            self.specialAttack = specialAttack
            self.specialDefense = specialDefense
            self.speed = speed
        }
    }
    
    public init(id: Int, name: String, types: [String], thumbnailImageURL: URL, stats: Stats, speciesURL: URL) {
        self.id = id
        self.name = name
        self.types = types
        self.thumbnailImageURL = thumbnailImageURL
        self.stats = stats
        self.speciesURL = speciesURL
    }
}


struct PokemonSpeciesPresentationMode {
    public let id: Int
    public let description: String
    
    init(id: Int, description: String) {
        self.id = id
        self.description = description
    }
}
