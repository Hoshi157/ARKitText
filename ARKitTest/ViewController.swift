//
//  ViewController.swift
//  ARKitTest
//
//  Created by 福山帆士 on 2020/07/04.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit
import ARKit

// firstcommit
class ViewController: UIViewController {
    
    // ARView
    private var myArSceneView: ARSCNView = {
        let arView = ARSCNView()
        return arView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myArSceneView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myArSceneView)
        
        let arSceneViewCintents = [
            myArSceneView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myArSceneView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            myArSceneView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            myArSceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(arSceneViewCintents)
        
        // session
        let mySession = ARSession()
        myArSceneView.session = mySession
        
        // debug display to point
        myArSceneView.showsStatistics = true
        myArSceneView.debugOptions = ARSCNDebugOptions.showFeaturePoints
    }
    
    // tracking
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        myArSceneView.session.run(configuration)
    }
    // stop
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        myArSceneView.session.pause()
    }


}

