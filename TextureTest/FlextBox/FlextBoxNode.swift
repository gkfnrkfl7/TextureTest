//
//  FlextBoxNode.swift
//  TextureTest
//
//  Created by 박기석 on 2019/12/30.
//  Copyright © 2019 Peter. All rights reserved.
//

import AsyncDisplayKit

class FlexBoxNode: ASDisplayNode {
    
    // MARK: UI Properties
    
    let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "Image")
        node.borderColor = UIColor.gray.cgColor
        node.borderWidth = 1
        node.cornerRadius = 15
        node.contentMode = .scaleAspectFit
        return node
    }()
    
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        node.attributedText = NSAttributedString(string: "asdfasef asdfasef asdfasef asdfasef asdfasef asdfasef asdfasef asdfasef asdfasef asdfasef asdfasef asdfasef",
                                                 attributes: [.font: UIFont.boldSystemFont(ofSize: 15),
                                                              .foregroundColor: UIColor.gray,
                                                              .paragraphStyle: paragraphStyle])
        return node
    }()
    
    // MARK: Node Life Cycle
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    override func layout() {
        super.layout()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let imageLayout = ASRatioLayoutSpec(ratio: 1.0, child: imageNode)
        imageLayout.style.width = .init(unit: .points, value: 50.0)
        
        imageLayout.style.flexShrink = 0.0
        imageLayout.style.flexGrow = 1.0
        titleNode.style.flexShrink = 1.0
        titleNode.style.flexGrow = 1.0
        
        let containerLayout = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 10,
                                                justifyContent: .center,
                                                alignItems: .center,
                                                children: [imageLayout, titleNode])
        
        var containerInsets: UIEdgeInsets = self.safeAreaInsets
        containerInsets.left += 15
        containerInsets.right += 15
        containerInsets.top = containerInsets.bottom
        
        return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
    }
}
