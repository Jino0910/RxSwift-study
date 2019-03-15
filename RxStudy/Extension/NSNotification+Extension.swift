//
//  NSNotification+Extension.swift
//  Bomapp
//
//  Created by rowkaxl on 2018. 8. 1..
//  Copyright © 2018년 Redvelvet Ventures Inc. All rights reserved.
//

import UIKit

extension Notification.Name {
    // 내보험 상세화면 증권보기 높이값 변경
    static let InsuraceDetailTableReload = Notification.Name("InsuraceDetailTableReload")
    
    // 내보험 메인에서의 화면전환
    static let myInsuranceGoToDetail = Notification.Name("myInsuranceGoToDetail")
    

    // 로그인 화면 인덱스
    static let introChangeTitleViewNoti = Notification.Name("introChangeTitleViewNoti")
    static let introShowLogoNoti = Notification.Name("introShowLogoNoti")
    static let introViewControllerIndexNoti = Notification.Name("introViewControllerIndexNoti")
    static let introNaviControllerBackActionNoti = Notification.Name("introNaviControllerBackActionNoti")


    // 스크래핑 스텝, 프로그레스 변경
    static let receiveScrapingStep = Notification.Name("receiveScrapingStep")
    
    // 보험사 오류 신고
    static let insErrorDeclaration = Notification.Name("insErrorDeclaration")
    
    // 보험사 업데이트
    static let insUpdate = Notification.Name("insUpdate")

}
