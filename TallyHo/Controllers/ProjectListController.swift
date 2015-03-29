//
//  ProjectListDetailViewController.swift
//  TallyHo
//
//  Created by Kelton Person on 3/17/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class ProjectListController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!

    var projectManager: ProjectManager!
    var projectBranches: [(BranchName, Project)] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "DoubleLabelCell", bundle: nil), forCellReuseIdentifier: "DoubleLabelCellId")
        tableView.dataSource = self
        tableView.delegate = self
        title = "Projects"
        
        projectManager.fetchProjects().onSuccess { projects in
            self.projectBranches = projects.map { x in x.projectAndBranch }.reduceRight(+)
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectBranches.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let (branchName, project) = projectBranches[indexPath.row]
        let branchDetail = project[branchName]
        let detailController = ControllerSource.branchController(branchDetail, projectName: project.name)
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DoubleLabelCellId", forIndexPath: indexPath) as DoubleLabelCell
        let (branchName, project) = projectBranches[indexPath.row]
        cell.primaryLabel.text = project.name
        cell.secondaryLabel.text = "branch: \(branchName)"
        return cell
    }
    
}