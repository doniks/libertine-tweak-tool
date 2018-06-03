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
    property int margin: units.gu(9)
    property real opaque: 0.4
    property int btnWidth: units.gu(12)



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
            property int border: units.gu(5)
            anchors{
                horizontalCenter: parent
                top: header.bottom
                bottom: parent.bottom - border
                width: parent.width - 2 * border
            }

        Column {
            id: pageLayout
            anchors.fill:parent



            //            spacing: root.margins * 2
            Row {
                spacing: root.margin
//                TextField {
//                    id: inputContainer
//                    font.pixelSize: FontUtils.sizeToPixels("medium")
//                    text: 'vivid'
//                }
                ComboButton {
                    text: "inputContainer"
                    ListView {
                        model: containers
                        delegate: Standard {
                            text: "Item " + name
                        }
                    }
                }
            }

            ListModel{
                id: containers
                ListElement{
                    name:"susi"
                }
                ListElement{
                    name:"vivid"
                }
            }



            property int titleWidth: units.gu(40)
            property int checkboxWidth: units.gu(8)
            property int valueWidth: units.gu(30)
            property int sliderWidth: page.width - titleWidth - checkboxWidth - valueWidth

            Row {
                spacing: root.margin
                Label {
                    text: "DPI"
                    width: titleWidth
                }
                CheckBox {
                    id: dpiCheck
                    checked: true
                }
                Slider {
                    id: dpiSlider
                    minimumValue: 96
                    maximumValue: 300
                    stepSize: 10
                    live: true
                    width: sliderWidth
                    property int intValue: value
                    value: 96
                    enabled: dpiCheck.checked
                    opacity: dpiCheck.checked ? 1 : root.opaque
                }
                Label {
                    id: dpiLabel
                    text: dpiSlider.intValue
                    enabled: dpiCheck.checked
                    opacity: dpiCheck.checked ? 1 : root.opaque
                }
            }//Row

            Row {
                spacing: root.margin
                Label {
                    text: "Scroll bars"
                    width: titleWidth
                }
                CheckBox {
                    id: scrollbarCheck
                    checked: true
                }
                Slider {
                    id: scrollbarSlider
                    minimumValue: 10
                    maximumValue: 100
                    stepSize: 1
                    live: true
                    width: sliderWidth
                    property int intValue: value
                    value: 50
                    enabled: scrollbarCheck.checked
                    opacity: scrollbarCheck.checked ? 1 : root.opaque
                }
                Label {
                    id: scrollbarLabel
                    text: scrollbarSlider.intValue
                    enabled: scrollbarCheck.checked
                    opacity: scrollbarCheck.checked ? 1 : root.opaque
                }
            }//Row

        }//Column



        /*
// Shells
    l-c-m exec -c bash
        This command does not mount any user directories
        (/home/phablet will not exist) and is best used for
        making changes to the container's rootfs)

    DISPLAY= libertine-launch <containerid (default is vivid)> bash
        This mounts user directories, but is no different than
        if you installed something like mate-terminal and ran it.
        The reason we are passing an empty DISPLAY variable is
        because libertine-launch will refuse to start if DISPLAY
        isn't set, even it if doesn't exist.

//Themes:

You can make your applications look great still, you don't have to be stuck with the default Raleigh GTK style. Download and install LXAppearance in your container and add ppa:noobslab/themes then start installing themes. Enjoy! The Ubuntu Touch Themes are wonderful and FlatPlat works well with the system UI as well.
*/

        Component {
            id: dialog
            Dialog {
                id: dialogue
                title: "Wipe user data"
                text: "This will delete all user data inside the libertine container. Are you sure?"
                Button {
                    text: "Cancel"
                    onClicked: PopupUtils.close(dialogue)
                }
                Button {
                    text: "Ok"
                    color: UbuntuColors.orange
                    onClicked: PopupUtils.close(dialogue)
                }
            }
        }



        Button {
            id: wipeHomeBtn
            anchors{
                bottom: quitBtn.top
                left:parent.left
            }
            text: i18n.tr("Wipe")
            width: btnWidth
            onClicked: {
                PopupUtils.open(dialog)
                console.log("wipe");
                LTT.wipeHome( inputContainer.text );
            }
        }

        Button {
            id: quitBtn
            anchors{
                bottom: parent.bottom
                left: parent.left
            }

            //objectName: "clearBtn"
            text: i18n.tr("Quit")
            width: btnWidth
            onClicked: {
                Qt.quit();
            }
        }






        Button {
            id: testBtn
            anchors{
                bottom: applyBtn.top
                right: parent.right
            }

            //objectName: "clearBtn"
            text: i18n.tr("List")
            width: units.gu(12)
            onClicked: {
                console.log("list");
                //allFiles =
                LTT.listContainers();

                //console.log(allFiles);

            }
        }

        Button {
            id: applyBtn
            anchors{
                bottom: parent.bottom
                right: parent.right
            }

            //objectName: "clearBtn"
            text: i18n.tr("Apply")
            width: units.gu(12)
            onClicked: {
                console.log("apply");
                if ( dpiCheck.checked )
                    LTT.writeXdefaults( inputContainer.text, dpiSlider.intValue );
                if ( scrollbarCheck.checked )
                    LTT.writeGtkCSS( inputContainer.text, scrollbarSlider.intValue )

//                QUrl(QStringLiteral("qrc:///assets/test5.txt"));
            }
        }

        } // Rectangle

    } // Page

    //Component.onCompleted: LTT.speak()
}
