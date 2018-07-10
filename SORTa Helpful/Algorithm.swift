//
//  SearchCellData.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation


class Algorithm {
    var name        : String
    var algoClass   : String
    var algoType    : String
    var bestCase    : String
    var averageCase : String
    var worstCase   : String
    
    init(name: String, algoClass: String, algoType: String, bestCase: String, averageCase: String, worstCase: String) {
        self.name = name
        self.algoClass = algoClass
        self.algoType = algoType
        self.bestCase = bestCase
        self.averageCase = averageCase
        self.worstCase = worstCase
    }
}
