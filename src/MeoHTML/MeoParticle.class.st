"
MeoParticle class for bouncing particles.
Heading: 
0: East.
90: North.
180: West.
270: South.

Default radius: 2
Deafault speed: 1 pixel/second
"
Class {
	#name : #MeoParticle,
	#superclass : #EllipseMorph,
	#instVars : [
		'heading',
		'speed'
	],
	#category : #'MeoHTML-LightsOut'
}

{ #category : #'instance creation' }
MeoParticle class >> newAt: aPoint [ 
	^ self new 
		center: aPoint;
		yourself
]

{ #category : #accessing }
MeoParticle >> heading [
	^ heading
]

{ #category : #accessing }
MeoParticle >> heading: anObject [
	heading := anObject
]

{ #category : #initialization }
MeoParticle >> initialize [
	super initialize.
	heading := 0.
	speed := 1.
	self center: 0@0.
	self color: Color black.
	self extent: 2@2.
]

{ #category : #initialization }
MeoParticle >> moveForward: aStep headingTo: aHeading [
	self center: aStep * (aHeading cos) @ (aHeading sin) + self center
]

{ #category : #accessing }
MeoParticle >> speed [
	^ speed
]

{ #category : #accessing }
MeoParticle >> speed: anObject [
	speed := anObject
]
