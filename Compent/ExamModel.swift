//
//  ExamModel.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/22.
//

import Foundation

class ExamModel: NSObject{
    var examTitleString: String!
    var examAnswerIndex: Int!
    var examTypeString: String!
    
    init(examTitleString: String, examAnswerIndex: Int,examTypeString: String) {
        self.examTitleString = examTitleString
        self.examAnswerIndex = examAnswerIndex
        self.examTypeString = examTypeString
    }
}
