//
//  MCViewController.swift
//  MCInfinitedScrollView
//
//  Created by Michael on 16/4/19.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class MCViewController: UIViewController {
    
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.topAnchor.constraintEqualToAnchor(self.imageView.topAnchor).active = true
        self.view.bottomAnchor.constraintEqualToAnchor(self.imageView.bottomAnchor).active = true
        self.view.leadingAnchor.constraintEqualToAnchor(self.imageView.leadingAnchor).active = true
        self.view.trailingAnchor.constraintEqualToAnchor(self.imageView.trailingAnchor).active = true
    }

  

  

}
