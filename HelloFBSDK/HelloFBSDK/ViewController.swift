//
//  ViewController.swift
//  HelloFBSDK
//
//  Created by Ngo Thai on 11/25/15.
//  Copyright © 2015 TBLStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.readPermissions = ["public_profile", "email", "user_friends", "read_page_mailboxes", "user_posts"]
        loginButton.delegate = self
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            returnUserData()
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            
        }
        
        /*
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
        
        let content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: "http://mp3.zing.vn/bai-hat/Love-To-Be-Loved-By-You-Marc-Terenzi/ZWZ9CC86.html")!
        content.contentTitle = "Test facebook sdk"
        content.contentDescription = "khong can like"
        
        let shareButton: FBSDKShareButton = FBSDKShareButton()
        shareButton.shareContent = content
        shareButton.center = CGPointMake(100, 150)
        self.view.addSubview(shareButton)

        
        let likeButton: FBSDKLikeButton = FBSDKLikeButton()
        likeButton.center = CGPointMake(100, 100)
        likeButton.objectID = "https://www.facebook.com/photo.php?fbid=1645830485665773&set=pcb.1645830532332435&type=3&theater"
        self.view.addSubview(likeButton)
        
        let sendButton: FBSDKSendButton = FBSDKSendButton()
        sendButton.center = CGPointMake(100, 200)
        sendButton.shareContent = content
        self.view.addSubview(sendButton)
        
        */
        
        
       
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
    }

    @IBAction func shareAction(sender: AnyObject) {
        //Share Dialog
        shareFacebook()
    }
    
    func shareFacebook() {
        let content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: "http://mp3.zing.vn/bai-hat/Love-To-Be-Loved-By-You-Marc-Terenzi/ZWZ9CC86.html")!
        content.contentTitle = "Test facebook sdk"
        content.contentDescription = "khong can like"
        
        let dialog: FBSDKShareDialog = FBSDKShareDialog()
        dialog.shareContent = content
        dialog.fromViewController = self
        dialog.mode = FBSDKShareDialogMode.ShareSheet
        dialog.show()
        
    }
    
    @IBAction func loginFacebook(sender: AnyObject) {
        
    }
    
    
    //Facebook Delegate
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                //returnUserData()
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                print("User Email is: \(userEmail)")
                let userID: String = result.valueForKey("id") as! String
                self.getFriendRequest(userID)
                
            }
        })
    }
    
    func getFriendRequest(userID: String) {
        let fbRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "\(userID)/inbox", parameters: nil)
        fbRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched friend request: \(result)")
                
                
            }
        })
    }
    
    

}

