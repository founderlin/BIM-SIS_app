//
//  XmlParser.swift
//  XML2tabview
//
//  Created by FounderCoder on 17.01.21.
//

import UIKit
import Foundation


extension Input1ViewController {
    
    // MARK: - Set an XML parser
    /// Definition according to the given objects and properties
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        switch elementName {
            case "damageDataElements":
                dde_id = attributeDict["id"]!
            case "damageIntensity":
                di_key = attributeDict["key"]!; di_enumId = attributeDict["enumId"]!
            case "value":
                if attributeDict["name"] == "DAMAGE_INTESITY"
                { di_v_n = attributeDict["name"]!; di_v_d = attributeDict["description"]!; di_v_id = attributeDict["id"]!; print(di_v_id)}
                else if attributeDict["name"] == "DAMAGE_EXTENT"
                { de_v_n = attributeDict["name"]!; de_v_d = attributeDict["description"]!; de_v_id = attributeDict["id"]! }
                else
                { valList.append([attributeDict["name"]!, attributeDict["description"]!, attributeDict["id"]!])}
            case "damageExtent":
                de_key = attributeDict["key"]!; de_enumId = attributeDict["enumId"]!
            case "links":
                linkedEG = attributeDict["linkedElementGuid"]!; linkedET = attributeDict["linkElementType"]!;
                linkList.append([linkedEG, linkedET])
            case "categories":
                categoriesID = attributeDict["id"]!; categoriesNM = attributeDict["categoryName"]!;
                categoriesList.append([categoriesID, categoriesNM])
            case "subCategories":
                subcategoriesID = attributeDict["id"]!; subcategoriesNM = attributeDict["categoryName"]!;
                subcategoriesList.append([subcategoriesID, subcategoriesNM])
            case "nonDocumentFields":
                NDFxsitype = attributeDict["xsi:type"]!; NDFkey = attributeDict["key"]!; NDFenumId = attributeDict["enumId"] ?? ""; NDFdigits = attributeDict["digits"] ?? ""; NDFunit = attributeDict["unit"] ?? "";
                NDFList.append([NDFxsitype, NDFkey, NDFenumId, NDFdigits, NDFunit])
            default: break
        }
        self.elementName = elementName
        

    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "damageDataElements" {
            let vale_di = Value(name: di_v_n, decription: di_v_d, id: di_v_id)
            let vale_de = Value(name: de_v_n, decription: de_v_d, id: de_v_id)
            let damageI = DamageIntensity(key: di_key, enumId: di_enumId, value: vale_di)
            let damageE = DamageExtent(key: de_key, enumId: de_enumId, value: vale_de)
            
//            let subcate13 = subcategoriesList.remove(at: 8)
            let subcate11 = subcategoriesList.remove(at: 6)
            let subcate12 = subcategoriesList.remove(at: 0)
            let subcate1 = [subcate12, subcate11]
        
            
            for i in 0...1 {
                /// Set atributes of subcategories2
                sub2Set.removeAll(keepingCapacity: false)
                if  i == 0 {
                    for j in 0...4 {
                        let item1 = NDFList[j]
                        let ndf = NonDocumentFields(xsitype: item1[0], key: item1[1], enumId: item1[2], digits: item1[3], unit: item1[4]);
                        let item2 = subcategoriesList[j]
                        let subc2 = SubCategories2(id: item2[0], categoryName: item2[1], attributes: ndf, applicableForObjectTypes: "STONE")
                        sub2Set.append(subc2)
                    }
                } else {
                    for j in 14...18 {
                        let item1 = NDFList[j]
                        let ndf = NonDocumentFields(xsitype: item1[0], key: item1[1], enumId: item1[2], digits: item1[3], unit: item1[4]);
                        if j == 14 {
                            let item2 = subcategoriesList[5]
                            let ndf2 = NonDocumentFields(xsitype: NDFList[13][0], key: NDFList[13][1], enumId: NDFList[13][2], digits: NDFList[13][3], unit: NDFList[13][4])
                            let subc3 = SubCategories3(id: subcategoriesList[6][0], categoryName: subcategoriesList[6][1], attributes: ndf2, applicableForObjectTypes: "STONE")
                            let subc2 = SubCategories2(id: item2[0], categoryName: item2[1], attributes: ndf, applicableForObjectTypes: "STONE", subcacategory: subc3)
                            sub2Set.append(subc2)
//                            print(subc2)
                        } else {
                            let item2 = subcategoriesList[j-8]
                            let subc2 = SubCategories2(id: item2[0], categoryName: item2[1], attributes: ndf, applicableForObjectTypes: "STONE")
                            sub2Set.append(subc2)
                        }
                    }
                }
//                print(sub2Set)
                
                /// Set atributes of subcategories1
                attr.removeAll(keepingCapacity: true)
                if i == 0 {
                    for item in NDFList[5...12] {
                        let ndf = NonDocumentFields(xsitype: item[0], key: item[1], enumId: item[2], digits: item[3], unit: item[4]);
                        attr.append(ndf)
                    }
                } else {
                    let item1 = valList[0]
                    let val = Value(name: item1[0], decription: item1[1], id: item1[2])
                    let item = NDFList[19]
                    let ndf = NonDocumentFields(xsitype: item[0], key: item[1], enumId: item[2], digits: item[3], unit: item[4], value: val);
                    attr.append(ndf)
                    for item in NDFList[20...22] {
                        let ndf = NonDocumentFields(xsitype: item[0], key: item[1], enumId: item[2], digits: item[3], unit: item[4]);
                        attr.append(ndf)
                    }
                }

                let item2 = subcate1[i]
                let subc1 = SubCategories1(id: item2[0], categoryName: item2[1], subCategories2: sub2Set, attributes: attr, applicableForObjectTypes: "STONE")
                sub1Set.append(subc1)
            }
            
//            print(sub1Set)
            
            /// Set atributes of categories
            attr.removeAll(keepingCapacity: true)
            for i in NDFList.count-5..<NDFList.count-2 {
                let item2 = valList[i - (NDFList.count-5)]
                let val = Value(name: item2[0], decription: item2[1], id: item2[2])
                let item = NDFList[i]
                let ndf = NonDocumentFields(xsitype: item[0], key: item[1], enumId: item[2], digits: item[3], unit: item[4], value: val);
                attr.append(ndf)
            }
            for i in NDFList.count-2..<NDFList.count {
                let item = NDFList[i]
                let ndf = NonDocumentFields(xsitype: item[0], key: item[1], enumId: item[2], digits: item[3], unit: item[4]);
                attr.append(ndf)
            }
            
            let cate = Categories(id: categoriesID, categoryName: categoriesNM, subCategories1: sub1Set, attributes: attr, applicableForObjectTypes: "STONE" )
            
            for i in 0..<linkList.count {
                let item = linkList[i]
                let link = Links(linkedElementGuid: item[0], linkElementType: item[1])
                linkSet.append(link)
            }
            
            let lkda = LinkData(links: linkSet)
            
            let element = DamageDataElement(id: dde_id, linkData: lkda, categories: cate, damageIntensity: damageI, damageExtent: damageE)
            damageDataElementSet.append(element)
            
//            print(damageDataElementSet)
        }
    }
    
}


