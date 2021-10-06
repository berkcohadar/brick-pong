//
//  ViewController.swift
//  brick-pong
//
//  Created by Berk Çohadar on 10/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var upperBar = UIView();
    var lowerBar = UIView();

    @IBOutlet weak var pauseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        upperBar = UIView(frame: CGRect(x: screenSize.width / 2, y: 60, width: screenSize.width / 3, height: 15))
        lowerBar = UIView(frame: CGRect(x: screenSize.width / 2, y: screenSize.height - 80, width: screenSize.width / 3, height: 15))
        
        // www.uicolor.io
        upperBar.backgroundColor = UIColor(red: 0.73, green: 0.12, blue: 0.41, alpha: 1.00)
        lowerBar.backgroundColor = UIColor(red: 0.46, green: 0.29, blue: 1.00, alpha: 1.00)
        
        upperBar.center.x = self.view.center.x
        lowerBar.center.x = self.view.center.x
        
        view.addSubview(upperBar)
        view.addSubview(lowerBar)


    }

    @IBAction func pauseAction(_ sender: Any) {
    }
    
}
