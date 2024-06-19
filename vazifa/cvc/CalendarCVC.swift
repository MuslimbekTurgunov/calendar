//
//  CalendarCVC.swift
//  vazifa
//
//  Created by Macbook on 16/02/22.
//

import UIKit

class CalendarCVC: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    
    var weekDays: [DayDM] = []
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    
    func updateCell(date: DayDM) {
        titleLbl.text = date.title
        dayLbl.text = date.date
    }

    
}
