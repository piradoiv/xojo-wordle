"use strict";
var Wordle;
(function (Wordle) {
    var JSONItem = XojoWeb.JSONItem;
    class GameController extends XojoWeb.XojoControl {
        constructor(id, events) {
            super(id, events);
            this.validKeys = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
                'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w', 'x', 'y', 'z'];
            document.addEventListener('keyup', (event) => {
                if (event.code.toLowerCase() === 'enter') {
                    this.triggerServerEvent('enterPressed', null, true);
                    return;
                }
                if (event.code.toLowerCase() === 'backspace') {
                    this.triggerServerEvent('deletePressed', null, true);
                    return;
                }
                if (this.validKeys.indexOf(event.key.toLowerCase()) === -1) {
                    return;
                }
                const json = new JSONItem();
                json.set('key', event.key.toUpperCase());
                this.triggerServerEvent('keyPressed', json, true);
            });
        }
    }
    Wordle.GameController = GameController;
})(Wordle || (Wordle = {}));
