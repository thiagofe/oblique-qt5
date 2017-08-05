import QtQuick 2.0
import QtQuick.Controls 2.0

SpinBox {
    id: spin
    stepSize: 50
    value: 1000
    to: 999999999    
    editable : true    
    background.opacity: 0.4;

    validator: DoubleValidator {
        bottom: spin.from
        top: spin.to
    }

    textFromValue: function(value, locale) {
        return Number(value / 100).toLocaleString(locale, 'f', 2);
    }

    valueFromText: function(text, locale) {
        return Number.fromLocaleString(locale, text) * 100;
    }

    property real realValue: value / 100.0
}
