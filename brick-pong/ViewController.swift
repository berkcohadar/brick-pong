//
//  ViewController.swift
//  brick-pong
//
//  Created by Berk Çohadar on 10/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds // the dimensions of all sides of phone
        
    @IBOutlet weak var pinkScore: UILabel! // pinkPlayer scoreboard
    @IBOutlet weak var blueScore: UILabel! // bluePlayer scoreboard
    let pinkScoreInt: Int = 0; // pinkPlayer score value as int
    let blueScoreInt: Int = 0; // bluePlayer score value as int
    
    @IBOutlet weak var gameContainer: UIView! // whole table
    @IBOutlet weak var gameBarContainer: UIView! // only the scoreboard
    @IBOutlet weak var gameAreaContainer: UIView! // only the game area
    
    @IBOutlet weak var pinkBar: UIView! // pinkPlayer bar
    @IBOutlet weak var blueBar: UIView! // bluePlayer bar
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First, I constructed the game area with CALayers.
        // I do not want a right-side layer because I have scoreboard on the right.
        // I used CALayer instead of borders because I wanted flexible layers. I could not delete the right-side border when I was working with default borders.
        
        // pinkPlayer side border
        let topBorder = CALayer()
        topBorder.borderColor = UIColor(red: 0.34, green: 0.26, blue: 0.99, alpha: 1.00).cgColor
        topBorder.borderWidth = 1;
        topBorder.frame = CGRect(x: 0, y: 30, width: 1, height:  gameContainer.frame.height-35)
        gameContainer.layer.addSublayer(topBorder)
        
        // bluePlayer side border
        let bottomBorder = CALayer()
        bottomBorder.borderColor = UIColor(red: 0.34, green: 0.26, blue: 0.99, alpha: 1.00).cgColor
        bottomBorder.borderWidth = 1;
        bottomBorder.frame = CGRect(x: gameContainer.frame.width, y: 30, width: 1, height: gameContainer.frame.height-35)
        gameContainer.layer.addSublayer(bottomBorder)
        
        // scoreboard opposite side border
        let leftSideBorder = CALayer()
        leftSideBorder.borderColor = UIColor(red: 0.34, green: 0.26, blue: 0.99, alpha: 1.00).cgColor
        leftSideBorder.borderWidth = 10;
        leftSideBorder.frame = CGRect(x: 0, y: gameContainer.frame.height-5, width: gameContainer.frame.width, height:1)
        gameContainer.layer.addSublayer(leftSideBorder)
        
        // Design improvement.
        gameBarContainer.layer.cornerRadius = 10
        gameBarContainer.clipsToBounds = true
        pinkBar.layer.cornerRadius = 8
        pinkBar.clipsToBounds = true
        blueBar.layer.cornerRadius = 8
        blueBar.clipsToBounds = true
        
        // There is not much customization in default colors.
        // Also, there is wasn't an input option for #hex values in UIColor constructor.
        // Therefore, I found a website which can create a UIColor constructor with a given hex value.
        // www.uicolor.io
        pinkBar.backgroundColor = UIColor(red: 0.73, green: 0.12, blue: 0.41, alpha: 1.00)
        blueBar.backgroundColor = UIColor(red: 0.46, green: 0.29, blue: 1.00, alpha: 1.00)
        
        pinkScore.textColor = UIColor(red: 0.73, green: 0.12, blue: 0.41, alpha: 1.00)
        blueScore.textColor = UIColor(red: 0.46, green: 0.29, blue: 1.00, alpha: 1.00)
        
        // Scoreboards initial text
        pinkScore.text = String(pinkScoreInt)
        blueScore.text = String(blueScoreInt)
        

        
        // Constraints for UIViews
        // gameContainer view. I determined leading, trailing, top, and bottom constraints.
        // The gameContainer view forms the baseline of our game.
        // So, its bounds should be the same as safe area's bounds.
        //top
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0).isActive = true
        //leading
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        //bottom
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        //trailing
        NSLayoutConstraint(item: gameContainer!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: gameContainer.frame.width).isActive = true

        
        // The gameBarContainer is the container for our scoreboard. It has a fixed size. height = 30.
        //top
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0).isActive = true
        //leading
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        //bottom
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 30).isActive = true
        //trailing
        NSLayoutConstraint(item: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0).isActive = true
        
        // gameAreaContainer is the exact area that our game will be played.
        // it's bounds are fixed to =>
        // gameAreaContainer = gameContainer - gameBarContainer
        //top
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameBarContainer!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        //leading
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0).isActive = true
        //bottom
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        //trailing
        NSLayoutConstraint(item: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameContainer!, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0).isActive = true

        // Bar constraints. Determining locations.
        
        //NSLayoutConstraint(item: pinkBar!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 0).isActive = true
        //NSLayoutConstraint(item: pinkBar!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        
        //NSLayoutConstraint(item: blueBar!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: pinkBar!, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: gameContainer.frame.size.width).isActive = true
        //NSLayoutConstraint(item: blueBar!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: gameAreaContainer!, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        
    }
    
}
