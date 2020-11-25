"
Header component for our Meoblog app
"
Class {
	#name : #MeoHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'MeoHTML-Components'
}

{ #category : #'instance creation' }
MeoHeaderComponent class >> from: aComponent [ 
	^ self new 
		component: aComponent;
		yourself 
]

{ #category : #accessing }
MeoHeaderComponent >> blog [
	^ MeoBlog current
]

{ #category : #accessing }
MeoHeaderComponent >> component [ 
	^ component
]

{ #category : #accessing }
MeoHeaderComponent >> component: aComponent [
	component := aComponent 
]

{ #category : #rendering }
MeoHeaderComponent >> renderButtonsOn: html [ 
	self renderSimpleAdminButtonOn: html
]

{ #category : #rendering }
MeoHeaderComponent >> renderContentOn: html [
	html tbsNavbar
		beDefault;
		with: [ html
				tbsContainer: [ self renderNavbarBrandOn: html.
					self renderButtonsOn: html ] ].
	html tbsContainer: self blog allBlogPosts size greaseString , ' posts'
]

{ #category : #rendering }
MeoHeaderComponent >> renderNavbarBrandOn: html [
	html tbsNavbarBrand
		url: self application url;
		with: 'MeoBlog'
]

{ #category : #rendering }
MeoHeaderComponent >> renderSimpleAdminButtonOn: html [
	html
		form: [ html tbsNavbarButton
				tbsPullRight;
				callback: [ component gotoAdministrationView ];
				with: [ html tbsGlyphIcon iconListAlt.
					html text: ' Admin View' ] ]
]
