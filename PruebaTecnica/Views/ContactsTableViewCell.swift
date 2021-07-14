//
//  ContactsTableViewCell.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    @IBOutlet weak var contactId: UILabel!
    @IBOutlet weak var contactNo: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var createdTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
