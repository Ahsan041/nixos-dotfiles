''
@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

/* leaves space for the window buttons */
#nav-bar {
	margin-top: -38px !important;
	margin-right: 138px !important;
	margin-bottom: -4px !important;
}

/* hides the sidebar header */
#sidebar-header {
	display: none !important;
}

.tab[selected="true"] {
	visibility: collapse;
	height: 0px;
}

.tabbrowser-tab {
	visibility: collapse;
	height: 0px;
}

.tabbrowser-tab[visuallyselected="true"] {
	visibility: collapse;
	height: 0px;
}

/* Credits to https://github.com/MrOtherGuy for hthe following snippet*/

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/autohide_sidebar.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Show sidebar only when the cursor is over it */
/* The border controlling sidebar width will be removed so you'll need to modify these values to change width */

#sidebar-box {
	--uc-sidebar-width: 44px; /* Only thing I (gale) changed */
	--uc-sidebar-hover-width: 210px;
	--uc-autohide-sidebar-delay: 600ms; /* Wait 0.6s before hiding sidebar */
	position: relative;
	min-width: var(--uc-sidebar-width) !important;
	width: var(--uc-sidebar-width) !important;
	max-width: var(--uc-sidebar-width) !important;
	z-index: 1;
}

#sidebar-box[positionend] {
	direction: rtl;
}
#sidebar-box[positionend] > * {
	direction: ltr;
}

#sidebar-box[positionend]:-moz-locale-dir(rtl) {
	direction: ltr;
}
#sidebar-box[positionend]:-moz-locale-dir(rtl) > * {
	direction: rtl;
}

#main-window[sizemode="fullscreen"] #sidebar-box {
	--uc-sidebar-width: 1px;
}

#sidebar-splitter {
	display: none;
}

#sidebar-header {
	overflow: hidden;
	color: var(--chrome-color, inherit) !important;
}

#sidebar {
	transition: min-width 115ms linear var(--uc-autohide-sidebar-delay) !important;
	min-width: var(--uc-sidebar-width) !important;
	will-change: min-width;
}

#sidebar-box:hover > #sidebar {
	min-width: var(--uc-sidebar-hover-width) !important;
	transition-delay: 0ms !important;
}

.sidebar-panel {
	background-color: transparent !important;
	color: var(--newtab-text-primary-color) !important;
}

.sidebar-panel #search-box {
	-moz-appearance: none !important;
	background-color: rgba(249, 249, 250, 0.1) !important;
	color: inherit !important;
}

/* Add sidebar divider and give it background */

#sidebar,
#sidebar-header {
	background-color: inherit !important;
	border-inline: 1px solid rgb(80, 80, 80);
	border-inline-width: 0px 1px;
}

#sidebar-box:not([positionend]) > :-moz-locale-dir(rtl),
#sidebar-box[positionend] > * {
	border-inline-width: 1px 0px;
}

/* Move statuspanel to the other side when sidebar is hovered so it doesn't get covered by sidebar */

#sidebar-box:not([positionend]):hover ~ #appcontent #statuspanel {
	inset-inline: auto 0px !important;
}
#sidebar-box:not([positionend]):hover ~ #appcontent #statuspanel-label {
	margin-inline: 0px !important;
	border-left-style: solid !important;
}

''
