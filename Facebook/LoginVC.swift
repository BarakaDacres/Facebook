//
//  LoginVC.swift
//  Facebook
//
//  Created by Baraka Dacres on 29/8/18.
//  Copyright © 2018 Baraka Dacres. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // UI Object
    @IBOutlet weak var textFieldsView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var leftLineView: UIView!
    
    @IBOutlet weak var rightLineView: UIView!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var handsImageView: UIImageView!
    
    // Constraints objects
    @IBOutlet weak var coverImageView_top: NSLayoutConstraint!
    @IBOutlet weak var whiteIconImageView_y: NSLayoutConstraint!
    @IBOutlet weak var handsImageView_top: NSLayoutConstraint!
    @IBOutlet weak var registerButton_buttom: NSLayoutConstraint!
    
    
    // Executed when the scene is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Declaring notification observation in order to catch UIKeyboadWillShow / UIKeyboardWillHide Notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
     
    }
    
    // Executed always when the screen's White Space (anywhere excluding objects) is tapped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // End editing - hide keyboards
        self.view.endEditing(false)
    }
    
    // Executed once the keyboard is about to be shown
    @objc func keyboardWillShow(notification: Notification) {
        
        // Deducting 75pixels from current Y position (doesnt take actin till forced)
        coverImageView_top.constant -= 75
        handsImageView_top.constant -= 75
        whiteIconImageView_y.constant += 50
        
        // If iOS (app) is able to access keyboard's frame, then change Y position of the Register Button
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            registerButton_buttom.constant += keyboardSize.height
        }
        
        
        // Animation function. Whatever in the closures will be animated
        UIView.animate(withDuration: 0.5) {
            
            self.handsImageView.alpha = 0
            
            // Force to update layout
            self.view.layoutIfNeeded()
        }
    }
    // Executed once the keyboard is bout to be hidden
    @objc func keyboardWillHide(notification: Notification) {
        
        // Adding 75pixels from current Y position (doesnt take actin till forced)
        coverImageView_top.constant += 75
        handsImageView_top.constant += 75
        whiteIconImageView_y.constant -= 50
        
        // If iOS (app) is able to access keyboard's frame, then change Y position of the Register Button
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            registerButton_buttom.constant -= keyboardSize.height
        }
        
        
        // Animation function. Whatever in the closures will be animated
        UIView.animate(withDuration: 0.5) {
            
            self.handsImageView.alpha = 1
            
            // Force to update the layout
            self.view.layoutIfNeeded()
        }
    }
    
    
    // Execute after aligning the objects
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Calling configure functions to be executed, as they're already declared
        configure_textFieldsView()
        configure_loginBtn()
        configure_orLabel()
        configure_registerButton()
    
    }
    
    // This function stores the code which configures appearance of the textFields' View
    func configure_textFieldsView() {
        
        // Declaring constant tot store information which later on will be assigned to certain 'object'
        let border = CALayer()
        let width = CGFloat(2)
        
        // Creating layer to be a border of the view
        let color = UIColor.groupTableViewBackground.cgColor
        border.borderColor = color
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: 0, width: textFieldsView.frame.width, height: textFieldsView.frame.height)
        
        // Creating layer to be in the center of the view
        let line = CALayer()
        line.borderWidth = width
        line.borderColor = color
        line.frame = CGRect(x: 0, y: textFieldsView.frame.height / 2 - width, width: textFieldsView.frame.width, height: width)
        
        // Assigning created layers to the view
        textFieldsView.layer.addSublayer(border)
        textFieldsView.layer.addSublayer(line)
        
        // Rounded corners
        textFieldsView.layer.cornerRadius = 5
        textFieldsView.layer.masksToBounds = true
        
    }
    
    // Will configure login buttons' appearance
    func configure_loginBtn() {
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        loginButton.isEnabled = false
        
    }
    
    // Will configure appearance of OR label and its view storing the lines
    func configure_orLabel() {
        
        // Shortcuts
        let width = CGFloat(2)
        let color = UIColor.groupTableViewBackground.cgColor
        
        // Create Left Line object (layer), by assigning widith and color values (constantcs)
        let leftLine = CALayer()
        leftLine.borderWidth = width
        leftLine.borderColor = color
        leftLine.frame = CGRect(x: 0, y: leftLineView.frame.height / 2 - width, width: leftLineView.frame.width, height: width)
        
        // Creating Right Line object (layer) by assigning width and color values declared above (for shorter way)
        let rightLine = CALayer()
        rightLine.borderWidth = width
        rightLine.borderColor = color
        rightLine.frame = CGRect(x: 0, y: rightLineView.frame.height / 2 - width, width: rightLineView.frame.width, height: width)
        
        // Assign lines (layer objects) to UI objects (views)
        leftLineView.layer.addSublayer(leftLine)
        rightLineView.layer.addSublayer(rightLine)
    }
    
    // Will configure appearance of Register Button
    func configure_registerButton() {
        
        // Created constant named 'border' of type layer which acts as a border frame
        let border = CALayer()
        border.borderColor = UIColor.groupTableViewBackground.cgColor
        border.borderWidth = 2
        border.frame = CGRect(x: 0, y: 0, width: registerButton.frame.width, height: registerButton.frame.height)
        
        // Assign border to the object (button)
        registerButton.layer.addSublayer(border)
        
        // Rounded corner
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        
    }

}
