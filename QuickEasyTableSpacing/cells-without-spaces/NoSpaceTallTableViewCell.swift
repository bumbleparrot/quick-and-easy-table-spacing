//
//  NoSpaceTallTableViewCell.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/9/22.
//

import UIKit
import Fakery

class NoSpaceTallTableViewCell: UITableViewCell {
    @IBOutlet weak var profileContainer: UIView!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rightTopLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupContainerView()
        setupProfile()
        setuplabels()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupContainerView() {
    }
    
    func setupProfile() {
        profileContainer.layer.cornerRadius = 25
        profileContainer.layer.borderColor = UIColor.lightGray.cgColor
        profileContainer.layer.borderWidth = 0.5
        profileContainer.backgroundColor = UIColor.QuickAndEasy.lightGray
    }
    
    func setuplabels() {
        let faker = Faker(locale: "nb-NO")
        leftTopLabel.text = "\(faker.lorem.sentences(amount: 2))"
        rightTopLabel.text = "\(faker.lorem.sentences(amount: 2))"
        nameLabel.text = faker.name.firstName()
    }
}
