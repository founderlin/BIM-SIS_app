/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Main view controller for the AR experience.
*/

import ARKit
import SceneKit
import UIKit
import SpriteKit


class ViewController: UIViewController, ARSCNViewDelegate, XMLParserDelegate, ARSessionDelegate {
    
    var qrText: String = ""
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonDetail: UIButton!
    
    /// The  objects and properties should be pre-defined according the given XML file.
    struct DamageDataElement {
        var id: String
        var linkData: [Link] = []
        var categories: [Category] = []
    }
    
    struct Link {
        var linkedElementGuid: String
        var linkElementType: String
    }
    
    struct Category {
        var categoryName: String
        var applicableForObjectTypes: String
        var attributes: [NonDocumentFields] = []
        var subCategories1: SubCategory1?
    }
    
    struct SubCategory1 {
        var categoryName: String
        var attributes: [NonDocumentFields] = []
        var subCategories2: [SubCategory2] = []
    }
    
    struct SubCategory2 {
        var categoryName: String
        var attributes: NonDocumentFields
    }
        
    struct NonDocumentFields {
        var xsi_type: String
        var key: String
        var enumId: String?
        var digits: String?
        var unit: String?
        var value: Value?
    }
        
    struct Value {
        var description: String
        var id: String
    }
    
    /// Variable definition for XML parser
    var elementName: String = String()
    var index = IndexPath()
    var damageDataElements_id = String()
    var linkedElementGuid = String()
    var linkElementType = String()
    var categoryName = String()
    var applicableForObjectTypes = String()
    var subCategoryName = String()
    var nonDocumentFields_xsi_type = String()
    var nonDocumentFields_key = String()
    var nonDocumentFields_enumId = String()
    var nonDocumentFields_digits = String()
    var nonDocumentFields_unit = String()
    var value_description = String()
    var value_id = String()
    
    var damageDataElementM: DamageDataElement!
    var linkM: Link!
    var linksM: [Link] = []
    var category1M: Category!
    var category2M: Category!
    var categories: [Category] = []
    var categoriesM: [Category] = []
    var subCategory1M: SubCategory1!
    var subCategory2M: SubCategory2!
    var subCategory2Set: [SubCategory2] = []
    var NonDocumentFieldsListM: [NonDocumentFields] = []
    var NonDocumentFieldsList1M: [NonDocumentFields] = []
    var NonDocumentFieldsList2M: [NonDocumentFields] = []
    var NonDocumentFieldsListMsub1: [NonDocumentFields] = []
    var NonDocumentFieldsListMsub2: [NonDocumentFields] = []
    var NonDocumentFieldsListMsub2M: [NonDocumentFields] = []
    var damageDataElementSet: [DamageDataElement] = []
    
    /// Variable definition for AR view
    var itemNum = Float(1)
    var skScene: SKScene!
    var nodePosition: SCNVector3!
    var brickNode: SCNNode!
    var wallNode = SCNNode()
    var wallGridNode = SCNNode()
    var wallSolidNode = SCNNode()

//    var scene: SCNScene!
    
    /// A serial queue for thread safety when modifying the SceneKit node graph.
    let updateQueue = DispatchQueue(label: Bundle.main.bundleIdentifier! +
        ".serialSceneKitQueue")
    
    /// Convenience accessor for the session owned by ARSCNView.
    var session: ARSession {
        return sceneView.session
    }
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sceneView.delegate = self
        sceneView.session.delegate = self
        
        guard let path = URL(string: qrText) else { return print("No such URL!") }
        print(path)
        
        if let parser = XMLParser(contentsOf: path) {
            parser.delegate = self
            parser.parse()
        }
//        print(damageDataElementSet)
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		// Prevent the screen from being dimmed to avoid interuppting the AR experience.
		UIApplication.shared.isIdleTimerDisabled = true

