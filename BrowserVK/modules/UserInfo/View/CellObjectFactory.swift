//
//  CellObjectFactory.swift
//  BrowserVK
//
//  Created by Ильяс on 20.11.2017.
//  Copyright © 2017 Алмакаев Ильяс. All rights reserved.
//

import Foundation
import SwiftyJSON

class CellObjectFactory {
    
    func configurateCell(cell: UserInfoTableViewCell, row: Int, info: JSON) {
        
        var text = ""
        var detailText = ""
        
        switch row {
        case 0:
            text = "Имя"
            detailText = info["first_name"].stringValue
        case 1:
            text = "Фамилия"
            detailText = info["last_name"].stringValue
        case 2:
            text = "Отчество"
            detailText = info["nickname"].stringValue
        case 3:
            text = "screenname"
            detailText = info["screen_name"].stringValue
        case 4:
            text = "Пол"
            detailText = sex(sex: info["sex"].intValue)
        case 5:
            text = "Семейное положение"
            detailText = relation(relation: info["relation"].intValue, sex:info["sex"].intValue)
        default:
            break
        }
        
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = detailText
    }
    
    func sex(sex: Int) -> String {
        
        var sexText = ""
        
        switch sex {
        case 0:
            sexText = "Пол не указан"
        case 1:
            sexText = "Женщина"
        case 2:
            sexText = "Мужик"
        default:
            break
        }
        
        return sexText
    }
    
    func relation(relation: Int, sex: Int) -> String {
        
        var relationText = ""
        
        switch relation {
        case 0:
            relationText = "Не указано"
        case 1:
            if sex == 0 {
                relationText = "Не женат/не замужем"
            } else if sex == 1 {
                relationText = "Не замужем"
            } else {
                relationText = "Не женат"
            }
        case 2:
            if sex == 0 {
                relationText = "Есть друг/есть подруга"
            } else if sex == 1 {
                relationText = "Есть друг"
            } else {
                relationText = "Есть подруга"
            }
        case 3:
            if sex == 0 {
                relationText = "Помолвлен/помолвлена"
            } else if sex == 1 {
                relationText = "Помолвлена"
            } else {
                relationText = "Помолвлен"
            }
        case 4:
            if sex == 0 {
                relationText = "Женат/замужем"
            } else if sex == 1 {
                relationText = "Замужем"
            } else {
                relationText = "Женат"
            }
        case 5:
            relationText = "Всё сложно"
        case 6:
            relationText = "В активном поиске"
        case 7:
            if sex == 0 {
                relationText = "Влюблён/влюблена"
            } else if sex == 1 {
                relationText = "Влюблена"
            } else {
                relationText = "Влюблён"
            }
        case 8:
            relationText = "В гражданском браке"
        default:
            break
        }
        
        return relationText
    }
}
