"
Screen component for our Meoblog app
"
Class {
	#name : #MeoScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'MeoHTML-Components'
}

{ #category : #accessing }
MeoScreenComponent >> blog [
"For the moment, return the only blog. In the future, it will return the blog of the connected user."
	^ MeoBlog current 
]

{ #category : #hooks }
MeoScreenComponent >> children [ 
	^ Array with: header
]

{ #category : #accessing }
MeoScreenComponent >> header [
	^ header ifNil: [ header := MeoHeaderComponent from: self ]
]

{ #category : #rendering }
MeoScreenComponent >> renderContentOn: html [
	html render: self header
]
