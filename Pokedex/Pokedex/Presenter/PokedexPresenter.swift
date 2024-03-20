//
//  ViewModel.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/18.
//

import Foundation
import PokemonLoader

protocol PokedexListProtocol {
    var output: PokedexPresenterOutput? { get set }
    var pokemonItems: [PokemonListItemPresentationModel] { get }
}

protocol PokedexPresenterInput {
    func fetchPokemonItems()
    func displayPokemonDetail(with url: URL)
}

protocol PokedexPresenterOutput: AnyObject {
    func shouldUpdateList()
}

class PokedexPresenter: PokedexListProtocol, PokedexPresenterInput {
    
    weak var output: PokedexPresenterOutput?
    
    private weak var coordinator: PokedexCoordinatorProtocol?
    private let pokemonLoader: PokemonLoader
    
    private(set) var pokemonItems = [PokemonListItemPresentationModel]()
    
    private var offset = 0
    private let limit = 20
    
    init(coordinator: PokedexCoordinatorProtocol,
         loader: PokemonLoader) {
        self.coordinator = coordinator
        self.pokemonLoader = loader
    }
    
    func fetchPokemonItems() {
        pokemonLoader.loadPokemonList(offset: offset, limit: limit) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(pokemonList):
                self.pokemonItems += PokemonListAdapter.toPresentationModels(models: pokemonList.pokemonItems)
                self.output?.shouldUpdateList()
                self.offset += limit
            case let .failure(error):
                print("\(error)")
            }
        }
    }
}

extension PokedexPresenter {
    func displayPokemonDetail(with url: URL) {
        coordinator?.push(toPokemonDetail: url)
    }
}
