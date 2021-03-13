//
//  XmlpParser2.swift
//  ARKitImageDetection
//
//  Created by FounderCoder on 27.01.21.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation

extension ViewController {
    
    
    // MARK: - Set an XML parser
    /// Definition according to the given objects and properties
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        switch elementName {
            case "damageDataElements":
                damageDataElements_id = attributeDict["id"]!
            case "links":
                linkedElementGuid = attributeDict["linkedElementGuid"]!; linkElementType = attributeDict["linkElementType"]!
                linkM = Link(linkedElementGuid: linkedElementGuid, linkElementType: linkElementType)
                linksM.append(linkM)
            case "categories":
                categoryName = attributeDict["categoryName"]!; applicableForObjectTypes = attributeDict["applicableForObjectTypes"]!
            case "subCategories":
                subCategoryName = attributeDict["categoryName"]!;
            case "nonDocumentFields":
                nonDocumentFields_xsi_type = attributeDict["xsi:type"]!; nonDocumentFields_key = attributeDict["key"]!; nonDocumentFields_enumId = attributeDict["enumId"] ?? ""; nonDocumentFields_digits = attributeDict["digits"] ?? ""; nonDocumentFields_unit = attributeDict["unit"] ?? ""
            case "value":
                value_description = attributeDict["description"]!; value_id = attributeDict["id"]!
            default: break
        }
        self.elementName = elementName
        
    }
    

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        let checkNum2: Int
        if ["categories", "attributes", "nonDocumentFields", "value"].contains(elementName) {
                
            /// Get the 2nd damage category
            if categoryName == "GapDamage" {
                if ["nonDocumentFields", "value"].contains(elementName) {
                    var valueM: Value!
                    if elementName == "value" {
                        valueM = Value(description: value_description, id: value_id)
                    }
                    NonDocumentFieldsList2M.append(NonDocumentFields(xsi_type: nonDocumentFields_xsi_type, key: nonDocumentFields_key, enumId: nonDocumentFields_enumId, digits: nonDocumentFields_digits, unit: nonDocumentFields_unit, value: valueM))

                    // delete the repitive items having no "Value"
                    let num = NonDocumentFieldsList2M.count
                    if num > 1 {
                        guard NonDocumentFieldsList2M[num-1].key != NonDocumentFieldsList2M[num-2].key else {
                            NonDocumentFieldsList2M.removeLast()
                            return
                        }
                    }
                }
                category2M = Category(categoryName: categoryName, applicableForObjectTypes: applicableForObjectTypes, attributes: NonDocumentFieldsList2M)
                
            }
            if NonDocumentFieldsList2M.count > 6 {
                var a: NonDocumentFields
                a = NonDocumentFieldsList2M.last!
                NonDocumentFieldsList2M.removeAll()
                NonDocumentFieldsList2M.append(a)
            }
            
            /// Get the 1st damage category
            if categoryName == "StoneDamage" {
                if ["nonDocumentFields", "value"].contains(elementName) {
                    var valueM: Value!
                    if elementName == "value" {
                        valueM = Value(description: value_description, id: value_id)
                    }

                    NonDocumentFieldsList1M.append(NonDocumentFields(xsi_type: nonDocumentFields_xsi_type, key: nonDocumentFields_key, enumId: nonDocumentFields_enumId, digits: nonDocumentFields_digits, unit: nonDocumentFields_unit, value: valueM))

                    // delete the repitive items having no "Value"
                    let num = NonDocumentFieldsList1M.count
                    if num > 1 {
                        guard NonDocumentFieldsList1M[num-1].key != NonDocumentFieldsList1M[num-2].key else {
                            NonDocumentFieldsList1M.removeLast()
                            return
                        }
                    }
                    
                    if NonDocumentFieldsList1M.count > 5 {
                        category1M = Category(categoryName: categoryName, applicableForObjectTypes: applicableForObjectTypes, attributes: Array(NonDocumentFieldsList1M[0...4]))
                    } else {
                        category1M = Category(categoryName: categoryName, applicableForObjectTypes: applicableForObjectTypes, attributes: NonDocumentFieldsList1M)
                    }
                }
            }
            if NonDocumentFieldsList1M.first?.value?.description == "Crack" {checkNum2 = 19} else {checkNum2 = 8}
            if NonDocumentFieldsList1M.count > checkNum2 {
                var a: NonDocumentFields
                a = NonDocumentFieldsList1M.last!
                NonDocumentFieldsList1M.removeAll()
                NonDocumentFieldsList1M.append(a)
            }
        }
                
        /// Get subcategory 1
        if ["Crack", "BiologicalColonisation"].contains(subCategoryName) {
            if ["nonDocumentFields", "value"].contains(elementName) {
                var valueM: Value!
                if elementName == "value" {
                    valueM = Value(description: value_description, id: value_id)
                }
                
                NonDocumentFieldsListMsub1.append(NonDocumentFields(xsi_type: nonDocumentFields_xsi_type, key: nonDocumentFields_key, enumId: nonDocumentFields_enumId, digits: nonDocumentFields_digits, unit: nonDocumentFields_unit, value: valueM))

                // delete the repitive items having no "Value"
                let num = NonDocumentFieldsListMsub1.count
                if num > 1 {
                    guard NonDocumentFieldsListMsub1[num-1].key != NonDocumentFieldsListMsub1[num-2].key else {
                        NonDocumentFieldsListMsub1.removeLast()
                        return
                    }
                }
                
            }
            if subCategoryName == "Crack" {
                let num = NonDocumentFieldsListMsub1.count
                if num > 7 {
                subCategory1M = SubCategory1(categoryName: subCategoryName, attributes: Array(NonDocumentFieldsListMsub1[num-8..<num]), subCategories2: [])
                }
            } else {
                let num = NonDocumentFieldsListMsub1.count
                if num > 7 {
                subCategory1M = SubCategory1(categoryName: subCategoryName, attributes: Array(NonDocumentFieldsListMsub1[num-9..<num-6]), subCategories2: [])
                }
            }
        }
        
        /// Get subcategory 1  "crack" has subsubcategory 2
        let listSubCategory2Name = ["SingleCrack", "Craquele", "Fracture", "HairCrack", "StarCrack", "Splitting"]
        if listSubCategory2Name.contains(subCategoryName) {
            if ["nonDocumentFields", "value"].contains(elementName) {
                var valueM: Value!
                if elementName == "value" {
                    valueM = Value(description: value_description, id: value_id)
                }
                NonDocumentFieldsListMsub2.append(NonDocumentFields(xsi_type: nonDocumentFields_xsi_type, key: nonDocumentFields_key, enumId: nonDocumentFields_enumId, digits: nonDocumentFields_digits, unit: nonDocumentFields_unit, value: valueM))

                // delete the repitive items having no "Value"
                let num = NonDocumentFieldsListMsub2.count
                if num > 1 {
                    guard NonDocumentFieldsListMsub2[num-1].key != NonDocumentFieldsListMsub2[num-2].key else {
                        NonDocumentFieldsListMsub2.removeLast()
                        return
                    }
                }
            }
        }

        if elementName == "categories" {
            categoriesM.removeAll()
            category1M.subCategories1 = subCategory1M
            if category1M != nil { categoriesM.append(category1M) }
            if category2M != nil { categoriesM.append(category2M) }

        }
        
        if elementName == "damageDataElements" {

            if NonDocumentFieldsListMsub2.count > 5 {
                for i in Array(NonDocumentFieldsListMsub2[0...5]) {
                    subCategory2M = SubCategory2(categoryName: subCategoryName, attributes: i)
                    subCategory2Set.append(subCategory2M)
                }
                categoriesM[0].subCategories1?.subCategories2 = subCategory2Set
                subCategory2Set.removeAll()
            }
            NonDocumentFieldsListMsub2.removeAll()
            
            damageDataElementSet.append(DamageDataElement(id: damageDataElements_id, linkData: linksM, categories: categoriesM))
            linksM.removeAll()
        }
    }
}

