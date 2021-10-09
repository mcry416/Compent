//
//  ExamCell.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/22.
//

import UIKit
import SnapKit

class ExamCell: UICollectionViewCell {
    
    var data: Array<ExamModel>!
    var tempIndex: Int = 0
    var isAnswerSucceed: Bool = false
    
    var examType: UILabel!
    var examTitle: UILabel!
    var examRightButton: UIButton!
    var examWrongButton: UIButton!
    var examJudgeResult: UILabel!
    var examTopicCount: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.clear
        installExamType()
        installExamTitle()
        installExamRightButton()
        installExamWrongButton()
        installExamJudgeResult()
        installExamTopicCount()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func installExamType(){
        examType = UILabel()
        examType.layer.masksToBounds = true
        examType.layer.cornerRadius = 5
        examType.font = UIFont.systemFont(ofSize: 12)
        examType.textAlignment = .center
        examType.backgroundColor = UIColor.init(red: 0, green: 0.6, blue: 0.2, alpha: 0.5)
        self.contentView.addSubview(examType)
        
        examType.snp.makeConstraints{ make in
            make.width.equalTo(35)
            make.height.equalTo(20)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.top.equalTo(self.contentView.snp.top).offset(70)
        }
    }
    
    private func installExamTitle(){
        examTitle = UILabel()
        examTitle.numberOfLines = 0
        self.contentView.addSubview(examTitle)
        
        examTitle.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 78)
            make.left.equalTo(self.examType.snp.right).offset(5)
            make.top.equalTo(self.contentView.snp.top).offset(70)
        }
    }
    
    private func installExamRightButton(){
        examRightButton = UIButton(type: UIButton.ButtonType.system)
        examRightButton.setTitle("正确", for: UIControl.State.normal)
        examRightButton.sizeToFit()
        self.contentView.addSubview(examRightButton)
        
        examRightButton.snp.makeConstraints{ make in
            make.width.equalTo(40)
            make.height.equalTo(30)
            make.top.equalTo(self.examTitle.snp.bottom).offset(66)
            make.left.equalTo(self.contentView.snp.left).offset(20)
        }
    }
    
    private func installExamWrongButton(){
        examWrongButton = UIButton(type: UIButton.ButtonType.system)
        examWrongButton.setTitle("错误", for: UIControl.State.normal)
        self.contentView.addSubview(examWrongButton)
        
        examWrongButton.snp.makeConstraints{ make in
            make.width.equalTo(40)
            make.height.equalTo(30)
            make.top.equalTo(self.examRightButton.snp.bottom).offset(36)
            make.left.equalTo(self.contentView.snp.left).offset(20)
        }
    }
    
    private func installExamJudgeResult(){
        examJudgeResult = UILabel()
        self.contentView.addSubview(examJudgeResult)
        
        examJudgeResult.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.left.equalTo(self.contentView.snp.left).offset(35)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-75)
        }
    }
    
    private func installExamTopicCount(){
        examTopicCount = UILabel()
        examTopicCount.layer.masksToBounds = true
        examTopicCount.layer.cornerRadius = 5
        examTopicCount.font = UIFont.systemFont(ofSize: 12)
        examTopicCount.textAlignment = .center
        examTopicCount.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.7)
        self.contentView.addSubview(examTopicCount)
        
        examTopicCount.snp.makeConstraints{ make in
            make.width.equalTo(70)
            make.height.equalTo(20)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-80)
        }
    }
    
}

extension ExamCell{
    
    public func setData(data: Array<ExamModel>){
        self.data = data
    }
    
    public func updateCell(indexPath: IndexPath){
        examTitle?.text = data[indexPath.row].examTitleString
        examType.text = data[indexPath.row].examTypeString
        examTopicCount.text = "\(indexPath.row)/\(data.count)"
        examJudgeResult.text = ""
    }
    
    public func responseCellEvent(i: Int){
        tempIndex = i
        examRightButton.addTarget(self, action: #selector(rightListener), for: .touchDown)
        examWrongButton.addTarget(self, action: #selector(wrongListener), for: .touchDown)
    }
    
    @objc func rightListener(){
        if data[tempIndex].examAnswerIndex == 0 {
            isAnswerSucceed = false
            examJudgeResult.text = "回答错误"
            examJudgeResult.textColor = UIColor.red
        } else if data[tempIndex].examAnswerIndex == 1 {
            isAnswerSucceed = true
            examJudgeResult.text = "回答正确"
            examJudgeResult.textColor = UIColor.systemGreen
        }
    }
    
    @objc func wrongListener(){
        if data[tempIndex].examAnswerIndex == 0 {
            isAnswerSucceed = true
            examJudgeResult.text = "回答正确"
            examJudgeResult.textColor = UIColor.systemGreen
        } else if data[tempIndex].examAnswerIndex == 1 {
            isAnswerSucceed = false
            examJudgeResult.text = "回答错误"
            examJudgeResult.textColor = UIColor.red
        }
    }
    
    // 是否回答正确
    @objc func isAnswerSucced() -> Bool{
        print("------> \(isAnswerSucceed)")
        return isAnswerSucceed
    }
}
