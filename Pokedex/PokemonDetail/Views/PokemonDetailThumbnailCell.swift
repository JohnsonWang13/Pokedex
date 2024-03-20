//
//  PokemonDetailThumbnailCell.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import UIKit
import Kingfisher

final class PokemonDetailThumbnailCell: UITableViewCell {
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            thumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            thumbnailImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor)
        ])
        
        let widthConstraint = thumbnailImageView.widthAnchor.constraint(equalToConstant: 160)
        widthConstraint.priority = .defaultHigh
        widthConstraint.isActive = true
    }
    
    func configure(thumbnailImageURL: URL) {
        thumbnailImageView.kf.setImage(with: thumbnailImageURL)
    }
}
