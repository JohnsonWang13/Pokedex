//
//  PokemonListAdapter.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/18.
//

import Foundation
import PokemonLoader

final class PokemonListAdapter {
    private init() { }
    
    static func toPresentationModels(models: [PokemonItem]) -> [PokemonListItemPresentationModel] {
        models.map { PokemonListItemPresentationModel(name: $0.name, url: $0.url) }
    }
}
