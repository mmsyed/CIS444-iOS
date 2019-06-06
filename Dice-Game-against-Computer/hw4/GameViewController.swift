//
//  ViewController.swift
//  hw4
//
//  Created by Mo Syed on 4/2/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var coguess: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var userimg: UIImageView!
    @IBOutlet weak var usergues: UITextField!
    @IBOutlet weak var lost: UILabel!
    @IBOutlet weak var won: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usergues.delegate = self
        self.img.image = UIImage(named: "d0.png")
        self.userimg.image = UIImage(named: "d0.png")
        //initialize()
        usergues.isEnabled = true
        self.hideKeyboardWhenTappedAround()


    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
//    }
    
    var timeswon: Int = 0 {
        didSet{
        }
    }
    var timeslost: Int = 0 {
        didSet{
        }
    }
    var compguess: Int = 0 {
        didSet{
        }
    }
    var usguess: Int = 0 {
        didSet{
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    

    func check() {
        compguess = computernumber()
        coguess.text = "\(compguess)"
        let a:Int? = Int(usergues.text ?? "0")
        usguess = a ?? 0
        if (a == compguess) {
            timeswon = timeswon + 1
            won.text = "\(timeswon)"
        }
        else {
            timeslost = timeslost + 1
            lost.text = "\(timeslost)"
        }
    }
    func next() {
        coguess.text = nil
        usergues.text = nil
        usergues.placeholder = "Enter your guess here"
        self.img.image = UIImage(named: "d0.png")
        self.userimg.image = UIImage(named: "d0.png")
    }
    
    func again() {
        timeslost = 0
        timeswon = 0
        lost.text = nil
        won.text = nil
        coguess.text = nil;
        self.img.image = UIImage(named: "d0.png")
        self.userimg.image = UIImage(named: "d0.png")

    }
    
    func computernumber() -> Int {
        let number = Int.random(in: 1 ..< 7)
        return Int(number)
    }

    
    func rest() {
        createAlert(title: "This will reset all values.", message: "contine or quit")
        usergues.text = nil
        usergues.placeholder = "Enter your guess here"
            }
    
    @IBAction func submit(_ sender: Any) {
       // edittext = false;
        check();
        updatepic();
        usergues.isEnabled = false

    }
    
    func updatepic() {
        
        switch compguess {
        case 1:
            self.userimg.image = UIImage(named: "d0.png")
            self.img.image = UIImage(named: "Dice1@2x.png")
        case 2:
            self.img.image = UIImage(named: "Dice2.png")
        case 3:
            self.img.image = UIImage(named: "Dice3.png")
        case 4:
            self.img.image = UIImage(named: "Dice4.png")
        case 5:
            self.img.image = UIImage(named: "Dice5.png")
        case 6:
            self.img.image = UIImage(named: "Dice6.png")

        default:
            self.img.image = UIImage(named: "defualt.png")

        }
        
        switch usguess {
        case 1:
            self.userimg.image = UIImage(named: "Dice1@2x.png")
        case 2:
            self.userimg.image = UIImage(named: "Dice2.png")
        case 3:
            self.userimg.image = UIImage(named: "Dice3.png")
        case 4:
            self.userimg.image = UIImage(named: "Dice4.png")
        case 5:
            self.userimg.image = UIImage(named: "Dice5.png")
        case 6:
            self.userimg.image = UIImage(named: "Dice6.png")
            
        default:
            self.userimg.image = UIImage(named: "defualt.png")
            
        }
        
        
    }
    
    @IBAction func playagain(_ sender: Any) {
        next()
//        initialize()
        usergues.isEnabled = true
    }

    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        //CREATING BUTTON
        alert.addAction(UIAlertAction(title: "Contine", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
           // print ("Contine")
            //NSLog("OK Pressed")
            self.again()
            
        }))
        
        alert.addAction(UIAlertAction(title: "quit", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("Quit")
            exit(0)
        }))
        
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func reset(_ sender: Any) {
        rest()
      //  initialize()
        usergues.isEnabled = true

    }
    
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
