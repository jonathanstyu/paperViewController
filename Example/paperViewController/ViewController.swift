//
//  ViewController.swift
//  paperViewController
//
//  Created by Jonathan Yu on 02/29/2016.
//  Copyright (c) 2016 Jonathan Yu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var htmlData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        loadHTML()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = htmlData[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return htmlData.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let longText = htmlData[indexPath.row]
        let pushedVC = PaperViewController(title: "Text", body: longText)
        
        self.navigationController?.pushViewController(pushedVC, animated: true)
    }
    
    
}

