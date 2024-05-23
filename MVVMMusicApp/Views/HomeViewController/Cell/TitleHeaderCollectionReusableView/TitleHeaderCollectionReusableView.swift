//
//  TitleHeaderCollectionReusableView.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "TitleHeaderCollectionReusableView"

    let titleLabel:UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 10, y: 0, width: width - 20, height: height)
    }
    
    func setTileLabel(title: String){
        titleLabel.text = title
    }
}
