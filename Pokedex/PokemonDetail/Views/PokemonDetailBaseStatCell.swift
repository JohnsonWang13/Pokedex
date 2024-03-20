//
//  PokemonDetailBaseStatCell.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import UIKit

final class PokemonDetailBaseStatCell: UITableViewCell {
    
    private let hpLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let attackLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let defenseLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let specialAttackLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let specialDefenseLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let speedLabel: UILabel = {
        let label = UILabel()
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
        
        func createHStack(with arrangedSubviews: [UIView]) -> UIStackView {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            arrangedSubviews.forEach { stackView.addArrangedSubview($0) }
            return stackView
        }
        
        let vStackView = UIStackView()
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .vertical
        
        vStackView.addArrangedSubview(createHStack(with: [hpLabel, speedLabel]))
        vStackView.addArrangedSubview(createHStack(with: [attackLabel, defenseLabel]))
        vStackView.addArrangedSubview(createHStack(with: [specialAttackLabel, specialDefenseLabel]))
        
        contentView.addSubview(vStackView)
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            vStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            vStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            vStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(stats: PokemonDetailPresentationModel.Stats) {
        hpLabel.text = "HP: \(stats.hp)"
        attackLabel.text = "Atk: \(stats.attack)"
        defenseLabel.text = "Defense: \(stats.defense)"
        specialAttackLabel.text = "Sp. Atk: \(stats.specialAttack)"
        specialDefenseLabel.text = "Sp. Def: \(stats.specialDefense)"
        speedLabel.text = "Speed: \(stats.speed)"
    }
}
