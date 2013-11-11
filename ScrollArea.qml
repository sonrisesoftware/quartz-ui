import QtQuick 2.0

Rectangle {
	id: root
	
	width: orientation == Qt.Vertical ?
		itemWidth :// + scrollBar.width + 5 :
		itemWidth * itemCount + itemSpacing * (itemCount - 1)
	height: orientation == Qt.Vertical ?
		itemHeight * itemCount + itemSpacing * (itemCount - 1) :
		itemHeight// + scrollBar.height + 5
	
	property int itemWidth
	property int itemHeight
	property int itemCount
	property alias itemSpacing: list.spacing;
	property alias model: list.model;
	property alias delegate: list.delegate;
	property variant orientation: Qt.Vertical;
	color: "transparent";
	
	ListView {
		id: list
		
		height: itemHeight
		
		snapMode: ListView.SnapToItem
		clip: true
		orientation: root.orientation
	}
	
	ScrollBar {
		id: scrollBar
		
		orientation: root.orientation
		target: list
	}
	
	states: [
		State {
			when: orientation == Qt.Horizontal
			PropertyChanges { target: list; 
				anchors {
					top: root.top
					bottom: root.bottom
					//bottom: scrollBar.top;
					//bottomMargin: 5;
					left: root.left;
					right: root.right;
				}
			}
			PropertyChanges { target: scrollBar; 
				anchors {
					left: root.left; leftMargin: 2;
					right: root.right; rightMargin: 2;
					bottom: root.bottom;
				}
			}
		},
		State {
			when: orientation == Qt.Vertical
			PropertyChanges { target: list; 
				anchors {
					top: root.top;
					bottom: root.bottom;
					left: root.left;
					//right: scrollBar.right;
					//rightMargin: 5;
					right: root.right
				}
			}
			PropertyChanges { target: scrollBar; 
				anchors {
					top: root.top; topMargin: 2;
					bottom: root.bottom; bottomMargin: 2;
					right: root.right
				}
			}
		}
	]
}