        // Start the AR experience
        resetTracking()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)

        session.pause()
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Session management (Image detection setup)
    /// Prevents restarting the session while a restart is in progress.
    var isRestartAvailable = true

    /// Creates a new AR configuration to run on the `session`.
    /// - Tag: ARReferenceImage-Loading
	func resetTracking() {
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
	}
    

    // MARK: - ARSCNViewDelegate (Image detection results)
    /// - Tag: ARImageAnchor-Visualizing
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        let referenceImage = imageAnchor.referenceImage
        updateQueue.async { [self] in
            
            // Use SpriteKit to create text
            skScene = SKScene(size: CGSize(width: 1000, height: 1000))
            skScene.backgroundColor = UIColor.gray
            
            self.locateLabelPosition(skScene: skScene)
                        
            // Create a plane to visualize the initial position of the detected image.
            // edit the plane
            let qrWidth = referenceImage.physicalSize.width
            let qrHeight = referenceImage.physicalSize.height
            let planeWidth = 3   // unit: m
            let planeHeight = 1.8
            let plane = SCNPlane(width: CGFloat(planeWidth), height: CGFloat(planeHeight))
            let material = SCNMaterial()
            material.isDoubleSided = true
            material.diffuse.contents = skScene
            plane.materials = [material]
        
            let planeNode = SCNNode(geometry: plane)
            

            planeNode.opacity = 0.25
            planeNode.position = SCNVector3((CGFloat(planeWidth)-qrWidth) * 0.5, 0, (CGFloat(planeHeight)-qrHeight) * -0.5 )

            planeNode.eulerAngles.x = -.pi / 2
            
            planeNode.runAction(self.imageHighlightAction)
            
            // Add the plane visualization to the scene.
            node.addChildNode(planeNode)
            
            let scene = SCNScene(named: "art.scnassets/wall.scn")!
            let itemlist = ["11", "12", "13", "21", "22", "23", "31", "32", "33", "41", "42", "43", "51", "52", "53"]
            
            for i in itemlist {
                let brickNode = scene.rootNode.childNode(withName: "box\(i)", recursively: true)
                brickNode!.geometry?.firstMaterial?.fillMode = .lines
                brickNode!.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
                wallGridNode.addChildNode(brickNode!)
            }

            wallGridNode.eulerAngles.x = -.pi / 2
            wallGridNode.eulerAngles.z = -.pi / 6
            wallGridNode.position = SCNVector3(-0.2,1,0)
            
            let solidBrickList = showRedBrick()
            for i in solidBrickList {wallSolidNode.addChildNode(i)}
            wallSolidNode.eulerAngles.x = -.pi / 2
            wallSolidNode.eulerAngles.z = -.pi / 6
            wallSolidNode.position = SCNVector3(-0.2,1,0)

            node.addChildNode(wallGridNode)
            node.addChildNode(wallSolidNode)
        }
    }
    
    // MARK: - Press the button to get the next item
    @IBAction func plusOne(_ sender: UIButton) {
        itemNum = itemNum + 1
        self.locateLabelPosition(skScene: skScene)
        self.refreshBrick(itemNum: Int(itemNum))

    }
    
    @IBAction func minusOne(_ sender: UIButton) {
        itemNum = itemNum - 1
        self.locateLabelPosition(skScene: skScene)
        self.refreshBrick(itemNum: Int(itemNum))
        
    }
    
    @IBAction func showDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    // MARK: - Pass data to the Show View Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2" {
            let vc = segue.destination as? ShowViewController
            
            if self.itemNum < 1 {
                self.itemNum = Float(damageDataElementSet.count)
            } else if self.itemNum > Float(damageDataElementSet.count) {
                self.itemNum = 1
            }
            
            vc?.textSample = String(self.itemNum)
            let idx = Int(self.itemNum)-1
        }
    }
    
    // MARK: - Set 3D model
    
    func refreshBrick(itemNum: Int) {
        
        if self.itemNum < 1 {
            self.itemNum = Float(damageDataElementSet.count)
        } else if self.itemNum > Float(damageDataElementSet.count) {
            self.itemNum = 1
        }
        
        let scene = SCNScene(named: "art.scnassets/wall.scn")!
        let itemlist = ["11", "12", "13", "21", "22", "23", "31", "32", "33", "41", "42", "43", "51", "52", "53"]

        for i in 0..<itemlist.count {
            let it = itemlist[i]
            let brickNode = scene.rootNode.childNode(withName: "box\(it)", recursively: true)
            brickNode!.geometry?.firstMaterial?.fillMode = .lines
            brickNode!.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            wallGridNode.replaceChildNode(wallGridNode.childNodes[i], with: brickNode!)
        }
        
        while wallSolidNode.childNodes.count > 0 { wallSolidNode.childNodes[0].removeFromParentNode() }
        let solidBrickList = showRedBrick()
        for i in solidBrickList { wallSolidNode.addChildNode(i) }
//        wallSolidNode.replaceChildNode(wallSolidNode.childNodes[lastid-1], with: showRedBrick())
    }
    
    func showRedBrick() -> [SCNNode] {
        
        var redBricks: [SCNNode] = []

        // add the 3D model
        let scene = SCNScene(named: "art.scnassets/wall.scn")!
        let damage = [["box22", "box23"], ["box11"], ["box52", "box42"], ["box13"]]
        let damageSlide = damage[Int(itemNum)-1]
        
        for i in damageSlide {
            redBricks.append(scene.rootNode.childNodes.filter({ $0.name == i })[0])
        }
                
//        redBrick.geometry =  redBrick.geometry!.copy() as? SCNGeometry
//        redBrick.geometry?.firstMaterial =  redBrick.geometry?.firstMaterial!.copy() as? SCNMaterial
//        redBrick.geometry?.firstMaterial?.fillMode = .fill
//        redBrick.geometry?.firstMaterial?.diffuse.contents = UIColor.red

        return redBricks
    }
    
    // MARK: - Set labels and planes
    func locateLabelPosition(skScene: SKScene) {
                
        skScene.removeAllChildren()
        
        if self.itemNum < 1 {
            self.itemNum = 5
        } else if self.itemNum > 5 {
            self.itemNum = 1
        }
        let itemNo = self.itemNum - 1
        
        let distance = Float(150)
        
        let range = 0...damageDataElementSet.count - 1
        for index in range {
            let damIndex = Float(index)
//
//            let rectX = CGFloat(Float(self.foods[index].x) ?? 0)
//            let rectY = CGFloat(Float(self.foods[index].y) ?? 0)
//            let rectWidth = CGFloat(Float(self.foods[index].width) ?? 0)
//            let rectHeight = CGFloat(Float(self.foods[index].height) ?? 0)
//
//            let rectangle = SKShapeNode(rect: CGRect(x: rectX, y: rectY, width: rectWidth, height: rectHeight))
//            rectangle.fillColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//            rectangle.alpha = 1
//            let hidden = fIndex - itemNo
//            if hidden != 0 {
//                rectangle.isHidden = true
//            }
//            skScene.addChild(rectangle)

            self.addLabelNode(text: "Item "+String(index + 1), xPosition: 50, yPosition: 50 - distance * (damIndex - itemNo), hidden: damIndex - itemNo, skScene: skScene)
            self.addLabelNode(text: "Damage Data Element \n ID: "+self.damageDataElementSet[index].id, xPosition: 50, yPosition: 150 - distance * (damIndex - itemNo), hidden: damIndex - itemNo, skScene: skScene)
            
            var Text_Category1 = "  | Category One \n  | CategoryName: " + self.damageDataElementSet[index].categories[0].categoryName +
                "\n  || Attributes: \n "
            for attribute in self.damageDataElementSet[index].categories[0].attributes {
                if attribute.value != nil {
                    Text_Category1 += " ||-- \(attribute.key) [ \(attribute.value!.description) ] \n "
                } else {
                    Text_Category1 += " ||-- \(attribute.key) \n "
                }
            }
            
            self.addLabelNode(text: Text_Category1, xPosition: 50, yPosition: 400 - distance * (damIndex - itemNo), hidden: damIndex - itemNo, skScene: skScene)
        }
    }
    
    func addLabelNode(text: String, xPosition: Float, yPosition: Float, hidden: Float, skScene: SKScene) {
        
        let labelNode = SKLabelNode(text: text)
        labelNode.fontSize = 40
        labelNode.fontColor = UIColor.black
        labelNode.fontName = "Gill Sans Light"
        labelNode.position = CGPoint(x:CGFloat(xPosition),y:CGFloat(yPosition))
        labelNode.horizontalAlignmentMode = .left
        labelNode.verticalAlignmentMode = .center
        labelNode.zRotation = .pi
        labelNode.xScale = labelNode.xScale * -1
        labelNode.numberOfLines = 2

        if hidden != 0 {
            labelNode.isHidden = true
        }
        skScene.addChild(labelNode)
        
    }

    var imageHighlightAction: SCNAction {
        return .sequence([
            .wait(duration: 0.25),
            .fadeOpacity(to: 0.85, duration: 0.25),
            .fadeOpacity(to: 0.15, duration: 0.25),
            .fadeOpacity(to: 0.85, duration: 0.25),
//            .fadeOut(duration: 10),
//            .removeFromParentNode()
        ])
    }
}
