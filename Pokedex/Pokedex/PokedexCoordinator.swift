//
//  PokedexCoordinator.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import Foundation
import UIKit

protocol PokedexCoordinatorProtocol: AnyObject {
    func push(toPokemonDetail url: URL)
}

final class PokedexCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PokedexFactory.buildPokedexViewController(coordinator: self)
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension PokedexCoordinator: PokedexCoordinatorProtocol {
    func push(toPokemonDetail url: URL) {
        let coordinator = PokemonDetailCoordinator(navigationController: navigationController, with: url)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
