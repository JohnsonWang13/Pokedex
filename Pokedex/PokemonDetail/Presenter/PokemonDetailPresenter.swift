//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import Foundation
import PokemonLoader

protocol PokemonDetailPresenterProtocol {
    var output: PokemonDetailPresenterOutput? { get set }
    var pokemon: PokemonDetailPresentationModel? { get }
    var pokemonSpecies: PokemonSpeciesPresentationMode? { get }
}

protocol PokemonDetailPresenterInput {
    func reloadData()
    func didFinished()
}

protocol PokemonDetailPresenterOutput: AnyObject {
    func shouldUpdatePokemon()
}

final class PokemonDetailPresenter: PokemonDetailPresenterProtocol, PokemonDetailPresenterInput {

    weak var output: PokemonDetailPresenterOutput?
    
    private weak var coordinator: PokemonDetailCoordinatorProtocol?
    
    private(set) var pokemon: PokemonDetailPresentationModel?
    private(set) var pokemonSpecies: PokemonSpeciesPresentationMode?
    
    let pokemonLoader: PokemonLoader
    let pokemonURL: URL
    
    init(coordinator: PokemonDetailCoordinatorProtocol, loader: PokemonLoader, url: URL) {
        self.coordinator = coordinator
        self.pokemonLoader = loader
        self.pokemonURL = url
        
        reloadData()
    }
    
    func reloadData() {
        fetchPokemon { [weak self] url in
            guard let self = self else { return }
            self.fetchPokemonSpecies(url: url)
        }
    }
    
    func fetchPokemon(completion: @escaping (URL?) -> Void) {
        pokemonLoader.loadPokemonDetail(url: pokemonURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(pokemonDetail):
                self.pokemon = PokemonDetailAdapter.toPresentationModel(model: pokemonDetail)
                completion(self.pokemon?.speciesURL)
            case let .failure(error):
                print("\(error)")
            }
        }
    }
    
    func fetchPokemonSpecies(url: URL?) {
        guard let url = url else { return }
        pokemonLoader.loadPokemonSpecies(url: url) { result in
            switch result {
            case let .success(pokemonSpecies):
                self.pokemonSpecies = PokemonDetailAdapter.toPresentationModel(model: pokemonSpecies)
            case let .failure(error):
                print("\(error)")
            }
            
            self.output?.shouldUpdatePokemon()
        }
    }
    
    func didFinished() {
        coordinator?.didFinished()
    }
}
