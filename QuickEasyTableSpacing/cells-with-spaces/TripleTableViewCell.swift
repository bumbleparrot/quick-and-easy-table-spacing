//
//  TripleTableViewCell.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/18/22.
//

import UIKit
import Fakery

class TripleTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var firstContentView: UIView!
    @IBOutlet weak var firstProfileContainer: UIView!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var secondContentView: UIView!
    @IBOutlet weak var secondProfileContainer: UIView!
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var thirdContentView: UIView!
    @IBOutlet weak var thirdProfileContainer: UIView!
    @IBOutlet weak var thirdNameLabel: UILabel!
    
    @IBOutlet weak var fourthContentView: UIView!
    @IBOutlet weak var fourthProfileContainer: UIView!
    @IBOutlet weak var fourthNameLabel: UILabel!
    
    @IBOutlet weak var fifthContentView: UIView!
    @IBOutlet weak var fifthProfileContainer: UIView!
    @IBOutlet weak var fifthNameLabel: UILabel!
    
    @IBOutlet weak var sixthContentView: UIView!
    @IBOutlet weak var sixthProfileContainer: UIView!
    @IBOutlet weak var sixthNameLabel: UILabel!
    
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
        
        firstContentView.setBackgroundImage()
        firstContentView.addBorder()
        firstContentView.roundCorners()
        
        secondContentView.setBackgroundImage()
        secondContentView.addBorder()
        secondContentView.roundCorners()
        
        thirdContentView.setBackgroundImage()
        thirdContentView.addBorder()
        thirdContentView.roundCorners()
        
        fourthContentView.setBackgroundImage()
        fourthContentView.addBorder()
        fourthContentView.roundCorners()
        
        fifthContentView.setBackgroundImage()
        fifthContentView.addBorder()
        fifthContentView.roundCorners()
        
        sixthContentView.setBackgroundImage()
        sixthContentView.addBorder()
        sixthContentView.roundCorners()
    }
    
    func setupProfile() {
        firstProfileContainer.setProfileImage()
        secondProfileContainer.setProfileImage()
        thirdProfileContainer.setProfileImage()
        fourthProfileContainer.setProfileImage()
        fifthProfileContainer.setProfileImage()
        sixthProfileContainer.setProfileImage()
    }
    
    func setuplabels() {
        let faker = Faker(locale: "nb-NO")
        firstNameLabel.text = faker.name.firstName()
        secondNameLabel.text = faker.name.firstName()
        thirdNameLabel.text = faker.name.firstName()
        fourthNameLabel.text = faker.name.firstName()
        fifthNameLabel.text = faker.name.firstName()
        sixthNameLabel.text = faker.name.firstName()
    }
    
}
