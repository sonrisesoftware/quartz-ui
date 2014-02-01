import QtQuick 2.0
import QtWebKit 1.0

WebView {
    id: webview
    width: 100
    height: 62

    property string username
    property url url

//    onUsernameChanged: load()
//    onUrlChanged: load()
//    Component.onCompleted: load()

    data: "<script id='fblk2gw'>(function(i){var f,s=document.getElementById(i);f=document.createElement('iframe');f.src='//api.flattr.com/button/view/?uid=" + username + "&button=compact&url=" + url + "';f.title='Flattr';f.height=20;f.width=110;f.style.borderWidth=0;s.parentNode.insertBefore(f,s);})('fblk2gw');</script>"
}
