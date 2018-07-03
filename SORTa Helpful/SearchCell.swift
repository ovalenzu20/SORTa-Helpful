//
//  SearchCell.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


class SearchCell: UITableViewCell {
    
    @IBOutlet weak var algoNameLabel: UILabel!
    @IBOutlet weak var bestCaseLabel: UILabel!
    @IBOutlet weak var averageCaseLabel: UILabel!
    @IBOutlet weak var worstCaseLabel: UILabel!
    
    func setSearchButtonLabels(buttonData: SearchCellButtonData) {
        algoNameLabel.text    = buttonData.name
        bestCaseLabel.text    = buttonData.bestCase
        averageCaseLabel.text = buttonData.averageCase
        worstCaseLabel.text   = buttonData.worstCase
    }
}
