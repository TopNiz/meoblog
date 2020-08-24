"
Root component for a seaside MeoBlog application 
"
Class {
	#name : #MeoAppRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'MeoHTML-Components'
}

{ #category : #testing }
MeoAppRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
MeoAppRootComponent class >> initialize [ 
	"self initialize"
	| app |
	app := WAAdmin register: self asApplicationAt: 'MeoBlog'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary
]

{ #category : #hooks }
MeoAppRootComponent >> children [
	^ Array with: main
]

{ #category : #accessing }
MeoAppRootComponent >> main [
	^ main ifNil: [ main := MeoPostsListComponent new ]
]

{ #category : #rendering }
MeoAppRootComponent >> renderContentOn: html [
	html render: self main
]

{ #category : #updating }
MeoAppRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'
]
