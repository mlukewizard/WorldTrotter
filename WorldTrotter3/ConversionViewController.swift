//
//  ConversionViewController.swift
//  WorldTrotter3
//
//  Created by Luke on 29/07/2017.
//  Copyright © 2017 LukeLuke. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController{
    @IBOutlet var celsiusLabel : UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue:Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue:Double?{
        if let value = fahrenheitValue {
            return (value-32)*(5/9)
        }
        else{
            return nil
        }
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
    let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    @IBAction func fahrenheitFieldEditingChanged(textField:UITextField){
        if let text = textField.text, value = Double(text){
            fahrenheitValue = value
        }
        else{
            fahrenheitValue = nil
        }
        }
    
    @IBAction func dismissKeyboard(sender:AnyObject){
        textField.resignFirstResponder()
    }
}

