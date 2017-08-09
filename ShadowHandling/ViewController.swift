//
//  ViewController.swift
//  ShadowHandling
//
//  Created by Varun Dudeja on 08/08/17.
//  Copyright © 2017 Varun Dudeja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBottom: DropShadowView!
    @IBOutlet weak var viewTop: DropShadowView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "number - \(arc4random_uniform(6))"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        viewTop.scrollViewDidScroll(scrollView)
        viewBottom.scrollViewDidScroll(scrollView)
    }
}
