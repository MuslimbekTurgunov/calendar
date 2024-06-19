//
//  CloseOpenTVC.swift
//  vazifa
//
//  Created by Macbook on 16/02/22.
//

import UIKit

class CloseOpenTVC: UITableViewCell {
    
    @IBOutlet weak var contrain: NSLayoutConstraint!
    
    @IBOutlet weak var upConstr: NSLayoutConstraint!
    
    @IBOutlet weak var downConstr: NSLayoutConstraint!
    
    @IBOutlet weak var upImage: UIImageView!
    @IBOutlet weak var downImage: UIImageView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var lockLabel: UILabel!
    
    @IBOutlet weak var vaqtLabel: UILabel!
    
    @IBOutlet weak var yillLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    func constrain(son: CGFloat) {
        contrain.constant = son
    }
    
    func constrain1(son: CGFloat) {
        upConstr.constant = son
    }
    
    func constrain2(son: CGFloat) {
        downConstr.constant = son
    }
}
