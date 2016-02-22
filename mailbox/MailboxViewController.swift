//
//  MailboxViewController.swift
//  mailbox
//
//  Created by Fremling, Alicia (Contractor) on 2/20/16.
//  Copyright © 2016 FargoFremling. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIImageView!
    @IBOutlet weak var inboxView: UIView!
    @IBOutlet weak var mailboxScrollView: UIScrollView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var deleteView: UIImageView!
    @IBOutlet weak var archiveView: UIImageView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var subjectView: UIImageView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var listPageView: UIImageView!
    @IBOutlet weak var reschedulePageView: UIImageView!
    
    @IBOutlet weak var menuButton: UIButton!
    var subjectOriginalCenter: CGPoint!
    
    var inboxViewOriginalCenter: CGPoint!
    
    var rescheduleViewOrigianlCenter:CGPoint!
    var archiveViewOriginalCenter: CGPoint!
    
    var messageHiddenOffset: CGFloat!
    var feedViewOriginalCenter: CGPoint!
    var messageHiddenMoveFeed: CGPoint!
    
    var edgeGesture: UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inboxViewOriginalCenter = inboxView.center
        self.mailboxScrollView.contentSize = CGSize (width: 320, height: 1432)
        subjectOriginalCenter = subjectView.center
        archiveViewOriginalCenter = archiveView.center
        rescheduleViewOrigianlCenter = rescheduleView.center
        messageHiddenOffset = 86
        feedViewOriginalCenter = feedView.center
        messageHiddenMoveFeed = CGPoint (x: feedView.center.x, y: feedView.center.y + messageHiddenOffset)
        menuView.alpha = 0
        deleteView.alpha = 0
        archiveView.alpha = 0
        rescheduleView.alpha = 0
        listView.alpha = 0
        listPageView.alpha = 0
        reschedulePageView.alpha = 0
        subjectView.alpha = 1
        
        edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        edgeGesture.edges = UIRectEdge.Left
        inboxView.addGestureRecognizer(edgeGesture)
        
        //        var edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        //        edgeGesture.edges = UIRectEdge.Left
        //        inboxView.addGestureRecognizer(edgeGesture)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            self.subjectOriginalCenter = subjectView.center
        }
            
        else if sender.state == UIGestureRecognizerState.Changed {
            subjectView.center = CGPoint (x: subjectOriginalCenter.x + translation.x, y: subjectOriginalCenter.y)
            if translation.x < 0 {
                if translation.x > -60 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.messageView.backgroundColor = UIColor.grayColor()
                        self.rescheduleView.alpha = 0.5
                    })
                }
                else if translation.x < -60 && translation.x > -240 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.rescheduleReveal()
                    })
                    self.rescheduleView.center = CGPoint (x: 60 + self.rescheduleViewOrigianlCenter.x + translation.x, y: self.rescheduleViewOrigianlCenter.y)
                }
                else {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.listReveal()
                    })
                }
            }
            else {
                if translation.x <= 60 {
                    UIView.animateWithDuration(0.3, animations:
                        { () -> Void in
                            self.messageView.backgroundColor = UIColor.grayColor()
                            self.archiveView.alpha = 0.5
                    })
                }
                else if translation.x > 60 && translation.x < 260 {
                    UIView.animateWithDuration(0.3, animations:
                        { () -> Void in
                            self.archiveReveal()
                    })
                    self.archiveView.center = CGPoint (x: -60 + self.archiveViewOriginalCenter.x + translation.x, y: self.archiveViewOriginalCenter.y)
                }
                else {
                    UIView.animateWithDuration(0.3, animations:
                        { () -> Void in
                            self.deleteReveal()
                    })
                }
            }
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            if velocity.x < 0 {
                if translation.x > -60 {
                    subjectViewReturn()
                }
                else if translation.x < -60 && translation.x > -240 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.rescheduleView.alpha = 0
                        self.subjectView.center = CGPoint (x: self.subjectOriginalCenter.x - 480, y: self.subjectOriginalCenter.y)
                        self.messageView.backgroundColor = UIColor.yellowColor()
                        }, completion: { (Bool) -> Void in
                            self.reschedulePageView.alpha = 1
                            self.inboxView.alpha = 0
                    })
                }
                else {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.listPageView.alpha = 0
                        self.subjectView.center = CGPoint (x: self.subjectOriginalCenter.x - 480, y: self.subjectOriginalCenter.y)
                        self.messageView.backgroundColor = UIColor.brownColor()
                        }, completion: { (Bool) -> Void in
                            self.listPageView.alpha = 1
                            self.inboxView.alpha = 0
                    })
                }
            }
            else if velocity.x > 0 {
                if translation.x < 60 {
                    subjectViewReturn()
                }
                else if translation.x > 60 && translation.x < 260 {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.archiveView.alpha = 0
                        self.subjectView.center = CGPoint (x: self.subjectOriginalCenter.x + 480, y: self.subjectOriginalCenter.y)
                        self.messageView.backgroundColor = UIColor.greenColor()
                        }, completion: { (Bool) -> Void in
                            self.actionTakenOnMessage()
                    })
                }
                else {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.deleteView.alpha = 0
                        self.subjectView.center = CGPoint (x: self.subjectOriginalCenter.x + 480, y: self.subjectOriginalCenter.y)
                        self.messageView.backgroundColor = UIColor.redColor()
                        }, completion: { (Bool) -> Void in
                            self.actionTakenOnMessage()
                    })
                }
            }
            else {
                subjectViewReturn()
            }
        }
    }
    
    func rescheduleReveal() {
        messageView.backgroundColor = UIColor.yellowColor()
        rescheduleView.alpha = 1
        listView.alpha = 0
        archiveView.alpha = 0
        deleteView.alpha = 0
    }
    
    func listReveal() {
        messageView.backgroundColor = UIColor.brownColor()
        listView.alpha = 1
        rescheduleView.alpha = 0
        archiveView.alpha = 0
        deleteView.alpha = 0
    }
    
    func archiveReveal() {
        messageView.backgroundColor = UIColor.greenColor()
        archiveView.alpha = 1
        rescheduleView.alpha = 0
        listView.alpha = 0
        deleteView.alpha = 0
    }
    
    func deleteReveal() {
        messageView.backgroundColor = UIColor.redColor()
        deleteView.alpha = 1
        archiveView.alpha = 0
        rescheduleView.alpha = 0
        listView.alpha = 0
    }
    
    func actionTakenOnMessage() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.messageView.hidden = true
            self.feedView.center = self.messageHiddenMoveFeed
            UIView.animateWithDuration(0.3, delay: 5, options: [], animations: { () -> Void in
                }, completion: { (Bool) -> Void in
                    self.feedView.center = self.feedViewOriginalCenter
            })
            }) { (Bool) -> Void in
                self.messageView.hidden = false
                self.deleteView.alpha = 0
                self.archiveView.alpha = 0
                self.rescheduleView.alpha = 0
                self.listView.alpha = 0
                self.messageView.backgroundColor = UIColor.grayColor()
                self.subjectView.center = self.subjectOriginalCenter
                self.rescheduleView.center = self.rescheduleViewOrigianlCenter
        }
    }
    func subjectViewReturn() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.subjectView.center = self.subjectOriginalCenter
            }) { (Bool) -> Void in
                self.deleteView.alpha = 0
                self.archiveView.alpha = 0
                self.rescheduleView.alpha = 0
                self.listView.alpha = 0
                self.messageView.backgroundColor = UIColor.grayColor()
        }
    }
    @IBAction func didTapListPage(sender: UITapGestureRecognizer) {
        listPageView.alpha = 0
        inboxView.alpha = 1
        actionTakenOnMessage()
    }
    
    @IBAction func didTapReschedule(sender: AnyObject) {
        reschedulePageView.alpha = 0
        inboxView.alpha = 1
        actionTakenOnMessage()
    }
    
    //    @IBAction func edgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
    //        print ("did edge pan")
    //        if inboxView.center == inboxViewOriginalCenter {
    //            menuOpen()
    //        }
    //        else {
    //            menuClose()
    //        }
    //    }
    func onEdgePan(sender:UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translationInView(view)
    
        if sender.state == UIGestureRecognizerState.Began {
            
        }
        else if sender.state == UIGestureRecognizerState.Changed {
//            && translation.x > 0 {
//            inboxView.center == inboxViewOriginalCenter {
//            menuOpen()
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            if translation.x > 0 {
                self.menuOpen()
            }
            else {
            self.menuClose()
            }
        }
    }
    
    @IBAction func didPressMenuButton(sender: AnyObject) {
        print ("button press")
        if inboxView.center == inboxViewOriginalCenter {
            menuOpen()
        }
        else {
            menuClose()
        }
    }
    
    func menuOpen() {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.menuView.alpha = 1
            self.inboxView.center = CGPoint (x: self.inboxViewOriginalCenter.x + 280, y: self.inboxViewOriginalCenter.y)
        })
    }
    
    func menuClose() {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.menuView.alpha = 0
            self.inboxView.center = self.inboxViewOriginalCenter
        })
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
