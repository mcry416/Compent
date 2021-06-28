//
//  MyCell.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/28.
//

import UIKit
import SnapKit

class MyCell: UITableViewCell {
    
    var cellImageView: UIImageView!
    var cellContentLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.isUserInteractionEnabled = true
         
        installCellImageView()
        installCellCOntentLabel()
    }
    
    private func installCellImageView(){
        cellImageView = UIImageView()
        cellImageView.tag = 1001
        self.contentView.addSubview(cellImageView)
        
        cellImageView.snp.makeConstraints{ make in
            make.size.equalTo(35)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private func installCellCOntentLabel(){
        cellContentLabel = UILabel()
        cellContentLabel.numberOfLines = 0
        cellContentLabel.font = UIFont.systemFont(ofSize: 14)
        cellContentLabel.tag = 1002
        self.contentView.addSubview(cellContentLabel)
        
        cellContentLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.contentView.snp.top).offset(8)
            make.left.equalTo(self.cellImageView.snp.right).offset(20)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
        }
    }
    
    // MARK: - Defalut method.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
