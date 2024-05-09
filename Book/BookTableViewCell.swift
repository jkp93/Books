//
//  BookTableViewCell.swift
//  Book
//
//  Created by 박중권 on 5/10/24.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    static let reuseIdentifier = "BookTableViewCell"
    
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Configure title label
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // Configure price label
        priceLabel.font = UIFont.systemFont(ofSize: 17)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)
        
        // Layout constraints for labels
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(withTitle title: String, price: Int) {
        titleLabel.text = title
        priceLabel.text = "$\(price)" // Assuming price is in dollars
    }
}
