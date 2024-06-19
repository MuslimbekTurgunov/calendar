//
//  MainVC.swift
//  vazifa
//
//  Created by Macbook on 16/02/22.
//

import UIKit

class MainVC: UIViewController {
    
   
    @IBOutlet weak var tableVieww: UITableView! {
        didSet {
            tableVieww.delegate = self
            tableVieww.dataSource = self
            tableVieww.register(UINib(nibName: "TeacherTVC", bundle: nil), forCellReuseIdentifier: "TeacherTVC")
            tableVieww.register(UINib(nibName: "CalendarTVC", bundle: nil), forCellReuseIdentifier: "CalendarTVC")
            tableVieww.register(UINib(nibName: "LessonTVC", bundle: nil), forCellReuseIdentifier: "LessonTVC")
            tableVieww.register(UINib(nibName: "TugatilganTVC", bundle: nil), forCellReuseIdentifier: "TugatilganTVC")
            tableVieww.register(UINib(nibName: "GuruxTVC", bundle: nil), forCellReuseIdentifier: "GuruxTVC")
            tableVieww.register(UINib(nibName: "CloseOpenTVC", bundle: nil), forCellReuseIdentifier: "CloseOpenTVC")

            
            tableVieww.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 20, right: 0)
        }
    }
    
    var lesson: [LessonDM] = [
        
    LessonDM.init(isExpanded: false, lessonTitle: "Lesson 2", tema: "Formal and informal", image: #imageLiteral(resourceName: "cofee")),
    LessonDM.init(isExpanded: false, lessonTitle: "Lesson 3", tema: "Days of the week, mon...", image: #imageLiteral(resourceName: "english"))

    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



    }



}



extension MainVC: UITableViewDelegate, UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 || section == 2{
            return 1
        } else if section == 3  {
            return lesson[section-3].isExpanded ? 2 : 0
        } else if section == 4 {
            return lesson[section-3].isExpanded ? 3 : 0
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
        
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "TeacherTVC", for: indexPath) as? TeacherTVC else {return UITableViewCell()}
          
        return cell
        
        } else if indexPath.section == 1 {
        
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "CalendarTVC", for: indexPath) as? CalendarTVC else {return UITableViewCell()}
        return cell
            
        } else if indexPath.section == 2 {
        
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "LessonTVC", for: indexPath) as? LessonTVC else {return UITableViewCell()}
        return cell
            
        } else if indexPath.section == 3 {
        
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "TugatilganTVC", for: indexPath) as? TugatilganTVC else {return UITableViewCell()}
            
            cell.imageee.image = lesson[indexPath.row].image
            cell.titleLbl.text = lesson[indexPath.row].lessonTitle
            cell.nameLBl.text = lesson[indexPath.row].tema
        
            if indexPath.row == 1 {
                cell.backView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
                cell.backView.layer.cornerRadius = 8
                cell.tabview.isHidden = true
            }
            
        return cell
            
        } else if indexPath.section == 4 {
        
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "GuruxTVC", for: indexPath) as? GuruxTVC else {return UITableViewCell()}
            
            if indexPath.row == 2 {
                cell.backView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
                cell.backView.layer.cornerRadius = 8
            }
        return cell
            
        } else if indexPath.section == 5 {
        
        guard let cell = tableVieww.dequeueReusableCell(withIdentifier: "CloseOpenTVC", for: indexPath) as? CloseOpenTVC else {return UITableViewCell()}
            
            if indexPath.row == 0 {
                cell.constrain(son: 20)
                cell.constrain2(son: 102)
                cell.upImage.isHidden = true
                cell.lockImage.image = .init(systemName: "lock.open.fill")
                cell.downImage.image = UIImage.init(named: "dawn")
                cell.lockImage.tintColor = #colorLiteral(red: 0.02416310646, green: 0.6665306091, blue: 0.982948482, alpha: 1)
                cell.lockLabel.textColor = #colorLiteral(red: 0.02416310646, green: 0.6665306091, blue: 0.982948482, alpha: 1)
                cell.vaqtLabel.textColor = #colorLiteral(red: 0.02416310646, green: 0.6665306091, blue: 0.982948482, alpha: 1)
                cell.yillLabel.textColor = #colorLiteral(red: 0.02416310646, green: 0.6665306091, blue: 0.982948482, alpha: 1)
                cell.downImage.tintColor = #colorLiteral(red: 0.02416310646, green: 0.6665306091, blue: 0.982948482, alpha: 1)
            } else if indexPath.row == 1 {
                cell.upImage.image = UIImage.init(named: "dawn")
                cell.upImage.tintColor = #colorLiteral(red: 0.02416310646, green: 0.6665306091, blue: 0.982948482, alpha: 1)
                cell.lockLabel.text = "Yopiq"
                cell.lockImage.image = .init(systemName: "lock.fill")
                cell.lockImage.tintColor = #colorLiteral(red: 0.9064607024, green: 0.3297197223, blue: 0.3228961825, alpha: 1)
                cell.lockLabel.textColor = #colorLiteral(red: 0.9064607024, green: 0.3297197223, blue: 0.3228961825, alpha: 1)
                
            } else if indexPath.row == 4 {
                cell.lockLabel.text = "Yopiq"
                cell.downImage.isHidden = true
                cell.lockImage.image = .init(systemName: "lock.fill")
                cell.lockImage.tintColor = #colorLiteral(red: 0.9064607024, green: 0.3297197223, blue: 0.3228961825, alpha: 1)
                cell.lockLabel.textColor = #colorLiteral(red: 0.9064607024, green: 0.3297197223, blue: 0.3228961825, alpha: 1)
            } else {
                cell.lockLabel.text = "Yopiq"
                cell.lockImage.image = .init(systemName: "lock.fill")
                cell.lockImage.tintColor = #colorLiteral(red: 0.9064607024, green: 0.3297197223, blue: 0.3228961825, alpha: 1)
                cell.lockLabel.textColor = #colorLiteral(red: 0.9064607024, green: 0.3297197223, blue: 0.3228961825, alpha: 1)
            }
            
        return cell
        
        }
        return UITableViewCell()
        
    }
    
    @objc func headerTapped(sender: UIButton) {
      
        lesson[sender.tag].isExpanded = !lesson[sender.tag].isExpanded
      
        tableVieww.reloadSections(IndexSet(integer: sender.tag + 3), with: .fade)
      
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: UIView = UIView()
        let containerView: UIView = UIView()
        let label: UILabel = UILabel()
        let imagee: UIImageView = UIImageView()
        let btn: UIButton = UIButton()
        let stack: UIStackView = UIStackView()
        headerView.backgroundColor = .clear
        containerView.backgroundColor = .white
        
        if section == 3 {
            label.text = "Tugatilgan darslar"
      
        } else if section == 4 {
            label.text = "Guruh a'zolari"
        }
        
        if lesson[0].isExpanded == false {
            containerView.layer.cornerRadius = 8
            imagee.image = UIImage(systemName: "chevron.up")
        } else {
            containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            containerView.layer.cornerRadius = 8
            imagee.image = UIImage(systemName: "chevron.down")
        }
        
        if lesson[1].isExpanded == false  {
            containerView.layer.cornerRadius = 8
            imagee.image = UIImage(systemName: "chevron.up")

        } else {
            containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            containerView.layer.cornerRadius = 8
            imagee.image = UIImage(systemName: "chevron.down")
        }

        
        btn.tag = section-3
        imagee.backgroundColor = #colorLiteral(red: 0.8922309279, green: 0.9706217647, blue: 0.9998781085, alpha: 1)
        imagee.layer.cornerRadius = 10
        imagee.clipsToBounds = true
        
       
        imagee.translatesAutoresizingMaskIntoConstraints = false
        imagee.heightAnchor.constraint(equalToConstant: CGFloat(20)).isActive = true
        imagee.widthAnchor.constraint(equalToConstant: CGFloat(20)).isActive = true
        btn.addTarget(self, action: #selector(headerTapped(sender:)), for: .touchUpInside)
        
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        
//        imagee.image = UIImage(systemName: "chevron.up")
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(imagee)
        containerView.addSubview(stack)
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 10
        stack.alignment = .center
        headerView.addSubview(containerView)
        headerView.addSubview(btn)
        
        imagee.translatesAutoresizingMaskIntoConstraints = false
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5).isActive = true
        btn.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5).isActive = true
        btn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        btn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        stack.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        stack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        stack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16).isActive = true
        containerView.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -16).isActive = true
        containerView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
    
        return headerView
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 || section == 1 || section == 2{
            return 0
        } else if section == 3  {
            return 68
        } else if section == 4 {
            return 68
        } else {
            return 0
        }
    }
}
