//
//  ViewController.swift
//  MCInfinitedScrollView
//
//  Created by Michael on 16/4/19.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let infinitedScrollView = MCInfinitedScrollView(viewModel: MCInfinitedScrollViewModel())
        self.view.addSubview(infinitedScrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

