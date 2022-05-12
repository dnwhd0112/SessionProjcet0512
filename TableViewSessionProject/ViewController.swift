//
//  ViewController.swift
//  TableViewSessionProject
//
//  Created by 곽우종 on 2022/05/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!
    var session = Session()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.delegate = self
        customTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate {
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as? CustomTableCell else {
            return UITableViewCell()
        }
        var url: String = ""
        if indexPath.row == 0 {
            url = "https://wallpaperaccess.com/download/europe-4k-1369012"
        } else if indexPath.row == 1 {
            url = "https://wallpaperaccess.com/download/europe-4k-1318341"
        } else if indexPath.row == 2 {
            url = "https://wallpaperaccess.com/download/europe-4k-1379801"
        }
        
        if cell.myImageView.image == nil {
            session.startLoad(url: url) { image in
                DispatchQueue.main.async {
                    cell.myImageView.image = image
                }
            }
        }
        
        if url == "" {
            cell.myImageView.image = nil
        }
        
        cell.cellLabel.text = "\(indexPath.section), \(indexPath.row)"
        if indexPath.section <= 4 {
            cell.cellLabel.text = "\(indexPath.section), \(indexPath.row)"
        } else {
            cell.cellLabel.text = ""
        }
        if indexPath.row == 2 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .white
        }
        return cell
    }
}
