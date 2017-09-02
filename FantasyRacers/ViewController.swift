//
//  ViewController.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 02/09/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
    let main = AppMain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.run()
    
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

