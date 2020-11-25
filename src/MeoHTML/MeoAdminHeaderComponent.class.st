"
Meoblog admin header component 
"
Class {
	#name : #MeoAdminHeaderComponent,
	#superclass : #MeoHeaderComponent,
	#category : #'MeoHTML-Components'
}

{ #category : #rendering }
MeoAdminHeaderComponent >> renderButtonsOn: html [
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
MeoAdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
		tbsPullRight;
		callback: [ component gotoPostsListView ];
		with: [
			html text: 'Disconnect '.
			html tbsGlyphIcon iconLogout ]
]
