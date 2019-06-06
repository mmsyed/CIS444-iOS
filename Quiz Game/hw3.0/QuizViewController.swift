//
//  ViewController.swift
//  hw3.0
//
//  Created by Mo Syed on 2/26/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var exp1: UILabel!
    @IBOutlet weak var exp2: UILabel!
    @IBOutlet weak var exp3: UILabel!
    @IBOutlet weak var us1: UITextField!
    @IBOutlet weak var us2: UITextField!
    @IBOutlet weak var us3: UITextField!
    @IBOutlet weak var checklabel: UILabel!
    
    
    var correct: Int = 0 {
        didSet{
        }
    }
    
    var edittext: Bool = true {
        didSet {
        
        }
    }

    var solution1: Int = 0 {
        didSet{
        }
    }

    var solution2: Int = 0 {
        didSet{
        }
    }

    var solution3: Int = 0 {
        didSet{
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        configuretexts()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(QuizViewController.closeKeyboard))

        view.addGestureRecognizer(tap)
        us1.delegate = self
        us2.delegate = self
        us3.delegate = self

    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }

    func initialize() {
        solution1 = expression1()
        solution2 = expression2()
        solution3 = expression3()
        us1.text = nil
        us2.text = nil
        us3.text = nil
        us1.placeholder = "?"
        us2.placeholder = "?"
        us3.placeholder = "?"
    }
    
    
    private func configuretexts() {
        us1.delegate = self
        us2.delegate = self
        us3.delegate = self
    }
    
    private func configureg() {
        let tapg = UITapGestureRecognizer(target: self, action: #selector(QuizViewController.handleTap))
        view.addGestureRecognizer(tapg)
    }
    
    @objc func handleTap() {
        view.endEditing(true )
    }
    
    
    @IBAction func submitted(_ sender: Any) {
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let id1 = us1.restorationIdentifier
        let id2 = us2.restorationIdentifier
        let id3 = us3.restorationIdentifier

//        if (string == "0" && id1 == "plus") {
//            if (solution1 == 0) {
//                return true
//            }
//            return false
//        }
//
//        if (string == "0" && id2 == "minus") {
//            if (solution2 == 0) {
//                return true
//            }
//            return false
//        }
        
        if (string == "0" && id3 == "*") {
            if (solution3 == 0) {
                return true
            }
            return false
        }
        
        return true
    }

//        if us3.text?.count == 0 && string == "0" {
//            if ( (solution3 == 0)) {
//            return true
//        }
//            return false
//        }
//        return true
//    }

    
    func expression1() -> Int {
        
        let number1 = (arc4random_uniform(101))
        let number2 = (arc4random_uniform(101))
        
        exp1.text = "\(number1) + \(number2)"
        let solution1 = number1 + number2
        return Int(solution1)
    }
    func expression2() -> Int {
        
        let number1 = (arc4random_uniform(101))
        let number2 = (arc4random_uniform(101))
        
        exp2.text = "\(number1) - \(number2)"
        let solution2 = (Int(number1) - Int(number2))
        return Int(solution2)
    }
    
    func expression3() -> Int {
        
        let number1 = (arc4random_uniform(101))
        let number2 = (arc4random_uniform(101))
        
        exp3.text = "\(number1) * \(number2)"
        let solution3 = number1 * number2
        return Int(solution3)
    }
    @IBAction func next(_ sender: Any) {
        //checksols() {
        checklabel.text = ""
        initialize()
        edittext = true
        //viewDidLoad()
    }
    
    func checksols() {
        let a:Int? = Int(us1.text ?? "0")
        let b:Int? = Int(us2.text ?? "0")
        let c:Int? = Int(us3.text ?? "0")

        if (a == solution1) {
            correct = correct + 1;
        }
        if (b == solution2) { correct = correct+1}
        if (c == solution3) { correct = correct+1 }
        checklabel.text = String(correct) + " Correct answers"
        
}
    
    @IBAction func submit(_ sender: Any) {
        correct = 0
        checklabel.text = ""
        edittext = false
        checksols()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return edittext
    }
}
