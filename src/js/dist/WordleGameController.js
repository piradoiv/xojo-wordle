"use strict";
var Wordle;
(function (Wordle) {
    var JSONItem = XojoWeb.JSONItem;
    class GameController extends XojoWeb.XojoControl {
        constructor(id, events) {
            super(id, events);
            this.mCurrentWord = '';
            this.mRow = 0;
            this.mLetterControls = [];
            this.mCanContinue = false;
            this.validKeys = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
                'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w', 'x', 'y', 'z'];
            document.addEventListener('keyup', (event) => this.handleKeyboardEvent(event));
        }
        updateControl(data) {
            super.updateControl(data);
            const json = JSON.parse(data);
            if (typeof json.letters !== 'undefined') {
                this.mLetterControls = [];
                const letters = json.letters;
                for (let i = 0; i < letters.length; i++) {
                    const control = document.getElementById(letters[i]).querySelector('.XojoLabel');
                    this.mLetterControls.push(control);
                }
            }
            if (typeof json.row !== 'undefined') {
                if (this.mRow !== json.row) {
                    this.mCurrentWord = '';
                }
                this.mRow = json.row;
            }
            if (typeof json.can_continue !== 'undefined') {
                this.mCanContinue = json.can_continue;
            }
            if (typeof json.word !== 'undefined') {
                this.mCurrentWord = json.word;
            }
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
        handleKeyboardEvent(event) {
            if (!this.mCanContinue) {
                return;
            }
            if (event.code.toLowerCase() === 'enter') {
                const json = new JSONItem();
                json.set('word', this.mCurrentWord);
                this.triggerServerEvent('enterPressed', json, true);
                return;
            }
            if (event.code.toLowerCase() === 'backspace') {
                if (this.mCurrentWord.length === 0) {
                    return;
                }
                this.mCurrentWord = this.mCurrentWord.slice(0, -1);
                this.updateLetters();
                return;
            }
            if (this.validKeys.indexOf(event.key.toLowerCase()) !== -1) {
                if (this.mCurrentWord.length >= 5) {
                    return;
                }
                this.mCurrentWord = this.mCurrentWord + event.key.toUpperCase();
                this.updateLetters();
                const json = new JSONItem();
                json.set('word', this.mCurrentWord);
                this.triggerServerEvent('wordUpdated', json, true);
            }
        }
        updateLetters() {
            var _a;
            const wordChars = this.mCurrentWord.split('');
            for (let i = 0; i < 5; i++) {
                const control = this.mLetterControls[i].querySelector('label span');
                control.innerText = (_a = wordChars[i]) !== null && _a !== void 0 ? _a : '';
            }
        }
    }
    Wordle.GameController = GameController;
})(Wordle || (Wordle = {}));
