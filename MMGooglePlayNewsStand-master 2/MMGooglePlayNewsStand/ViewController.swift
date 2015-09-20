//
//  ViewController.swift
//  MMGooglePlayNewsStand
//
//  Created by mukesh mandora on 25/08/15.
//  Copyright (c) 2015 madapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MMPlayPageControllerDelegate {
let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var showDemoBut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        initPlayStand()
        
        UITextField.appearance().textColor = UIColor.blackColor();
        
        textField.attributedPlaceholder = NSAttributedString(string:"Username",
            attributes:[NSForegroundColorAttributeName: UIColor.lightTextColor()])
        textField.textColor = UIColor.grayColor()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initPlayStand(){
        self.presentViewController(appDelegate.walkthrough!, animated: true, completion: nil)
        
        let stb = UIStoryboard(name: "Main", bundle: nil)
        
        
        let page_zero = stb.instantiateViewControllerWithIdentifier("stand_one") as! MMSampleTableViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("stand_one") as! MMSampleTableViewController
        let page_two = stb.instantiateViewControllerWithIdentifier("stand_one")as! MMSampleTableViewController
        let page_three = stb.instantiateViewControllerWithIdentifier("stand_one") as! MMSampleTableViewController
        let page_four = stb.instantiateViewControllerWithIdentifier("stand_one") as! MMSampleTableViewController
        let page_five = stb.instantiateViewControllerWithIdentifier("stand_one") as! MMSampleTableViewController
        
        //header Color
        page_zero.tag=1
        page_one.tag=2
        page_two.tag=3
        page_three.tag=4
        page_four.tag=5
        page_five.tag=6
        
        // Attach the pages to the master
        appDelegate.walkthrough?.delegate = self
        appDelegate.walkthrough?.addViewControllerWithTitleandColor(page_zero, title: title_1, color: UIColor(hexString: "9c27b0"))
        /*
        appDelegate.walkthrough?.addViewControllerWithTitleandColor(page_one, title: "Sports", color:UIColor(hexString: "009688"))
       
        appDelegate.walkthrough?.addViewControllerWithTitleandColor(page_two, title: "Entertainment", color:UIColor(hexString: "673ab7"))
        

        appDelegate.walkthrough?.addViewControllerWithTitleandColor(page_three, title: "Technology", color: UIColor(hexString: "ff9800"))
        
         appDelegate.walkthrough?.addViewControllerWithTitleandColor(page_four, title: "Business", color: UIColor(hexString: "03a9f4"))
        
        appDelegate.walkthrough?.addViewControllerWithTitleandColor(page_five, title: "World", color: UIColor(hexString: "4caf50"))
        */

    }

    @IBAction func showDemoAction(sender: AnyObject) {
        SwiftSpinner.show("Loading...", animated: true)
        request(.GET, "http://104.236.159.247:8181/top", parameters: ["term": self.textField.text]).responseJSON {
            (request, response, JSON, error) in
            
            for(var i = 0; i < 2; i++)
            {
                var thing = JSON![i]!["title"]!
                titleToPass.append("\(thing!)")
            }
            //title1 = self.textField.text
            title_1 = self.textField.text
            SwiftSpinner.hide()
            self.initPlayStand()
            
        }
    }
    
    
}
