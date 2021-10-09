//
//  FlowCell.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/14.
//

import UIKit
import SnapKit

class FlowCell: UICollectionViewCell {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        installLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func installLabel(){
        label = UILabel()
        label.tag = 3000
        label.textColor = .systemBlue
        self.contentView.addSubview(label)
        
        label.snp.makeConstraints{ make in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
    
}
