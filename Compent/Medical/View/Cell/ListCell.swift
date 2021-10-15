//
//  ListCell.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit
import SnapKit

class ListCell: UICollectionViewCell{
    
    var cellLabel: UILabel!
    var rootImageView: UIImageView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installRootImageView()
        installCellLabel()
    }
    
    // MARK: - Constraight block for cell widget.
    private func installRootImageView(){
        rootImageView = UIImageView()
        rootImageView.backgroundColor = UIColor.white
        rootImageView.layer.cornerRadius = 20
        self.addSubview(rootImageView)
        
        rootImageView.snp.makeConstraints{ make in
            make.width.equalTo(self.contentView.frame.width - 80)
            make.height.equalTo(140)
            make.centerX.equalToSuperview()
        }
    }

    private func installCellLabel(){
        cellLabel = UILabel()
        cellLabel.tag = 1001
        cellLabel.font = UIFont.systemFont(ofSize: 20)
        self.rootImageView.addSubview(cellLabel)
        
        cellLabel.snp.makeConstraints{ make in
            make.width.equalTo(70)
            make.height.equalTo(35)
            make.left.equalTo(self.rootImageView.snp.left).offset(39)
            make.centerY.equalTo(self.rootImageView)
        }
 
    }
    
}

