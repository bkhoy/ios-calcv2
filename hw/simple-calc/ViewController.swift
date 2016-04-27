//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 4/21/16.
//  Copyright © 2016 Brittney Hoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display : UILabel!
    
    //Regular calculator
    var isNumberPressed = false
    var enterOperation = true
    var op1 : String = ""
    var numbers = [Double]()
    var result : Double = 0.0
    var num1 : Double = 0.0
    
    //History values
    var showHistory : String = "History"
    var history = [String]()
    
    var showValue : Double {
        get {
            return NSNumberFormatter ().numberFromString(display.text!)!.doubleValue
        } set {
            display.text = "\(newValue)"
            isNumberPressed = false
        }
    }
    
    @IBAction func numberPressed (sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isNumberPressed {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isNumberPressed = true
        }
        
    }

    func enter() {
        isNumberPressed = false
        numbers.append(showValue)
    }
    
    
    @IBAction func clear () {
        showValue = 0
        display.text = "\(Int(showValue))"
        isNumberPressed = false
        enterOperation = true
        op1 = ""
        numbers = [Double]()
        result = 0.0
        num1 = 0.0
    }
    
    var average : Int = 0
    
    @IBAction func operate (sender: UIButton) {
        if isNumberPressed {
            enter()
        }
        
        if enterOperation {
            op1 = sender.currentTitle!
            enterOperation = false
            
        } else {
        
            num1 = numbers[0]
        
            if numbers.count > 1 {
                switch op1 {
                    case "+": result = numbers[0] + numbers[1]
                    case "-": result = numbers[0] - numbers[1]
                    case "x": result = numbers[0] * numbers[1]
                    case "/": result = numbers[0] / numbers[1]
                    case "%": result = numbers[0] % numbers[1]
                    case "AVG": result = avg(numbers)
                    case "COUNT": result = Double(numbers.count)
                default: break
                }
            }
            display.text = "\(result)"
        }
        
    }
    
    func avg(values : [Double]) -> Double {
        var total = 0.0
        for value in values {
            total += Double(value)
        }
        return total/Double(values.count)
    }

    
    @IBAction func fact(sender: UIButton) {
        var number = Int(showValue)
        var answer = number
        while number > 1 {
            number -= 1
            answer *= number
        }
        display.text = "\(answer)"
    }
    
    //Shows history view
    @IBAction func DisplayHistory(sender: UIButton) {
        for i in 0..<history.count {
            showHistory += (history[i] + "\n")
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "HistorySegue") {
            let DestViewController: HistoryView = segue.destinationViewController as! HistoryView
            DestViewController.historyResults = showHistory

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

