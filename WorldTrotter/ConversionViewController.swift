//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Luke Markham on 22/07/2017.
//  Copyright © 2017 Luke Markham. All rights reserved.
//

import UIKit

class ConversionViewController:UIViewController,UITextFieldDelegate{
    @IBOutlet var celsiusLabel : UILabel!
    
    var fahrenheitValue: Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value-32)*(5/9)
        }
        else {
            return nil
        }
    }
    
    func textField(_ textField:UITextField,
                   shouldChangeCharactersIn shouldChangeCharactersInRange:NSRange,
                   replacementString string: String)->Bool {
        print("Current text: \(textField.text)")
        print("Replacement text: \(string)")
        return true
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
        //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value:value))
    }
    else{
    celsiusLabel.text = "???"
    }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenheitFeildEditingChanged(textField:UITextField){
        
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = value
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
}
