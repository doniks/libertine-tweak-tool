import QtQuick 2.4
import QtQuick.Controls 2.2
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

                ComboBox {
                    id:selector
                    anchors.centerIn: parent
                    //model: fakeFolderModel
                    model: folderModel
                    delegate: folderDelegate
                    textRole:'fileName'
                }

                ItemDelegate{
                    id: folderDelegate
                    text:fileName
                }

                ListModel {
                    id:fakeFolderModel
                    ListElement {fileName: "apples"}
                    ListElement {fileName: "oranges" }
                    ListElement {fileName: "kiwi" }
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
