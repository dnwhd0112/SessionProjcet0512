//
//  CustomTableCell.swift
//  TableViewSessionProject
//
//  Created by 곽우종 on 2022/05/12.
//

import Foundation
import UIKit

class CustomTableCell: UITableViewCell {
    
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellLabel.text = nil
        myImageView.image = nil
    }
}
