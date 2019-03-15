//
//  RxStudyListVC.swift
//  RxStudy
//
//  Created by rowkaxl on 2018. 8. 15..
//  Copyright © 2018년 rowkaxl. All rights reserved.
//

import UIKit

class RxStudyListVC: UIViewController {
    
    @IBOutlet weak var tv: UITableView!
    
    var list = [
        "로그인 페이지(180815)",
        "throttle",
        "flatMap",
        "flatMapLatest"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI() {
        
        tv.registerCellNib(RxStudyListCell.self)
        
        tv.dataSource = self
        tv.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RxStudyListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RxStudyListSectionCell.identifier) as? RxStudyListSectionCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: RxStudyListCell.identifier, for: indexPath) as! RxStudyListCell
        cell.titleLabel?.text = "\(indexPath.row+1). \(list[indexPath.row])"
        return cell
    }
}

extension RxStudyListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.getSB(name: SBName.Main).instantiateViewController(withIdentifier: LoginVC.identifier)
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = UIStoryboard.getSB(name: SBName.Main).instantiateViewController(withIdentifier: ThrottleVC.identifier)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = UIStoryboard.getSB(name: SBName.Main).instantiateViewController(withIdentifier: FlatMapVC.identifier)
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = UIStoryboard.getSB(name: SBName.Main).instantiateViewController(withIdentifier: FlatMapLatestVC.identifier)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        tv.reloadRows(at: [indexPath], with: .none)
    }
}
