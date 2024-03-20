//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(PokemonDetailThumbnailCell.self)
        tableView.register(PokemonDetailInformationCell.self)
        tableView.register(PokemonDetailBaseStatCell.self)
        tableView.register(PokemonDetailDescriptionCell.self)
        return tableView
    }()
    
    private var presenter: (PokemonDetailPresenterProtocol & PokemonDetailPresenterInput)
    
    init(presenter: (PokemonDetailPresenterProtocol & PokemonDetailPresenterInput)) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    deinit {
        presenter.didFinished()
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension PokemonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemon = presenter.pokemon else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(PokemonDetailThumbnailCell.self, indexPath: indexPath)
            cell.configure(thumbnailImageURL: pokemon.thumbnailImageURL)
            return cell
            
        case 1:
            let cell = tableView.dequeue(PokemonDetailInformationCell.self, indexPath: indexPath)
            cell.configure(id: pokemon.id, name: pokemon.name, types: pokemon.types)
            return cell
            
        case 2:
            let cell = tableView.dequeue(PokemonDetailBaseStatCell.self, indexPath: indexPath)
            cell.configure(stats: pokemon.stats)
            return cell
            
        case 3:
            let cell = tableView.dequeue(PokemonDetailDescriptionCell.self, indexPath: indexPath)
            cell.configure(description: presenter.pokemonSpecies?.description)
            return cell
            
        default: break
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension PokemonDetailViewController: UITableViewDelegate {
    
}

// MARK: - Presenter output

extension PokemonDetailViewController: PokemonDetailPresenterOutput {
    func shouldUpdatePokemon() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
