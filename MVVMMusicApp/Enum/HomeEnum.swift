//
//  HomeEnum.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import Foundation

enum HomeResult {
    case newReleases(data : [NewRealeaseModel])
    case playlist(data : [PlaylistModel])
    case recommend(data : [RecommendModel])
    
    var title: String {
        switch self {
            case .newReleases:
                return "New Released Albums"
            case .playlist:
                return "Playlists"
            case .recommend:
                return "For you"
        }
    }
}
