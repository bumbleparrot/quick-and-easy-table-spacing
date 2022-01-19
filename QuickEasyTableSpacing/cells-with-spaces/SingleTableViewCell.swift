//
//  SingleTableViewCell.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/8/22.
//

import UIKit
import Fakery

class SingleTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileContainer: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addDropShadow()
        
        setupContainerView()
        setupProfile()
        setuplabels()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupContainerView() {
        containerView.setBackgroundImage()
        containerView.addBorder()
        containerView.roundCorners()
    }
    
    func setupProfile() {
        profileContainer.setProfileImage()
    }
    
    func setuplabels() {
        let faker = Faker(locale: "nb-NO")
        
        topLabel.text = "\(faker.lorem.sentences(amount: 3))"
        nameLabel.text = faker.name.firstName()
    }
}
