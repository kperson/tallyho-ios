//
//  ProjectController.swift
//  TallyHo
//
//  Created by Kelton Person on 3/23/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import UIKit

class ProjectController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var detail: BranchDetail!
    var projectName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self;
        tableView.registerNib(UINib(nibName: "SingleLabelCell", bundle: nil), forCellReuseIdentifier: "SingleLabelCellId")
        
        self.title = "\(projectName): \(detail.branch)"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail.currentApps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SingleLabelCellId", forIndexPath: indexPath) as SingleLabelCell
        cell.singleTitleLabel.text = detail.currentApps[indexPath.row].name
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    
    
}