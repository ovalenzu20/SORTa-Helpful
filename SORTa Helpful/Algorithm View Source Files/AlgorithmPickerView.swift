//
//  AlgorithmPickerView.swift
//  SORTa Helpful
//
//  Created by Teran on 7/31/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit


class CustomPickerView: UIPickerView {
    var currentAlgorithm : Algorithm!
    var algorithmData    : [Algorithm]!
}



extension CustomPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
    }
}



extension CustomPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func numberOfRows(inComponent component: Int) -> Int {
        return algorithmData.count - 1
    }
}
