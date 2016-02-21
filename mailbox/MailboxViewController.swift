//
//  MailboxViewController.swift
//  mailbox
//
//  Created by Fremling, Alicia (Contractor) on 2/20/16.
//  Copyright © 2016 FargoFremling. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var mailboxScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mailboxScrollView.contentSize = CGSize (width: 320, height: 1432)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
