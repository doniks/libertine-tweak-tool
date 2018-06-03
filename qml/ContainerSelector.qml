import QtQuick 2.4
import QtQuick.Layouts 1.1

import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.ListItems 1.3

import Qt.labs.folderlistmodel 2.1


Item{
    //anchors.fill:parent
    Rectangle{
        id:overview
        height: parent.height * 0.2
        width: parent.width
        Column{
            Row{
                spacing: 3
                Label{
                    text:"folderModel.folder="
                }
                Label{
                    text:folderModel.folder
                }
                Label{
                    text: folderModel.status === FolderListModel.Ready ? '[Loaded]' : '[Not loaded]'
                }
            }
            Row{
                spacing: 3
                Label{
                    text:selector.currentIndex + ":(" + selector.currentText + "/" + selector.textAt(selector.currentIndex)+ ")"
                }
                Label{
                    text: "[" + folderModel.count + "]"
                }
            }
            Row{

                ComboButton{
                    id:selector
                    width:300
                    height:50

                    ListView{

                        model: folderModel
                        delegate: {
                            //id: folderDelegate
                            text: "Item #" + fileName
                        }
                        //textRole:'fileName'
                    }
                }


                FolderListModel {
                    id: folderModel
                    folder:"file:///home/peter/"
                    showDirsFirst: true
                    showFiles: true
                    nameFilters: ["*"]
                }

            }
        }
    }
}
