namespace Wordle {
    import JSONItem = XojoWeb.JSONItem;

    export class GameController extends XojoWeb.XojoControl {
        private mCurrentWord = '';
        private mRow = 0;
        private mLetterControls: HTMLElement[] = [];
        private mCanContinue = false;
        private validKeys: String[] = ['a', 'b', 'c', 'd', 'e','f', 'g', 'h',
            'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
            't', 'u', 'v', 'w', 'x', 'y', 'z'];

        constructor(id: string, events: string[]) {
            super(id, events);
            document.addEventListener('keyup', (event) => this.handleKeyboardEvent(event));
        }

        updateControl(data: string) {
            super.updateControl(data);
            const json = JSON.parse(data);
            if (typeof json.letters !== 'undefined') {
                this.mLetterControls = [];
                const letters = json.letters;
                for (let i = 0; i < letters.length; i++) {
                    const control = <HTMLElement>document.getElementById(letters[i])!.querySelector('.XojoLabel')!;
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
        }

        public shakeLetter(controlId: string) {
            const duration = 60;
            const easing = 'swing';
            const letter = $(`#${controlId}`);
            letter.clearQueue();
            for (let i = 0; i < 8; i++) {
                const newLeft = Math.floor(Math.random() * 20) - 10;
                const newTop = Math.floor(Math.random() * 20) - 10;
                letter.animate({left: newLeft, top: newTop}, duration, easing);
            }
            letter.animate({left: 0, top: 0}, duration, easing);
        }

        public showTooltip(controlId: String, message: String, duration: number = 2000) {
            const control = $(`#${controlId}`);
            control.off('hidden.bs.tooltip');
            control.on('hidden.bs.tooltip', () => control.tooltip('dispose'));
            control.tooltip({title: message});
            control.tooltip('show');
            setTimeout(() => control.tooltip('hide'), duration);
        }

        private handleKeyboardEvent(event: KeyboardEvent) {
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
            }
        }

        private updateLetters() {
            const wordChars = this.mCurrentWord.split('');
            for (let i = 0; i < 5; i++) {
                const control = <HTMLSpanElement>this.mLetterControls[i].querySelector('label span')!;
                control.innerText = wordChars[i] ?? '';
            }
        }
    }
}
