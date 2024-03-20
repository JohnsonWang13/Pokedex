//
//  PokemonDetailInformationCell.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import UIKit

final class PokemonDetailInformationCell: UITableViewCell {
    private let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(idLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(typesLabel)
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            idLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            idLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: idLabel.rightAnchor, constant: 4),
            
            typesLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            typesLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
        ])
    }
    
    func configure(id: Int, name: String, types: [String]) {
        idLabel.text = "No. \(id)"
        nameLabel.text = name
        typesLabel.text = types.joined(separator: ", ")
    }
}
