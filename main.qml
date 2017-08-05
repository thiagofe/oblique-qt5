import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Universal 2.0

ApplicationWindow {
    title: qsTr("Oblique - Lançamento de Projétil")

    visible: true
    //width: 640
    //height: 760
    minimumWidth: 400
    minimumHeight: 600
    maximumHeight: 760

    Universal.theme: Universal.Dark
    Universal.accent: Universal.White


    MainPage {
        anchors.fill: parent        
    }
}


