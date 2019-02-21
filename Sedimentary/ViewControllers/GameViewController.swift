//
//  GameViewController.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/11.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var scnView: SCNView {
        return view.subviews[0] as! SCNView
    }
    
    var scene: SCNScene {
        return scnView.scene!
    }

    var rootNode: SCNNode {
        return scene.rootNode
    }
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var dataOperator: DataOperator {
        return appDelegate.dataOperator!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let scene = SCNScene(named: "art.scnassets/world.scn")!
        scnView.scene = scene
        
        showFoods()
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.dataChanged), name: Notification.Name.NSManagedObjectContextDidSave, object: appDelegate.dataOperator?.context)
    }
    
    @objc
    func dataChanged(_ notification: Notification) {
        showFoods()
    }
    
    func showFoods() {
        let table = rootNode.childNode(withName: "dining_table", recursively: false)!
        table.enumerateChildNodes() { (child, _) in
            if child.name != "food_transforms" {
                child.removeFromParentNode()
            }
        }
        
        let names = currentFoods()
        let foodTransforms = table.childNode(withName: "food_transforms", recursively: false)!
        let randomXy = RandomXy()
        names.forEach() { name in
            let food = foodTransforms.clone()
            food.geometry = SCNText(string: name, extrusionDepth: 0)
            food.isHidden = false
            let xy = randomXy.next()
            food.position = SCNVector3(x: food.position.x + Float(xy.x) * 0.4, y: food.position.y, z: food.position.z + Float(xy.y) * 0.4)
            table.addChildNode(food)
        }
        scnView.setNeedsDisplay()
    }
    
    func currentFoods() -> [String] {
        let (day, hour) = currentDayAndHour()
        return dataOperator.getFoodsAt(day: day, hour: hour)
    }
}
