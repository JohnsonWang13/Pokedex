//
//  PokemonDetailAdapter.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import Foundation
import PokemonLoader

final class PokemonDetailAdapter {
    private init() { }
    
    static func toPresentationModel(model: PokemonDetail) -> PokemonDetailPresentationModel {
            let stats = PokemonDetailPresentationModel.Stats(hp: model.stats.hp, attack: model.stats.attack, defense: model.stats.defense, specialAttack: model.stats.specialAttack, specialDefense: model.stats.specialDefense, speed: model.stats.speed)
            return PokemonDetailPresentationModel(id: model.id, name: model.name, types: model.types, thumbnailImageURL: model.thumbnailImageURL, stats: stats, speciesURL: model.speciesURL)
    }
    
    static func toPresentationModel(model: PokemonSpecies) -> PokemonSpeciesPresentationMode {
        PokemonSpeciesPresentationMode(id: model.id, description: model.description)
    }
}
