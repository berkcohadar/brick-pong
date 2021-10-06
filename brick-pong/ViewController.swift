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
    
    @IBOutlet weak var gameContainer: UIView!
    @IBOutlet weak var gameBarContainer: UIView!
    var pinkBar = UIView();
    var blueBar = UIView();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pinkBar = UIView(frame: CGRect(x: screenSize.width / 2, y: 60, width: screenSize.width / 3, height: 15))
        blueBar = UIView(frame: CGRect(x: screenSize.width / 2, y: screenSize.height - 80, width: screenSize.width / 3, height: 15))
        
        // www.uicolor.io
        pinkBar.backgroundColor = UIColor(red: 0.73, green: 0.12, blue: 0.41, alpha: 1.00)
        blueBar.backgroundColor = UIColor(red: 0.46, green: 0.29, blue: 1.00, alpha: 1.00)
        
        pinkBar.center.x = self.view.center.x
        blueBar.center.x = self.view.center.x
                
        //gameContainer.addSubview(pinkBar)
        //gameContainer.addSubview(blueBar)
        gameContainer.addSubview(gameBarContainer)
        
        gameContainer.layer.borderWidth = 3
        gameContainer.layer.borderColor = UIColor(red: 0.34, green: 0.26, blue: 0.99, alpha: 1.00).cgColor
        
        
        pinkScore.textColor = UIColor(red: 0.73, green: 0.12, blue: 0.41, alpha: 1.00)
        blueScore.textColor = UIColor(red: 0.46, green: 0.29, blue: 1.00, alpha: 1.00)
        
        pinkScore.text = "P"
        blueScore.text = "B"
        
        //pinkScore.center.x = gameBarContainer.center.x - 23
        //blueScore.center.x = gameBarContainer.center.x + 23

    }
    
}
