//
//  HomeViewModel.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import Foundation

class HomeViewModel {
    
    var homeSection:[HomeResult] = []
    
    func getData(completion: @escaping (Bool) -> Void){
        
        var newRelease: [NewRealeaseModel]?
        var playlists: [PlaylistModel]?
        var recommend: [RecommendModel]?
        
        let group = DispatchGroup()
        group.enter()
        group.enter()
        group.enter()
        
        ApiManagers.shared.getNewReleases {newReleaseData in
            defer{
                group.leave()
            }
            if let newReleaseData = newReleaseData {
                newRelease = newReleaseData
            }
        }
        
        ApiManagers.shared.getFeaturedPlaylists {featuredPlaylistsData in
            defer{
                group.leave()
            }
            if let featuredPlaylistData = featuredPlaylistsData {
                playlists = featuredPlaylistData
            }
        }
        
        
        ApiManagers.shared.getRecommend { recommendationsPlayListData in
            defer{
                group.leave()
            }
            if let recommendationsPlayListData = recommendationsPlayListData {
                recommend = recommendationsPlayListData
            }
            
        }
        
        group.notify(queue: .main) {[weak self] in
            if let newRelease = newRelease,let playlists = playlists,let recommend = recommend{
                self?.homeSection = [
                    .newReleases(data: newRelease),
                    .playlist(data: playlists),
                    .recommend(data: recommend)
                ]
                completion(true)
            }
            else {
                completion(false)
                
            }
        }
    }
}
