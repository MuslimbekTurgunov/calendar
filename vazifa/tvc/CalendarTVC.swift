//
//  CalendarTVC.swift
//  vazifa
//
//  Created by Macbook on 16/02/22.
//

import UIKit

class CalendarTVC: UITableViewCell {

    @IBOutlet weak var leftBtn: UIButton!
    
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var bugunLbl: UILabel!
    @IBOutlet weak var collecView: UICollectionView! {
        didSet {
        collecView.delegate = self
        collecView.dataSource = self
        collecView.register(UINib(nibName: "CalendarCVC", bundle: nil), forCellWithReuseIdentifier: "CalendarCVC")
        }
    }
    var weekDays: [DayDM] = []
    override func awakeFromNib() {
        super.awakeFromNib()
       weekDays = generateCalendar()
        bugunLbl.text = "\(Date().nowDay)"
        
    }
    
    
    private func generateCalendar() -> [DayDM] {
        let monday = Date().getMonday()
        var days: [DayDM] = []
        var mondayDM = DayDM.init(title: Date().dayName, date: Date().dayName)
        var lastDate: Date = monday
        
        for _ in 0..<21 {
            lastDate = lastDate.nextDay
            let lasDM = DayDM.init(title: lastDate.dayName, date: lastDate.dayNumber)
            days.append(lasDM)
        }
        return days
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        rightBtn.isEnabled = !(collecView.contentOffset.x == CGFloat((weekDays.count/7)-2) * (collecView.frame.width))
        
        if collecView.contentOffset.x < CGFloat((weekDays.count/7)-1) * (collecView.frame.width) {
            leftBtn.isEnabled = true
            collecView.contentOffset.x += collecView.frame.width
        } else {
            rightBtn.isEnabled = false
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        
        leftBtn.isEnabled = !(collecView.contentOffset.x == collecView.frame.width)
        if collecView.contentOffset.x > 0 {
            rightBtn.isEnabled = true
            collecView.contentOffset.x -= collecView.frame.width
        }
    }
}

extension CalendarTVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    rightBtn.isEnabled = !(collecView.contentOffset.x == CGFloat((weekDays.count/7) - 1 ) * (collecView.frame.width))
        leftBtn.isEnabled = !(collecView.contentOffset.x == 0)
    }
}



extension CalendarTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collecView.dequeueReusableCell(withReuseIdentifier: "CalendarCVC", for: indexPath) as? CalendarCVC else {return UICollectionViewCell() }
        cell.updateCell(date: weekDays[indexPath.row])
        
        if weekDays[indexPath.row].title == "Sesh" || weekDays[indexPath.row].title == "Pay" || weekDays[indexPath.row].title == "Shan" {
            cell.dayLbl.backgroundColor = #colorLiteral(red: 0.8788835406, green: 0.9838485122, blue: 0.96467942, alpha: 1)
            cell.dayLbl.textColor = #colorLiteral(red: 0.2009350061, green: 0.6891065836, blue: 0.5924549699, alpha: 1)
        } else if weekDays[indexPath.row].title == "Yak" {
            cell.dayLbl.textColor = #colorLiteral(red: 0.8340787888, green: 0.3194792867, blue: 0.3329866827, alpha: 1)
            cell.dayLbl.backgroundColor = #colorLiteral(red: 0.902959764, green: 0.6151793003, blue: 0.6216725707, alpha: 1)
        } else {
            cell.dayLbl.textColor = #colorLiteral(red: 0.7294119, green: 0.7294119, blue: 0.7294119, alpha: 1)
            cell.dayLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collecView.frame.width/7
        return CGSize(width: width, height: 65)
    }
    
    
    
}
