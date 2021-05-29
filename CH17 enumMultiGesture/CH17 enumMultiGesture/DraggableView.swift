//
//  DraggableView.swift
//  CH17 enumMultiGesture
//
//  Created by 陳冠甫 on 2021/2/2.
//

import SwiftUI

enum DraggableState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize{
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing:Bool{
        switch self {
        case .pressing:
            return true
        case .inactive, .dragging:
            return false
        }
    }
    
    var isMoving:Bool{
        switch self {
        case .inactive, .pressing:
            return false
        case .dragging:
            return true
        }
    }
    
}


struct DraggableView<Content>:View where Content: View {
    
    @GestureState private var dragState = DraggableState.inactive
    @State private var position = CGSize.zero
    
    var content: () -> Content
    
    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1)
            .foregroundColor(dragState.isMoving ? .gray : .red)
            .shadow(color: .black, radius: dragState.isMoving ? 10 : 0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut)
            .gesture(
                LongPressGesture(minimumDuration: 1)
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: {(value, state, transaction) in
                        
                        switch value{
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else{
                            return
                        }
                        
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                        
                    })
            )
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView() {
            Text("Swift")
                .font(.system(size: 50, weight: .bold, design: .rounded))
        }
    }
}
