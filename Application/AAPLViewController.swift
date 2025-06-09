/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Implementation of our cross-platform view controller
*/

#if os(macOS)
import AppKit
typealias PlatformViewController = NSViewController
#else
import UIKit
typealias PlatformViewController = UIViewController
#endif

import MetalKit

class AAPLViewController: PlatformViewController {
    var mtkView: MTKView = MTKView()
    var renderer: AAPLRenderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mtkView.frame = self.view.bounds
        self.view = mtkView
        mtkView.device = MTLCreateSystemDefaultDevice()
        
        assert(mtkView.device != nil, "Metal is not supported on this device")
        
        renderer = AAPLRenderer(mtkView: mtkView)
        
        assert(renderer != nil, "Metal is not supported on this device")
        
        // Initialize our renderer with the view size
        renderer.mtkView(mtkView, drawableSizeWillChange: mtkView.drawableSize)
        mtkView.delegate = renderer
    }
}
