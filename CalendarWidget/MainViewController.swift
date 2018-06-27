//
//  MainViewController.swift
//  CalendarWidget
//
//  Created by mac on 27/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var calendarContainer: UIView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.borderWidth = 3
        containerView.layer.cornerRadius = 8
        containerView.layer.borderColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0).cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCalendarWidget(_ sender: Any) {
        containerView.isHidden = !containerView.isHidden
    }

}
