//
//  EmailSignupVC.swift
//  SousChef
//
//  Created by Kelly Morrison on 2017-02-01.
//  Copyright © 2017 Kelly Morrison. All rights reserved.
//

import UIKit

class EmailSignupVC: UIViewController {

    @IBOutlet weak var enterEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributes = [
            NSForegroundColorAttributeName: UIColor.darkGray,
            NSFontAttributeName : UIFont(name: "Arial", size: 20)! //TODO: update to simplifica
        ]
        
        enterEmail.attributedPlaceholder = NSAttributedString(string: "Enter Email", attributes:attributes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
