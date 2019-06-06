//
//  fifthViewController.swift
//  fitplanner
//
//  Created by Mo Syed on 5/1/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class fifthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let exer1 = ["Treadmill", "Bicycle", "Stairmaster", "Rowing", "Swimming", "aerobics" ]
    let exer2  = ["Upper body + Treadmill", "Lower body + Rowing", "full body + stairmaster", "Chest/Arms + Swimming"]
    let exer3 = ["Upper body", "lower body", "full body", "chest", "arms", "back", "legs", "shoulders"]
    
    
    
    var selectedexer = String()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (selectedexer.contains("1")) {
            return exer1.count
        }
        else if (selectedexer.hasPrefix("2")) {
            return exer2.count
        }
        else {
            return exer3.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        if (selectedexer.contains("1")) {
            cell1.textLabel?.text = exer1[indexPath.row]        }
        else if (selectedexer.hasPrefix("2")) {
            cell1.textLabel?.text = exer2[indexPath.row]        }
        else {
            cell1.textLabel?.text = exer3[indexPath.row]        }
        
        return cell1
    }
    
    func check() {
    print(selectedexer)
    }

    @IBAction func quit(_ sender: Any) {
        exit(0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.dataSource = self
        
       //  check()
        // Do any additional setup after loading the view.
       
    }
    
    
    @IBAction func ch(_ sender: Any) {
        check()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
