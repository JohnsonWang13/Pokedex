//
//  PokemonDetailCoordinator.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import Foundation
import UIKit

protocol PokemonDetailCoordinatorProtocol: AnyObject {
    func didFinished()
}

final class PokemonDetailCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
    private var url: URL
    
    init(navigationController: UINavigationController?, with url: URL) {
        self.navigationController = navigationController
        self.url = url
    }
    
    func start() {
        let vc = PokemonDetailFactory.build(with: url, coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PokemonDetailCoordinator: PokemonDetailCoordinatorProtocol {
    func didFinished() {
        self.parentCoordinator?.childDidFinish(self)
    }
}
