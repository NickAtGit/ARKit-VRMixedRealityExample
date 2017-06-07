//
//  ViewController.swift
//  ARTest
//
//  Created by Nicolo Stanciu on 06.06.17.
//  Copyright © 2017 NST. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    var arSceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arSceneView = ARSCNView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        view.addSubview(arSceneView)
        
        let replicatorLayer = CAReplicatorLayer()
        arSceneView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        replicatorLayer.instanceCount = 2
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(view.frame.size.width/2, 0, 0);
        replicatorLayer.addSublayer(arSceneView.layer)
        
        let doubleView = UIView(frame: view.frame)
        doubleView.layer.addSublayer(replicatorLayer)
        view.addSubview(doubleView)
        
        // Set the view's delegate
        arSceneView.delegate = self
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        arSceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        
        // Run the view's session
        arSceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        arSceneView.session.pause()
    }
}
