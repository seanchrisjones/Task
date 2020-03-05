//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Sean Jones on 3/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

 protocol ButtonTableViewCellDelegate: class {
    
     func buttonCellButtonTapped(_ sender: ButtonTableViewCell)

     
 }
class ButtonTableViewCell: UITableViewCell {
//MARK: OUTLETS
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    //MARK: PROPERTIES
     var delegate: ButtonTableViewCellDelegate?
    
    //MARK:ACTIONS
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
        
    }
    
    func updateButton(_isComplete: Bool){
        if _isComplete{
            completeButton.setImage(UIImage(named: "complete"), for: .normal)}
        else{
            completeButton.setImage(UIImage(named:"incomplete"), for: .normal)}

    }
    func updateTask(withTask task: Task){
        primaryLabel.text = task.name
        updateButton(_isComplete: true)
    }
    
}

