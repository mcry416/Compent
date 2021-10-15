//
//  VideoViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit

class VideoViewController: UIViewController, UICollectionViewDelegate {
    
    var videoView: VideoView!
    var videoDataSource: VideoDataSource!
    var dataArray: Array<String>!
    
    private func initView(){
        videoView = VideoView(frame: self.view.frame)
        self.view.addSubview(videoView)
        
        initData()
        videoView.videoCollectionView.delegate = self
        videoView.videoCollectionView.dataSource = self.videoDataSource
        
    }
    
    private func initConfig(){
        self.navigationItem.title = "Video"
    }
    
    private func initData(){
        dataArray = Array<String>()
        for _ in 0..<10 {
            dataArray.append("Java")
        }
        videoDataSource = VideoDataSource(dataArray: dataArray)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        initConfig()
    }
    

}
