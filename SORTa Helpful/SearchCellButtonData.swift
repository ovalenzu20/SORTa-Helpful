//
//  SearchCellButtonData.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation


class SearchCellButtonData {
    var name        : String
    var bestCase    : String
    var averageCase : String
    var worstCase   : String
    
    init(name: String, bestCase: String, averageCase: String, worstCase: String) {
        self.name = name
        self.bestCase = bestCase
        self.averageCase = averageCase
        self.worstCase = worstCase
    }
}
