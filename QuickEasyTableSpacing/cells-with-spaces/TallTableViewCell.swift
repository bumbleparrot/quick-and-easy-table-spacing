//
//  TallTableViewCell.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/9/22.
//

import UIKit
import Fakery

class TallTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileContainer: UIView!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rightTopLabel: UILabel!
    
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
        leftTopLabel.text = "\(faker.lorem.sentences(amount: 3))"
        rightTopLabel.text = "\(faker.lorem.sentences(amount: 3))"
        nameLabel.text = faker.name.firstName()
    }
}
