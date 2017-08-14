//
//  ViewController.swift
//  Calculator 2.0
//
//  Created by Hamzah Mugharbil on 8/14/17.
//  Copyright © 2017 Hamzah Mugharbil. All rights reserved.
//

import UIKit

enum Mode {
    case addition, subtraction, multiplication, division, not_set
}

class ViewController: UIViewController {
    
    var labelString: String = "0"
    var currentMode: Mode = .not_set
    var savedNum: Int = 0
    var lastButtonWasMode: Bool = false
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    
        
    }
    
    
    
    func updateText() {
        
        guard let labelInt = Int(labelString) else { return }
        
        if currentMode == .not_set {
            savedNum = labelInt
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let num: NSNumber = NSNumber(value: labelInt)
        
        label.text = formatter.string(from: num)
        
    }
    
    func changeMode(to newMode: Mode) {
        
        if savedNum == 0 { return }
        
        currentMode = newMode
        lastButtonWasMode = true
    }
    
    @IBAction func pressedPlus(_ sender: Any) {
        
        changeMode(to: .addition)
        
    }
    
    @IBAction func pressedMinus(_ sender: Any) {
        
        changeMode(to: .subtraction)
        
    }
    
    @IBAction func pressedMultiply(_ sender: Any) {
        
        changeMode(to: .multiplication)
        
    }
    
    @IBAction func pressedDivide(_ sender: Any) {
        
        changeMode(to: .division)
        
    }
    
    @IBAction func pressedEquals(_ sender: Any) {
        
        guard let labelInt = Int(labelString) else { return }
        
        
        if currentMode == .not_set || lastButtonWasMode { return }
        
        switch currentMode {
        
        case .addition:
            savedNum += labelInt
       
        case .subtraction:
            savedNum -= labelInt
        
        case .multiplication:
            savedNum *= labelInt
        
        case .division:
            savedNum = Int(Double(savedNum) / Double(labelInt))
        
        default:
            break
            
        }
        
        
        
        currentMode = .not_set
        
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
        
    }
    
     @IBAction func pressedClear(_ sender: Any) {
        
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        updateText()
    }
    
    @IBAction func pressedNumber(_ sender: UIButton) {
        
        let stringValue: String? = sender.titleLabel?.text
        
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString += stringValue!
        updateText()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

