//
//  HomeViewController.swift
//  Book
//
//  Created by 박중권 on 5/9/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeUI = HomeUI()
    var books: [Document] = []
    
    override func loadView() {
        view = homeUI
    }
    
    let networkService = NetworkService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("asdasd")
        
        
        homeUI.searchBar.delegate = self
        homeUI.searchBar.placeholder = "Search Books"
        
        
        homeUI.collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: BookCollectionViewCell.reuseIdentifier)
        homeUI.collectionView.dataSource = self
        
        
    }
    
    
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.reuseIdentifier, for: indexPath) as! BookCollectionViewCell
        let book = books[indexPath.item]
        cell.titleLabel.text = book.title
        return cell
    }
}



// UISearchBarDelegate 구현
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text, !query.isEmpty {
            print(query)
            // NetworkService 이용하여 검색
            networkService.searchBooks(query: query, completition: { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        // 성공 시
                        print("Received data:", data)
                        // TODO: 데이터를 collectionView 및 tableView에 반영
                    case .failure(let error):
                        // 실패 시
                        print("Error:", error.localizedDescription)
                    }
                }
            })
        }
    }
}
