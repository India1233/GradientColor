//
//  ViewController.swift
//  GradientColor
//
//  Created by Suresh Shiga on 10/12/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var topXPositionLabel: UILabel!
    @IBOutlet weak var topYPositionLabel: UILabel!
    @IBOutlet weak var bottomXLabel: UILabel!
    @IBOutlet weak var bottomYPositionLabel: UILabel!
    
    var topXPosition:CGFloat = 0.0 {
        didSet{
            setupGradientColor()
          
        }
    }
    
    var topYPosition:CGFloat = 0.0 {
        didSet{
            setupGradientColor()
        }
    }
    
    var bottomXPosition:CGFloat = 0.0 {
        didSet{
             setupGradientColor()
            
        }
    }
    
    var bottomYPosition:CGFloat = 0.0 {
        didSet{
         setupGradientColor()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetColors()
        setupGradientColor()
    }
    
    private func setupGradientColor() {
        
        let gradientcolor              = CAGradientLayer()
        gradientcolor.frame        = self.view.bounds
        gradientcolor.colors        = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.black.cgColor,UIColor.brown.cgColor,UIColor.cyan.cgColor, UIColor.green.cgColor,UIColor.magenta.cgColor]
        gradientcolor.startPoint  = CGPoint(x: self.topXPosition, y: self.topYPosition)
        gradientcolor.endPoint   = CGPoint(x: self.bottomXPosition, y: self.bottomYPosition)
        self.view.layer.addSublayer(gradientcolor)
        
        
        self.topYPositionLabel.text = addNumberFormatt(with: topYPosition)
        self.topXPositionLabel.text = addNumberFormatt(with: topXPosition)
        self.bottomXLabel.text = addNumberFormatt(with: bottomXPosition)
        self.bottomYPositionLabel.text = addNumberFormatt(with: bottomYPosition)
        readdView()
    }

    @IBAction func topXPosition(_ sender: Any) {
        self.topXPosition += 0.1
    }
    
    @IBAction func topYPosition(_ sender: Any) {
        self.topYPosition += 0.1
    }
    
    @IBAction func bottomXPosition(_ sender: Any) {
        self.bottomXPosition += 0.1
    }
    
    @IBAction func bottomYPosition(_ sender: Any) {
        self.bottomYPosition += 0.1
    }
    
    @IBAction func reset(_ sender: Any) {
       resetColors()
    }
    
    private func resetColors() {
        self.topXPosition = 0.0
        self.topYPosition = 0.0
        self.bottomXPosition = 0.0
        self.bottomYPosition = 0.0
    }
    
    private func readdView() {
        self.view.addSubview(stackView)
    }
    
    private func addNumberFormatt(with number: CGFloat) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.maximumFractionDigits = 2
        return "\(String(describing: numberFormat.string(from: NSNumber(value: Double(number)))!))"
    }
}

