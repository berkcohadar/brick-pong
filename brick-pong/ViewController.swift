//
//  ViewController.swift
//  brick-pong
//
//  Created by Berk Çohadar on 10/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
        
    @IBOutlet weak var pinkScore: UILabel!
    @IBOutlet weak var blueScore: UILabel!
    let pinkScoreInt: Int = 0;
    let blueScoreInt: Int = 0;
    
    @IBOutlet weak var gameContainer: UIView!
    @IBOutlet weak var gameBarContainer: UIView!
    @IBOutlet weak var gameAreaContainer: UIView!
    
    @IBOutlet weak var pinkBar: UIView!
    @IBOutlet weak var blueBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topBorder = CALayer()
        topBorder.borderColor = UIColor(red: 0.34, green: 0.26, blue: 0.99, alpha: 1.00).cgColor
        topBorder.borderWidth = 1;
        topBorder.frame = CGRect(x: 0, y: 30, width: 1, height:  gameContainer.frame.height-35)
        gameContainer.layer.addSublayer(topBorder)
        
        let bottomBorder = CALayer()
        bottomBorder.borderColor = UIColor(red: 0.34, green: 0.26, blue: 0.99, alpha: 1.00).cgColor
        bottomBorder.borderWidth = 1;
        bottomBorder.frame = CGRect(x: gameContainer.frame.width, y: 30, width: 1, height: gameContainer.frame.height-35)
        gameContainer.layer.addSublayer(bottomBorder)
        
        let leftSideBorder = CALayer()
        leftSideBorder.borderColor = UIColor(red: 0.34, green: 0.26, blue: 0.99, alpha: 1.00).cgColor
        leftSideBorder.borderWidth = 10;
        leftSideBorder.frame = CGRect(x: 0, y: gameContainer.frame.height-5, width: gameContainer.frame.width, height:1)
        gameContainer.layer.addSublayer(leftSideBorder)
        
        gameBarContainer.layer.cornerRadius = 10
        gameBarContainer.clipsToBounds = true
        
        pinkBar.layer.cornerRadius = 8
        pinkBar.clipsToBounds = true
        blueBar.layer.cornerRadius = 8
        blueBar.clipsToBounds = true
        
        // www.uicolor.io
        pinkBar.backgroundColor = UIColor(red: 0.73, green: 0.12, blue: 0.41, alpha: 1.00)
        blueBar.backgroundColor = UIColor(red: 0.46, green: 0.29, blue: 1.00, alpha: 1.00)
        
        pinkScore.textColor = UIColor(red: 0.73, green: 0.12, blue: 0.41, alpha: 1.00)
        blueScore.textColor = UIColor(red: 0.46, green: 0.29, blue: 1.00, alpha: 1.00)
        
        pinkScore.text = "0"
        blueScore.text = "0"
        
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: gameContainer.frame.width).isActive = true
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        
        //NSLayoutConstraint(item: pinkBar!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 0).isActive = true
        //NSLayoutConstraint(item: pinkBar!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        
        //NSLayoutConstraint(item: blueBar!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: pinkBar!, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: gameContainer.frame.size.width).isActive = true
        //NSLayoutConstraint(item: blueBar!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        
    }
    
}
