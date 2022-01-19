//
//  NoSpaceDoubleTableViewCell.swift
//  QuickEasyTableSpacing
//
//  Created by Michael Vo on 1/9/22.
//

import UIKit
import Fakery

class NoSpaceDoubleTableViewCell: UITableViewCell {
    @IBOutlet weak var leftProfileContainer: UIView!
    @IBOutlet weak var leftTopLabel: UILabel!
    @IBOutlet weak var leftNameLabel: UILabel!
    @IBOutlet weak var rightProfileContainer: UIView!
    @IBOutlet weak var rightTopLabel: UILabel!
    @IBOutlet weak var rightNameLabel: UILabel!
    
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
        leftProfileContainer.layer.cornerRadius = 25
        leftProfileContainer.layer.borderColor = UIColor.lightGray.cgColor
        leftProfileContainer.layer.borderWidth = 0.5
        leftProfileContainer.backgroundColor = UIColor.QuickAndEasy.lightGray
        
        rightProfileContainer.layer.cornerRadius = 25
        rightProfileContainer.layer.borderColor = UIColor.lightGray.cgColor
        rightProfileContainer.layer.borderWidth = 0.5
        rightProfileContainer.backgroundColor = UIColor.QuickAndEasy.lightGray
    }
    
    func setuplabels() {
        let faker = Faker(locale: "nb-NO")
        leftTopLabel.text = "\(faker.lorem.sentences(amount: 2))"
        leftNameLabel.text = faker.name.firstName()
        
        rightTopLabel.text = "\(faker.lorem.sentences(amount: 2))"
        rightNameLabel.text = faker.name.firstName()
    }
}
