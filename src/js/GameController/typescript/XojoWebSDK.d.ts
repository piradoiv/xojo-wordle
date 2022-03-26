declare namespace XojoWeb {
    export class JSONItem {
        constructor();
        get(key: string): number | string | boolean | null | JSONItem | Array<string | number | boolean | null | JSONItem>;
        set(key: string, value: number | string | boolean | null | JSONItem | Array<string | number | boolean | null | JSONItem>);
        lookup(key: string, defaultValue: number | string | boolean | null | JSONItem | Array<string | number | boolean | null | JSONItem>): number | string | boolean | null | JSONItem | Array<string | number | boolean | null | JSONItem>;
        get length(): number;
        serialize(): any;
    }

    export enum BootstrapControlColors {
        Default = "default",
        Primary = "primary",
        Secondary = "secondary",
        Success = "success",
        Danger = "danger",
        Warning = "warning",
        Info = "info",
        Light = "light",
        Dark = "dark",
        Link = "link"
    }

    export interface XojoTooltip {
        caption: string;
        placement: string;
    }

    export class XojoMenuItem { }
    export class XojoPage { }
    export class XojoDialog { }
    export class XojoControlPosition { }
    export class XojoControl {

        // If the control is on a PagePanel or TabPanel, this returns the index of the page
        get panelIndex(): number;

        // Returns the control's name
        get controlName(): string;

        // Returns the current control's ID followed by an optional suffix
        public controlID(suffix: string): string;

        protected getDebugControlName(): string;

        public implementsEvent(eventName: string): boolean;

        // Add an event to the implemented events list
        public addImplementedEvent(eventName: string): void;

        // Remove an event from the implemented events list
        public removeImplementedEvent(eventName: string): void;

        // Returns the DOM element representing the controlID, followed by an optional suffix
        public DOMElement(suffix: string): HTMLElement | null;

        // Sets the ID of the parent control
        public setParentID(newParentID: string): boolean;

        // Returns the ID of the parent control
        public get ParentID(): string;

        // Returns the parent control object
        get parentControl(): XojoControl | null;

        // Returns the XojoPage or XojoDialog that the current control is on
        get parentLayout(): XojoPage | XojoDialog | null;

        // Triggers an event on the server for the current control
        // parameters is an optional JSONItem object.
        // forced: allows you to send the event even if the user has not implemented it on the server. Use this sparingly.
        protected triggerServerEvent(eventName: string, parameters: JSONItem | null, forced: boolean): void;

        // ============== METHODS YOU SHOULD OVERRIDE ==================

        // Constructor for the control.
        // ID is the controlID corresponding to the WebControl on the server
        // events is a list of events that were implemented at design-time
        // ! NOTE: You MUST call super.constructor(ID, events) on the first line to properly initialize your control
        public constructor(ID: string, events: string[]);

        // Override this method to handle an entire control config update from the server.
        // data is a JSON formatted string
        // ! NOTE: The first thing you should do is call super.updateControl(data)!
        public updateControl(data: string): void;

        // Override this method to be notified if the browser's scale factor changes
        public scaleFactorChanged(): void;

        // Children should override if they don't normally send their changes immediately
        // This method will be called by the view if an action takes place where the user
        // would have a reasonable expectation of all control values being up to date.
        public sendDeferredChanges(): void;

        // Gets called when the parent view is being closed so the control can do any cleanup that it needs
        public close(): void;

        // Gets called by the parent view's tab engine to find out if the control contains other controls which
        // need to be tabbed into.
        public isFocusContainer(): boolean;
    }

    //*************** XojoVisualControl ***************
    export class XojoVisualControl extends XojoControl {

        // ************ Properties ************
        protected mEnabled: boolean;

        // This reflects initial state, not whether it *should* be visible.
        // For the initial Shown events to fire, this must default to false.
        protected mVisible: boolean;

        // Bootstrap properties
        protected mColor: BootstrapControlColors;
        protected mGlyph: string;
        protected mBadge: string;

        protected mTabIndex: number; // Default value is -1 to assume we're being omitted
        protected mContextMenu: XojoMenuItem | null; // Object representing the control's contextual menu

        // Position info for Fixed and Fluid Layouts (in Fluid, Left, Top, Right and Bottom will be ignored)
        protected mControlPosition: XojoControlPosition | null;

        // Tab/Page Panel Index
        public tabPanelIndex: number;
        protected mStyle: string; // string representing the user styles that should be applied to the control

        // Tooltips
        protected tooltip: XojoTooltip | null; // Tooltip object to apply to the control

        // ************ METHODS ************

        // returns the width of the control as defined in the IDE
        public width(): number;

        // returns the height of the control as defined in the IDE
        public height(): number;

        // returns the tab index for the control as defined in the IDE
        public get tabIndex(): number;

        // sets the enabled value of the control
        public set enabled(value: boolean);

        // Returns true if the control and all of its parent elements are enabled, otherwise returns false
        public get enabled(): boolean;

        // Returns the control's visible property value
        public get visible(): boolean;

        // Returns true if the control and all of its parent elements are visible, otherwise returns false.
        public get physicallyVisible(): boolean;

        // Call this method to apply a user-defined tooltip to your control
        // should be called within your render method
        protected applyOverlay(toElement: HTMLElement): void;

        // adds the specified cursor to the control's interactiveElement, if it exists.
        public setCursor(cursorName: string): void;

        // sets the enabled property and requests a refresh
        // ! subclasses should override if they require more than this, making sure to call super.setEnabled(value)
        public setEnabled(value: boolean): void;

        // sets the current control visibility
        public setVisible(value: boolean): void;

        // Sets the browser focus on the DOM element returned by focusElement() if it has a tabindex attribute. 
        public setFocus(): void;

        // Adds to a list of classes for a control based on its indicator
        // pass an array of classes to which the new class should be added
        // colorPrefix is the prefix to add to the indicator. For instance for a button, colorPrefix should be set to "btn-"
        protected applyColorAndSize(classes: string[], colorPrefix: string): void;

        // attaches a user-defined contextual menu to the specified DOM element by ID
        // parentID defaults to this.controlID
        // idx defaults to 0
        protected attachContextualMenu(parentID: string, idx: number): void;

        // Applies necessary attributes to an element for a tooltip to appear
        // el = element to apply to. Requires that the element have an ID attribute
        // this should be called in your render method
        protected applyTooltip(el: HTMLElement): void;

        // Applies user defined style values to the specified element
        // This should be called at the bottom of your render method.
        protected applyUserStyle(el: HTMLElement | null): void;

        // sets up the control's base DOM attributes
        // this should be called near the top of your render method.
        protected setAttributes(ctl: HTMLElement | null): void;

        // Removes the current control from the parent control, from the DOM, from the main control list and raises the Closed event
        public close(): void;

        // Returns the absolute left position of the control, considering all of its parent DOM elements
        protected absoluteLeft(): number;

        // Returns the absolute top position of the control, considering all of its parent DOM elements
        protected absoluteTop(): number;

        // ************ Methods that you may override ************

        // constructor for your class. must call super.constructor(ID, events) on the first line.
        constructor(ID: string, events: string[]);

        // Subclasses should override this method if they want control over how a css style is applied to their contents
        protected applyCSSStyle(propertyName: string, value: string, inherited: boolean, domEl: HTMLElement | null): void;

        // Subclasses should override if they need to take any actions on gotFocus
        public gotFocus(): void;

        // Subclasses should override if they need to take any actions on lostFocus, like sending a value to the server
        public lostFocus(): void;

        // Starts an asynchronous request to refresh the control in such a way that multiple calls within a short
        // period of time will be coalesced.
        public refresh(): void;

        // Render the control in the given state (enabled or disabled) in the provided element
        // - Controls MUST override this method if they have any on-screen representation
        // - This method MUST NOT CHANGE the state of the control.
        // - This method MUST render the control based on the value of this.enabled which is a getter.
        //   You should store the value of this.enabled at the top of the method if using it more than
        //   once as it may be an expensive call if the control is several layers deep.
        public render(): void;

        // Returns the value that should be put into the control's display style when the control is visible
        protected getVisibleValue(): string;

        // Returns the DOM element representing the part of the control that would get focus (defaults to DOMElement)
        public focusElement(): HTMLElement | null;

        // Sets the width and height of a control
        // Controls may override as necessary
        public resize(width: number, height: number): void;

        protected resized(): void;

        // Raised when the containing object was resized
        public parentResized(): void;

        // Raised when the parent page or tab panel was shown
        public parentPanelShown(): void;

        /** interactiveElement
         * Returns the interactive HTMLElement for your control or null if there isn't one.
         * Children should override if it's not DOMElement or the first enclosed input field.
         */
        public interactiveElement(): HTMLElement | null;
    }

    //************* WebFileUploader ***************
    // Uploader Callback
    interface XojoUploadEventCallback {
        (eventName: string, params: any): void;
    }

    class XojoUploaderEngine {
        // For connecting your control to the uploader
        constructor(interfaceControl: XojoVisualControl, callback: XojoUploadEventCallback);

        // Abort the upload
        abort(): void;

        // Add a file to the uploader queue
        addFile(f: File): void;

        // Get a file by index
        getFile(index: number): File;

        // Remove a file from the uploader queue
        removeFile(index: number): void;

        // Remove all files from the uploader queue
        removeAllFiles(): void;

        // Total number of bytes in the uploader queue
        totalBytes(): number;

        // How many items are in the uploader queue
        fileCount(): number;

        // Trigger the upload
        upload(): void;

        // Set the timeout period for the uploader
        setTimeout(seconds: number): void;
    }

    //************** WebListBoxCellRenderer ****************
    class ListboxColumn { }
    class ListboxCellRenderer {
        // Render the element using your renderer code
        // controlID   = Control ID of the WebListBox
        // row         = HTMLElement for the entire row. Useful if your renderer needs to change or be changed by the contents of the row itself
        // data        = Data from the Xojo portion of your renderer
        // rowIndex    = index of the row being drawn
        // columnIndex = index of the column being drawn
        // cell        = HTMLElement for the cell being drawn.
        render(controlID: string, row: HTMLElement, data: any, rowIndex: number, columnIndex: number, cell: HTMLElement);


    }

    class XojoListBox {
        // Adds your ListboxCellRenderer to the list of renderers available to any listbox in the project
        // Code like this should be put just after your class definition:
        //   XojoWeb.XojoListBox.addRenderer("your-identifier", new yourRendererClass);
        static addRenderer(CellRendererIdentifier: string, instance: ListboxCellRenderer);
    }
}