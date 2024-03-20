//
//  PokemonDetailFactory.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import Foundation
import PokemonLoader
import Network

final class PokemonDetailFactory {
    
    private init() {}
    
    static func build(with url: URL, coordinator: PokemonDetailCoordinatorProtocol) -> PokemonDetailViewController {
        let loader = RemotePokemonLoader(client: URLSessionHTTPClient())
        let presenter = PokemonDetailPresenter(coordinator: coordinator, loader: loader, url: url)
        let vc = PokemonDetailViewController(presenter: presenter)
        return vc
    }
}
