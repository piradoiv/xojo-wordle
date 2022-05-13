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
            document.addEventListener('keyup', (event) => this.handleKeyboardEvent(event));
        }
        shakeLetter(controlId) {
            const duration = 60;
            const easing = 'swing';
            const letter = $(`#${controlId}`);
            letter.clearQueue();
            for (let i = 0; i < 8; i++) {
                const newLeft = Math.floor(Math.random() * 20) - 10;
                const newTop = Math.floor(Math.random() * 20) - 10;
                letter.animate({ left: newLeft, top: newTop }, duration, easing);
            }
            letter.animate({ left: 0, top: 0 }, duration, easing);
        }
        showTooltip(controlId, message, duration = 2000) {
            const control = $(`#${controlId}`);
            control.off('hidden.bs.tooltip');
            control.on('hidden.bs.tooltip', () => control.tooltip('dispose'));
            control.tooltip({ title: message });
            control.tooltip('show');
            setTimeout(() => control.tooltip('hide'), duration);
        }
        close() {
            super.close();
            document.removeEventListener('keyup', this.handleKeyboardEvent);
        }
        handleKeyboardEvent(event) {
            if (event.code.toLowerCase() === 'enter') {
                this.triggerServerEvent('enterPressed', null, true);
                return;
            }
            if (event.code.toLowerCase() === 'backspace') {
                this.triggerServerEvent('deletePressed', null, true);
                return;
            }
            if (this.validKeys.indexOf(event.key.toLowerCase()) !== -1) {
                const json = new JSONItem();
                json.set('key', event.key.toUpperCase());
                this.triggerServerEvent('keyPressed', json, true);
            }
        }
    }
    Wordle.GameController = GameController;
})(Wordle || (Wordle = {}));
