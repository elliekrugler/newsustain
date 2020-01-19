//
//  ViewController.swift
//  newsustain
//
//  Created by Ellie Krugler on 1/17/20.
//  Copyright © 2020 Ellie Krugler. All rights reserved.
//

import UIKit
var totalCO = 0.0
var progress = 0.0

class ViewController: UIViewController {

    var check = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var i = 0
    var n = 0
    var kg = [0.69, 1.09, 2.70, 0.20, 0.10, 1.19, 0.61, 3.92, 0.00]

    @IBOutlet weak var facts: UILabel!
    let factual = ["Meat, cheese, and eggs have the highest carbon footprint", "Cutting the tomatoes out of your BLT may be better for the environment", "Organic food isn't always better for the climate", "Going vegetarian can cut your carbon footprint in half", "There's a new meatless patty made from beetroot"]

    
    @IBAction func procedure(i: Int) {
        if check[i] == 0 {
            totalCO += kg[i]
            check[i] = 1
        }
        else {
            totalCO -= kg[i]
            check[i] = 0
        }
        print(totalCO)
    }
        
    @IBOutlet weak var chickenout: UIButton!
    
    @IBAction func chicken(_ sender: UIButton) {
        procedure(i: 0)
    }
    
    @IBAction func turkey(_ sender: UIButton) {
        procedure(i: 1)
    }
    
    @IBAction func beef(_ sender: UIButton) {
        procedure(i: 2)
    }
    
    
    @IBAction func tofu(_ sender: UIButton) {
        procedure(i: 3)
    }
    
    
    @IBAction func imitate(_ sender: UIButton) {
        procedure(i: 4)
    }
    
    
    @IBAction func salmon(_ sender: UIButton) {
        procedure(i: 5)
    }
    
    
    @IBAction func tuna(_ sender: UIButton) {
        procedure(i: 6)
    }
    
    
    @IBAction func lamb(_ sender: UIButton) {
        procedure(i: 7)
    }
    
    
    @IBAction func noMeat(_ sender: UIButton) {
        procedure(i: 8)
    }
    
    @IBOutlet weak var results: UILabel!
    
    
    @IBAction func nextButton(_ sender: UIButton) {
    }
    
    @IBSegueAction func finalSlide(_ coder: NSCoder) -> ViewController? {
        print(totalCO)
        return ViewController(coder: coder)
    }
    
    @IBOutlet weak var progressPage: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        if let facts2 = facts {
        facts2.text = "\(factual[Int.random(in: 0..<5)])"
        }
        if let results2 = results {
        let str = String(format: "%.2f", totalCO)
        print(str)
        results2.text = "\(str) kg of CO2"
        progress += totalCO
        // Do any additional setup after loading the view
    }
        if let progressPage2 = progressPage {
            let str2 = String(format: "%.2f", progress)
            progressPage2.text = "Looks like the CO2 produced from the meat you've consumed is \(str2) kg!"
        }
    }
}
