//
//  SlideView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/8/9.
//

import UIKit
import SnapKit

class SlideView: UIView {
    
    public var CELL_ID = "SLIDE_CELL_ID"
    
    public var rootView: UIScrollView!
    public var headerImageView: UIImageView!
    public var slideTableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        installRootView()
        installUIImageView()
        installUITableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Widgets block.
    private func installRootView(){
        rootView = UIScrollView()
        rootView.contentSize = CGSize(width: self.frame.size.width, height: (self.frame.size.height * 2))
        rootView.isScrollEnabled = true
        self.addSubview(rootView)
        
        rootView.snp.makeConstraints{ make in
            make.top.equalTo(self.safeAreaInsets.top)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height)
        }
    }
    
    private func installUIImageView(){
        headerImageView = UIImageView()
        headerImageView.image = UIImage(named: "taylor")
        headerImageView.contentMode = .scaleAspectFill
        self.rootView.addSubview(headerImageView)
        
        headerImageView.snp.makeConstraints{ make in
            make.top.equalTo(self.rootView.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.rootView.frame.size.width)
            make.height.equalTo(self.rootView.frame.size.width)
        }
        NSLog("SNAPKIT.")
    }
    
    private func installUITableView(){
        slideTableView = UITableView(frame: CGRect(x: 0, y: Int(self.headerImageView.frame.height), width: Int(self.frame.size.width), height: Int((self.frame.size.height * 2) - self.headerImageView.frame.height)), style: UITableView.Style.plain)
        slideTableView.isScrollEnabled = false
        slideTableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)
        self.rootView.addSubview(slideTableView)
        
        slideTableView.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.size.width)
            make.height.equalTo(1300)
            make.top.equalTo(self.headerImageView.snp.bottom)
        }
        
    }

}
