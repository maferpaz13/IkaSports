//
//  DeportesTableViewCell.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import UIKit

class DeportesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var SportLabel: UILabel!
    @IBOutlet weak var sportButtonOut: UIButton!
    @IBOutlet weak var InfoButtonOut: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
