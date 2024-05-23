//
//  HomeViewController.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel = HomeViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadFailLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        configureCollectionView()
        
        viewModel.getData {[weak self] isSuccess in
            if isSuccess{
                self?.collectionView.reloadData()
            }
            else{
                self?.loadFailLabelOutlet.isHidden = false
            }
        }
    }
    
    func setupNavigationBar(){
        let title = UILabel()
        title.text = "Music"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        navigationItem.standardAppearance = appearance
        navigationItem.compactAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    //MARK: - Configure collectionview
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.collectionViewLayout = HomeCollectionViewLayout()
        
        collectionView.register(TitleHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier)
        collectionView.register(UINib(nibName: NewRealeseCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: NewRealeseCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: PlaylistCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PlaylistCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: RecommendCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.homeSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = viewModel.homeSection[section]
        switch type {
            case .newReleases(let listNewRelease):
                return listNewRelease.count
            case .playlist(let playLists):
                return playLists.count
            case .recommend(let listRecommend):
                return listRecommend.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier, for: indexPath) as! TitleHeaderCollectionReusableView
            headerView.setTileLabel(title: viewModel.homeSection[indexPath.section].title)
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = viewModel.homeSection[indexPath.section]

        switch type {
            case .newReleases(let listNewRelease):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewRealeseCollectionViewCell.identifier, for: indexPath) as! NewRealeseCollectionViewCell
                cell.setupContent(data: listNewRelease[indexPath.item])
                return cell
            case .playlist(let playLists):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistCollectionViewCell.identifier, for: indexPath) as! PlaylistCollectionViewCell
                cell.setupContent(data: playLists[indexPath.item])
                return cell
            case .recommend(let listRecommend):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as! RecommendCollectionViewCell
                cell.setupContent(data: listRecommend[indexPath.item])
                return cell
        }
    }    
}
