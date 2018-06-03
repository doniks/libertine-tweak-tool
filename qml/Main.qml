import QtQuick 2.4
import QtQuick.Layouts 1.1

import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.ListItems 1.3

import LTT 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'libertine-tweak-tool.doniks'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
    property int space: units.gu(1)
    property real opaque: 0.4
    property int btnWidth: units.gu(12)
    property int titleWidth: units.gu(40)
    property int checkboxWidth: units.gu(8)
    property int valueWidth: units.gu(30)
    property int sliderWidth: page.width - titleWidth - checkboxWidth - valueWidth

    Page {
        id: page
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Libertine Tweak Tool')
        }

    //        MyType{
    //            id:mine
    //        }

        Rectangle{
            // fill all the space below the header
            anchors{
                left:parent.left
                right: parent.right
                top:header.bottom
                bottom:parent.bottom
            }

            Rectangle{
                // fill but leave a border
                anchors.centerIn: parent
                width: parent.width - 2* root.space
                height: parent.height - 2* root.space


                StartPage{
                    anchors.fill:parent
                }

            }


        }


    }

    //Component.onCompleted: LTT.speak()
}
