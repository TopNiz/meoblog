"
Meo tiny blog tests
"
Class {
	#name : #MeoPostTest,
	#superclass : #TestCase,
	#category : #'MeoHTML-Tests'
}

{ #category : #tests }
MeoPostTest >> testIsClassified [
"By default a post is unclassified"

	| p |
	p := MeoPost new.
	p category: 'category 1'.
	self deny: p isUnclassified.
]

{ #category : #tests }
MeoPostTest >> testIsHidden [
"By default, the post is hidden"

	| p |
	p := MeoPost new.
	p unhide; hide.
	self deny: p isVisible.
]

{ #category : #tests }
MeoPostTest >> testIsInitializedHidden [
"By default, the post is hidden"

	| p |
	p := MeoPost new.
	self deny: p isVisible.
]

{ #category : #tests }
MeoPostTest >> testIsInitializedUnclassified [
"By default a post is unclassified"

	| p |
	p := MeoPost new.
	self assert: p isUnclassified.
]

{ #category : #tests }
MeoPostTest >> testIsUnclassified [
"By default a post is unclassified"

	| p |
	p := MeoPost new.
	p category: MeoPost unclassifiedTag.
	self assert: p isUnclassified.
]

{ #category : #tests }
MeoPostTest >> testIsVisible [
"By default, the post is hidden"

	| p |
	p := MeoPost new.
	p unhide.
	self assert: p isVisible.
]

{ #category : #tests }
MeoPostTest >> testIsWellInitializedWithCategory [
"By default, the post is hidden"

	| p |
	p := MeoPost
		title: 'Hello'
		text: 'Is it me you''re looking for ?'
		category: 'Meo Blog'.
	self assert: p visible equals: false.
	self assert: p title equals: 'Hello'.
	self assert: p text equals: 'Is it me you''re looking for ?'.
	self deny: p isUnclassified.
]

{ #category : #tests }
MeoPostTest >> testIsWellInitializedWithoutCategory [
"By default, the post is hidden"

	| p |
	p := MeoPost
		title: 'Hello'
		text: 'Is it me you''re looking for ?'.
	self assert: p visible equals: false.
	self assert: p title equals: 'Hello'.
	self assert: p text equals: 'Is it me you''re looking for ?'.
	self assert: p isUnclassified.
]
