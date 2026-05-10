//
//  CustomTableViewCell.swift
//  lab2_1
//
//  Created by Nemo on 10/05/2026.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBAction func myButton(_ sender: Any) {
    }
    @IBOutlet weak var mySubtitle: UILabel!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
