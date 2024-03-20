//
//  PokedexFactory.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/18.
//

import Foundation
import PokemonLoader
import Network

final class PokedexFactory {
    
    private init() { }
    
    static func buildPokedexViewController(coordinator: PokedexCoordinatorProtocol) -> PokedexViewController {
        let loader = RemotePokemonLoader(client: URLSessionHTTPClient())
        let presenter = PokedexPresenter(coordinator: coordinator, loader: loader)
        let vc = PokedexViewController(presenter: presenter)
        return vc
    }
}
