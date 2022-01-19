//
//  DoubleTableViewCell.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/9/22.
//

import UIKit
import Fakery

class DoubleTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var leftContentView: UIView!
    @IBOutlet weak var rightContentView: UIView!
    @IBOutlet weak var leftProfileContainer: UIView!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var leftNameLabel: UILabel!
    @IBOutlet weak var rightProfileContainer: UIView!
    @IBOutlet weak var rightTopLabel: UILabel!
    @IBOutlet weak var rightNameLabel: UILabel!
    
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
        containerView.backgroundColor = .clear
        
        leftContentView.setBackgroundImage()
        leftContentView.addBorder()
        leftContentView.roundCorners()
        
        rightContentView.setBackgroundImage()
        rightContentView.addBorder()
        rightContentView.roundCorners()
    }
    
    func setupProfile() {
        leftProfileContainer.setProfileImage()
        rightProfileContainer.setProfileImage()
    }
    
    func setuplabels() {
        let faker = Faker(locale: "nb-NO")
        leftTopLabel.text = "\(faker.lorem.sentences(amount: 2))"
        leftNameLabel.text = faker.name.firstName()
        
        rightTopLabel.text = "\(faker.lorem.sentences(amount: 2))"
        rightNameLabel.text = faker.name.firstName()
    }
}
