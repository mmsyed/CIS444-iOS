//
//  ViewController.swift
//  HW2.0
//
//  Created by Mo Syed on 2/4/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var expressionlabel: UILabel!
    @IBOutlet weak var solutionlabel: UILabel!
    @IBOutlet weak var countlabel: UILabel!
    
    var solution: Int = 0 {
        didSet{
        }
    }
    
    var count: Int = 0 {
        didSet{
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func playbutton(_ sender: Any){
        solution = Int(genandsolve())
        solutionlabel.text = "???"
        (sender as AnyObject).setTitle("Play again", for: .normal)
        count = count + 1
        countlabel.text = "\(count)"

    }
    
    func genandsolve() -> Double {
        
        let number1 = (arc4random_uniform(101))
        let number2 = (arc4random_uniform(101))
        
        expressionlabel.text = "\(number1) + \(number2)"
        let solution = number1 + number2
        return Double(solution)
        
    }
    
    
    
    @IBAction func solvebutton(_ sender: Any) {
        solutionlabel.text = "\(solution)"
        
    }
    
    

}

