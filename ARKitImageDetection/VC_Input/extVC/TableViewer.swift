//
//  TableViewer.swift
//  XML2tabview
//
//  Created by FounderCoder on 17.01.21.
//

import UIKit
import Foundation


extension Input1ViewController {
    
    // MARK: - Build expandable tab view
    @IBAction func click2refresh(_ sender: Any) {
        if let cell = xmlTableView.cellForRow(at: index) as? XmlCell {
            
            if DiValTextField.text != "" {
                ogValueIDLabel.text = DiValTextField.text
                damageDataElementSet[index.row].damageIntensity.value.id = DiValTextField.text!
            }
            if DeValTextField.text != "" {
                ogValueIDLabelDE.text = DeValTextField.text
                damageDataElementSet[index.row].damageExtent.value.id = DeValTextField.text!
            }
            DiValTextField.text = ""
            DeValTextField.text = ""
            
            
            if ar1ValTextField.text != "" {
                ar1Val.text = ar1ValTextField.text
                damageDataElementSet[index.row].categories.attributes[0].value?.id = ar1ValTextField.text!
            }
            if ar2ValTextField.text != "" {
                ar2Val.text = ar2ValTextField.text
                damageDataElementSet[index.row].categories.attributes[1].value?.id = ar2ValTextField.text!
            }
            if ar3ValTextField.text != "" {
                ar3Val.text = ar3ValTextField.text
                damageDataElementSet[index.row].categories.attributes[2].value?.id = ar3ValTextField.text!
            }
            if ar4DgtTextField.text != "" {
                ar4Dgt.text = ar4DgtTextField.text
                damageDataElementSet[index.row].categories.attributes[3].digits = ar4DgtTextField.text!
            }
            if ar4UntTextField.text != "" {
                ar4Unt.text = ar4UntTextField.text
                damageDataElementSet[index.row].categories.attributes[3].unit = ar4UntTextField.text!
            }
            ar1ValTextField.text = ""
            ar2ValTextField.text = ""
            ar3ValTextField.text = ""
            ar4UntTextField.text = ""
            ar4DgtTextField.text = ""
            
            
            if cAr1EnTextField.text != "" {
                cAr1En.text = cAr1EnTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[0].enumId = cAr1EnTextField.text!
            }
            if cAr2EnTextField.text != "" {
                cAr2En.text = cAr2EnTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[1].enumId = cAr2EnTextField.text!
            }
            if cAr3EnTextField.text != "" {
                cAr3En.text = cAr3EnTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[2].enumId = cAr3EnTextField.text!
            }
            if cAr4DgtTextField.text != "" {
                cAr4Dgt.text = cAr4DgtTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[3].digits = cAr4DgtTextField.text!
            }
            if cAr4UntTextField.text != "" {
                cAr4Unt.text = cAr4UntTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[3].unit = cAr4UntTextField.text!
            }
            if cAr5DgtTextField.text != "" {
                cAr5Dgt.text = cAr5DgtTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[4].digits = cAr5DgtTextField.text!
            }
            if cAr5UntTextField.text != "" {
                cAr5Unt.text = cAr5UntTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[4].unit = cAr5UntTextField.text!
            }
            if cAr6DgtTextField.text != "" {
                cAr6Dgt.text = cAr6DgtTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[5].digits = cAr6DgtTextField.text!
            }
            if cAr6UntTextField.text != "" {
                cAr6Unt.text = cAr6UntTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[5].unit = cAr6UntTextField.text!
            }
            if cAr7KeyTextField.text != "" {
                cAr7Key.text = cAr7KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].attributes[6].key = cAr7KeyTextField.text!
            }
            cAr1EnTextField.text = ""
            cAr2EnTextField.text = ""
            cAr3EnTextField.text = ""
            cAr4DgtTextField.text = ""
            cAr4UntTextField.text = ""
            cAr5DgtTextField.text = ""
            cAr5UntTextField.text = ""
            cAr6DgtTextField.text = ""
            cAr6UntTextField.text = ""
            cAr7KeyTextField.text = ""
            
            
            if sub1KeyTextField.text != "" {
                sub1Key.text = sub1KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].subCategories2[0].attributes.key = sub1KeyTextField.text!
            }
            if sub2KeyTextField.text != "" {
                sub2Key.text = sub2KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].subCategories2[1].attributes.key = sub2KeyTextField.text!
            }
            if sub3KeyTextField.text != "" {
                sub3Key.text = sub3KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].subCategories2[2].attributes.key = sub3KeyTextField.text!
            }
            if sub4KeyTextField.text != "" {
                sub4Key.text = sub4KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].subCategories2[3].attributes.key = sub4KeyTextField.text!
            }
            if sub5KeyTextField.text != "" {
                sub5Key.text = sub5KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[0].subCategories2[4].attributes.key = sub5KeyTextField.text!
            }
            sub1KeyTextField.text = ""
            sub2KeyTextField.text = ""
            sub3KeyTextField.text = ""
            sub4KeyTextField.text = ""
            sub5KeyTextField.text = ""
            
            
            if  bAr1EnTextField.text != "" {
                bAr1En.text = bAr1EnTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].attributes[0].enumId = bAr1EnTextField.text!
            }
            if  bAr1ValDesTextField.text != "" {
                bAr1ValDes.text = bAr1ValDesTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].attributes[0].value?.decription = bAr1ValDesTextField.text!
            }
            if  bAr1ValIdTextField.text != "" {
                bAr1ValId.text = bAr1ValIdTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].attributes[0].value?.id = bAr1ValIdTextField.text!
            }
            if  bAr2EnTextField.text != "" {
                bAr2En.text = bAr2EnTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].attributes[1].enumId = bAr2EnTextField.text!
            }
            if  bAr3DgtTextField.text != "" {
                bAr3Dgt.text = bAr3DgtTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].attributes[2].digits = bAr3DgtTextField.text!
            }
            if  bAr3UntTextField.text != "" {
                bAr3Unt.text = bAr3UntTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].attributes[2].unit = bAr3UntTextField.text!
            }
            if  bAr4KeyTextField.text != "" {
                bAr4Key.text = bAr4KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].attributes[3].key = bAr4KeyTextField.text!
            }
            bAr1EnTextField.text = ""
            bAr1ValDesTextField.text = ""
            bAr1ValIdTextField.text = ""
            bAr2EnTextField.text = ""
            bAr3DgtTextField.text = ""
            bAr3UntTextField.text = ""
            bAr4KeyTextField.text = ""
            
            
            if subb1KeyTextField.text != "" {
                subb1Key.text = subb1KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].subCategories2[0].attributes.key = subb1KeyTextField.text!
            }
            if subb11KeyTextField.text != "" {
                subb11Key.text = subb11KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].subCategories2[0].subcacategory?.attributes.key = subb11KeyTextField.text!
            }
            if subb2KeyTextField.text != "" {
                subb2Key.text = subb2KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].subCategories2[1].attributes.key = subb2KeyTextField.text!
            }
            if subb3KeyTextField.text != "" {
                subb3Key.text = subb3KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].subCategories2[2].attributes.key = subb3KeyTextField.text!
            }
            if subb4KeyTextField.text != "" {
                subb4Key.text = subb4KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].subCategories2[3].attributes.key = subb4KeyTextField.text!
            }
            if subb5KeyTextField.text != "" {
                subb5Key.text = subb5KeyTextField.text
                damageDataElementSet[index.row].categories.subCategories1[1].subCategories2[4].attributes.key = subb5KeyTextField.text!
            }
            subb1KeyTextField.text = ""
            subb11KeyTextField.text = ""
            subb2KeyTextField.text = ""
            subb3KeyTextField.text = ""
            subb4KeyTextField.text = ""
            subb5KeyTextField.text = ""
            
            
        }
    }
    
    @IBAction func click2Upload(_ sender: Any) {
        
        let post = writeXML(elementSet: damageDataElementSet)
        uploadAPI(content: post)
    }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return damageDataElementSet.count
    }

    
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elememt = damageDataElementSet[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! XmlCell
        cell.cellLabel.text = "Damage Element ID: \(elememt.id)"

//        dde_id = elememt.id
//        di_key = elememt.damageIntensity.key

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath
        let elememt = damageDataElementSet[indexPath.row]
        
        
        // damage Int & Ext
        deidLabel.text = elememt.id
        ogKeyLabel.text = elememt.damageIntensity.key
        ogEnumIDLabel.text = elememt.damageIntensity.enumId
        ogValueIDLabel.text = elememt.damageIntensity.value.id
        ogKeyLabelDE.text = elememt.damageExtent.key
        ogEnumIDLabelDE.text = elememt.damageExtent.enumId
        ogValueIDLabelDE.text = elememt.damageExtent.value.id
        
        // Attribute
        ar1Key.text = elememt.categories.attributes[0].key
        ar1En.text = elememt.categories.attributes[0].enumId
        ar1Val.text = elememt.categories.attributes[0].value?.id
        
        ar2Key.text = elememt.categories.attributes[1].key
        ar2En.text = elememt.categories.attributes[1].enumId
        ar2Val.text = elememt.categories.attributes[1].value?.id
        
        ar3Key.text = elememt.categories.attributes[2].key
        ar3En.text = elememt.categories.attributes[2].enumId
        ar3Val.text = elememt.categories.attributes[2].value?.id
        
        ar4Key.text = elememt.categories.attributes[3].key
        ar4Dgt.text = elememt.categories.attributes[3].digits
        ar4Unt.text = elememt.categories.attributes[3].unit
        
        ar5Key.text = elememt.categories.attributes[4].key
        
        // crack attributes
        cAr1Key.text = elememt.categories.subCategories1[0].attributes[0].key
        cAr1En.text = elememt.categories.subCategories1[0].attributes[0].enumId
        
        cAr2Key.text = elememt.categories.subCategories1[0].attributes[1].key
        cAr2En.text = elememt.categories.subCategories1[0].attributes[1].enumId
        
        cAr3Key.text = elememt.categories.subCategories1[0].attributes[2].key
        cAr3En.text = elememt.categories.subCategories1[0].attributes[2].enumId
        
        cAr4Key.text = elememt.categories.subCategories1[0].attributes[3].key
        cAr4Dgt.text = elememt.categories.subCategories1[0].attributes[3].digits
        cAr4Unt.text = elememt.categories.subCategories1[0].attributes[3].unit
        
        cAr5Key.text = elememt.categories.subCategories1[0].attributes[4].key
        cAr5Dgt.text = elememt.categories.subCategories1[0].attributes[4].digits
        cAr5Unt.text = elememt.categories.subCategories1[0].attributes[4].unit
        
        cAr6Key.text = elememt.categories.subCategories1[0].attributes[5].key
        cAr6Dgt.text = elememt.categories.subCategories1[0].attributes[5].digits
        cAr6Unt.text = elememt.categories.subCategories1[0].attributes[5].unit
        
        cAr7Key.text = elememt.categories.subCategories1[0].attributes[6].key
        
        // crack subcategories
        sub1Id.text = elememt.categories.subCategories1[0].subCategories2[0].id
        sub1CN.text = elememt.categories.subCategories1[0].subCategories2[0].categoryName
        sub1Key.text = elememt.categories.subCategories1[0].subCategories2[0].attributes.key
        
        sub2Id.text = elememt.categories.subCategories1[0].subCategories2[1].id
        sub2CN.text = elememt.categories.subCategories1[0].subCategories2[1].categoryName
        sub2Key.text = elememt.categories.subCategories1[0].subCategories2[1].attributes.key
        
        sub3Id.text = elememt.categories.subCategories1[0].subCategories2[2].id
        sub3CN.text = elememt.categories.subCategories1[0].subCategories2[2].categoryName
        sub3Key.text = elememt.categories.subCategories1[0].subCategories2[2].attributes.key
        
        sub4Id.text = elememt.categories.subCategories1[0].subCategories2[3].id
        sub4CN.text = elememt.categories.subCategories1[0].subCategories2[3].categoryName
        sub4Key.text = elememt.categories.subCategories1[0].subCategories2[3].attributes.key
        
        sub5Id.text = elememt.categories.subCategories1[0].subCategories2[4].id
        sub5CN.text = elememt.categories.subCategories1[0].subCategories2[4].categoryName
        sub5Key.text = elememt.categories.subCategories1[0].subCategories2[4].attributes.key
        
        // bio attributes
        bAr1Key.text = elememt.categories.subCategories1[1].attributes[0].key
        bAr1En.text = elememt.categories.subCategories1[1].attributes[0].enumId
        
        bAr1ValName.text = elememt.categories.subCategories1[1].attributes[0].value?.name
        bAr1ValDes.text = elememt.categories.subCategories1[1].attributes[0].value?.decription
        bAr1ValId.text = elememt.categories.subCategories1[1].attributes[0].value?.id
        
        bAr2Key.text = elememt.categories.subCategories1[1].attributes[1].key
        bAr2En.text = elememt.categories.subCategories1[1].attributes[1].enumId
        
        bAr3Key.text = elememt.categories.subCategories1[1].attributes[2].key
        bAr3Dgt.text = elememt.categories.subCategories1[1].attributes[2].digits
        bAr3Unt.text = elememt.categories.subCategories1[1].attributes[2].unit
        
        bAr4Key.text = elememt.categories.subCategories1[1].attributes[3].key
        
        // bio subcategories
        subb1Id.text = elememt.categories.subCategories1[1].subCategories2[0].id
        subb1CN.text = elememt.categories.subCategories1[1].subCategories2[0].categoryName
        subb1Key.text = elememt.categories.subCategories1[1].subCategories2[0].attributes.key
        
        subb11Id.text = elememt.categories.subCategories1[1].subCategories2[0].subcacategory?.id
        subb11CN.text = elememt.categories.subCategories1[1].subCategories2[0].subcacategory?.categoryName
        subb11Key.text = elememt.categories.subCategories1[1].subCategories2[0].subcacategory?.attributes.key
        
        subb2Id.text = elememt.categories.subCategories1[1].subCategories2[1].id
        subb2CN.text = elememt.categories.subCategories1[1].subCategories2[1].categoryName
        subb2Key.text = elememt.categories.subCategories1[1].subCategories2[1].attributes.key
        
        subb3Id.text = elememt.categories.subCategories1[1].subCategories2[2].id
        subb3CN.text = elememt.categories.subCategories1[1].subCategories2[2].categoryName
        subb3Key.text = elememt.categories.subCategories1[1].subCategories2[2].attributes.key
        
        subb4Id.text = elememt.categories.subCategories1[1].subCategories2[3].id
        subb4CN.text = elememt.categories.subCategories1[1].subCategories2[3].categoryName
        subb4Key.text = elememt.categories.subCategories1[1].subCategories2[3].attributes.key
        
        subb5Id.text = elememt.categories.subCategories1[1].subCategories2[4].id
        subb5CN.text = elememt.categories.subCategories1[1].subCategories2[4].categoryName
        subb5Key.text = elememt.categories.subCategories1[1].subCategories2[4].attributes.key
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let label = UILabel()
        label.text = "Damage Data Element List"
        label.backgroundColor = UIColor(red: 116/255, green: 154/255, blue: 162/255, alpha: 1)
        label.textAlignment = .center;

        return label

    }
    
}
