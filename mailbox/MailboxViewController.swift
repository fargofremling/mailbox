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
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var deleteView: UIImageView!
    @IBOutlet weak var archiveView: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var subjectView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mailboxScrollView.contentSize = CGSize (width: 320, height: 1432)
        deleteView.alpha = 0
        archiveView.alpha = 0
        rescheduleView.alpha = 0
        listView.alpha = 0
        subjectView.alpha = 1
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
        }
        
        else if sender.state == UIGestureRecognizerState.Changed {
            if velocity.x > 0 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.rescheduleReveal()
                })
            }
            else {
                UIView.animateWithDuration(0.3, animations:
                    { () -> Void in
                    self.deleteReveal()
                })
            }
            
        }
        else if sender.state == UIGestureRecognizerState.Ended {
        
        }
    }
    
    func rescheduleReveal () {
        messageView.backgroundColor = UIColor.yellowColor()
        rescheduleView.alpha = 1
        
    }
    
    func listReveal () {
        messageView.backgroundColor = UIColor.brownColor()
        listView.alpha = 1
    }
    
    func archiveReveal () {
        messageView.backgroundColor = UIColor.greenColor()
        archiveView.alpha = 1
    }
    
    func deleteReveal () {
        messageView.backgroundColor = UIColor.redColor()
        deleteView.alpha = 1
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
