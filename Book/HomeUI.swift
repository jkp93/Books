//
//  HomeUI.swift
//  Book
//
//  Created by 박중권 on 5/9/24.
//

import UIKit

class HomeUI: UIView {
    
    let searchBar = UISearchBar()
    let collectionViewLabel = UILabel()
    let collectionView: UICollectionView
    let tableView = UITableView()
    let tableViewLabel = UILabel()
    
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(frame: frame)
        
        configureUI()
        //        configureCollectionView()
        //        configureTableView()
        
//        searchBar.delegate = self
        collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        
        //addSubview - 순차적으로 생성이 되기 때문에 한번에 모아 놓는게 편함
        addSubview(searchBar)
        addSubview(collectionViewLabel)
        addSubview(collectionView)
        addSubview(tableViewLabel)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        collectionViewLabel.text = "Recent Books"
        collectionViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionViewLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            collectionViewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionViewLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: collectionViewLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.bottomAnchor.constraint(equalTo: tableViewLabel.topAnchor)
        ])
        
        // collectionView 아래에 tableViewLabel 추가
        tableViewLabel.text = "Search Result"
        tableViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableViewLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            tableViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableViewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableViewLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // tableViewLabel 아래에 tableView 추가
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: tableViewLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}



// UICollectionViewDataSource 및 UICollectionViewDelegate 구현
extension HomeUI: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0 // 나중에 네트워크에서 받은 데이터의 수로 변경
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.reuseIdentifier, for: indexPath) as! BookCollectionViewCell
        // 셀 구성 코드 추가
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 선택한 아이템 처리 (나중에 구현)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.bounds.height)
    }
}

// UITableViewDataSource 구현
extension HomeUI: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // 나중에 네트워크에서 받은 데이터의 수로 변경
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        // 테이블 뷰 셀 구성 코드 추가
        cell.textLabel?.text = "Sample Text"
        return cell
    }
}



