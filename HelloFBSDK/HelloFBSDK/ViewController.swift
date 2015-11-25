//
//  ViewController.swift
//  HelloFBSDK
//
//  Created by Ngo Thai on 11/25/15.
//  Copyright © 2015 TBLStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
       
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
    }

    @IBAction func shareAction(sender: AnyObject) {
        //Share Dialog

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

}

