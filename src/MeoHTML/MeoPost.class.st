"
Meo-Adapted version of a post in a Tiny blog
"
Class {
	#name : #MeoPost,
	#superclass : #Object,
	#instVars : [
		'visible',
		'date',
		'title',
		'text',
		'category'
	],
	#category : #'MeoHTML-Blog'
}

{ #category : #testing }
MeoPost class >> isVoyageRoot [ 
"Indicates that instances of this class are top level documents in noSQL databases"
	^ true
]

{ #category : #'instance creation' }
MeoPost class >> title: aTitle text: aText [
	^self new
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #'instance creation' }
MeoPost class >> title: aTitle text: aText category: aCategory [
	^(self title: aTitle text: aText)
		category: aCategory;
		yourself 
]

{ #category : #constants }
MeoPost class >> unclassifiedTag [
	^'Unclassified'
]

{ #category : #accessing }
MeoPost >> category [
	^ category
]

{ #category : #accessing }
MeoPost >> category: aString [ 
	category := aString
]

{ #category : #accessing }
MeoPost >> date [
	^ date
]

{ #category : #actions }
MeoPost >> hide [ 
	self visible: false
]

{ #category : #initialization }
MeoPost >> initialize [ 
"It starts with a visible, unclassified and empty post, titled with 'Untitled' and dated with now.
Post date is private (read only). It is modified only by the instance itself."

	super initialize.
	self hide.
	self category: self class unclassifiedTag.
	title := 'Untitled'.
	text := ''.
	date := DateAndTime now.
	^self 
]

{ #category : #testing }
MeoPost >> isUnclassified [
	^self category = self class unclassifiedTag
]

{ #category : #testing }
MeoPost >> isVisible [
	^self visible
]

{ #category : #accessing }
MeoPost >> text [
	^ text
]

{ #category : #accessing }
MeoPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
MeoPost >> title [
	^ title
]

{ #category : #accessing }
MeoPost >> title: anObject [
	title := anObject
]

{ #category : #actions }
MeoPost >> unhide [
	self visible: true
]

{ #category : #accessing }
MeoPost >> visible [
	^visible 
]

{ #category : #accessing }
MeoPost >> visible: aBoolean [
	visible := aBoolean
]
