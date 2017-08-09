//
//  ViewController.swift
//  DemoExpandTableView
//
//  Created by itthipon wiwatthanasathit on 8/10/2560 BE.
//  Copyright © 2560 Dev7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    var isVisibleRow = 12
    var isFirstVisibleRow = true
    var mDataArray = [["id":12],["id":21],["id":34]]
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UIGestureRecognizerDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }else if section == 2 {
            return 3
        }else { 
            return mDataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! FooterTableViewCell
            cell.mFooterTitleLabel.text = "footer: \(indexPath.row+1)"
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! FooterTableViewCell
            cell.mFooterTitleLabel.text = "footer: \(indexPath.row+1)"
            return cell
        }else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderTableViewCell
            let id = mDataArray[indexPath.row]["id"]
            
            cell.selectionStyle = .none
            cell.mHeaderView.tag = indexPath.row
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.onExpandView(_:)))
            tap.delegate = self
            cell.mHeaderView.addGestureRecognizer(tap)
            
            cell.mTitleLabel.text = "\(id!)"
            cell.mItemView.isHidden = true
            
            if id == isVisibleRow {
                cell.mItemView.isHidden = false
            }else{
                cell.mItemView.isHidden = true
            }
            
            return cell

        }
    }
    
    func onExpandView(_ sender:UITapGestureRecognizer){
        
        isFirstVisibleRow = false
        
        if let view = sender.view {
            let id = mDataArray[view.tag]["id"]
            if id == isVisibleRow {
                isVisibleRow = -1
            }else{
                isVisibleRow = id!
            }
            mTableView.reloadData()
//            mTableView.reloadRows(at: [IndexPath(row: view.tag, section: 0)], with: .automatic)
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 44.0
        }else  if section == 2 {
            return 44.0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! TitleTableViewCell
            cell.mTitleLabel.text = "\(section+1)"
            return cell
        }else  if section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! TitleTableViewCell
            cell.mTitleLabel.text = "\(section+1)"
            return cell
        }else{
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let id = mDataArray[indexPath.row]["id"]
       
        
        if id == isVisibleRow {
            return  100
        }else{
            return 50
        }
    }
}

