//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Ad on 3/6/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    
    static let identifier = "TitleTableViewCell"
    
    
    private let titlesPosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }
    
    
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100),
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    
    public func configure(with model: TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        titlesPosterUIImageView.sd_setImage(with: url)
        titleLabel.text = model.titleName
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
