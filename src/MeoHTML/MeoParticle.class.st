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
		'speed',
		'isBouncing'
	],
	#category : #'MeoHTML-LightsOut'
}

{ #category : #'instance creation' }
MeoParticle class >> newAt: aPoint [ 
	^ self new 
		center: aPoint;
		yourself
]

{ #category : #private }
MeoParticle >> bounceIn [
	| newPosition |
	newPosition := self center + self velocity.
	(self isNearLeft: newPosition)
		ifTrue: [ 
			self center: (2 * owner bounds left + 20 - newPosition x @ self center y).
			self heading: 180 - self heading ].
	(self isNearRight: newPosition)
		ifTrue: [ 
			self center: (2 * owner bounds right - 20 - newPosition x @ self center y).
			self heading: 180 - self heading ].
	(self isNearTop: newPosition)
		ifTrue: [ 
			self center: (self center x @ (2 * owner bounds top + 20 - newPosition y)).
			self heading: 0 - self heading ].
	(self isNearBottom: newPosition)
		ifTrue: [ 
			self center: (self center x @ (2 * owner bounds bottom - 20 - newPosition y)).
			self heading: 0 - self heading ].

	self changed
]

{ #category : #private }
MeoParticle >> changeColor [
	| r |
	r := self color red + (1 / 255).
	r := r min: 1.
	self color: (Color r: r g: 0 b: 0)
]

{ #category : #private }
MeoParticle >> collide [
	(self nearestIn: owner particles) do: [ :each |
			self changeColor.
			self collideWith: each ]
]

{ #category : #private }
MeoParticle >> collideWith: aParticle [
	| oldHeading |
	
	oldHeading := self heading.
	self heading: aParticle heading.
	aParticle heading: oldHeading
]

{ #category : #private }
MeoParticle >> forward [
	self center: self center + self velocity .
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
	| rg |
	super initialize.
	rg := Random new.
	heading := (0 to: 359) atRandom.
	speed := 10 * rg next.
	
	self color: Color black.
	self borderColor: Color transparent.
	self extent: 20@20.
]

{ #category : #private }
MeoParticle >> isNearBottom: aPosition [
	^ (owner bounds bottom - aPosition y) < 10
]

{ #category : #private }
MeoParticle >> isNearLeft: aPosition [
	^ (aPosition x - owner bounds left) < 10
]

{ #category : #private }
MeoParticle >> isNearRight: aPosition [
	^ (owner bounds right - aPosition x) < 10
]

{ #category : #private }
MeoParticle >> isNearTop: aPosition [
	^ (aPosition y - owner bounds top) < 10
]

{ #category : #private }
MeoParticle >> nearestIn: someParticles [
	^ someParticles select: [ :each |
		"| d |
		d := (self center + self velocity) dist: each center.
		d < 20 and: [ d > 0 ]"
		self center to: self center + self velocity intersects: each center to: each velocity ]
]

{ #category : #accessing }
MeoParticle >> speed [
	^ speed
]

{ #category : #accessing }
MeoParticle >> speed: anObject [
	speed := anObject
]

{ #category : #'stepping and presenter' }
MeoParticle >> step [
	self bounceIn.
	self forward.
	self collide.
]

{ #category : #'stepping and presenter' }
MeoParticle >> stepTime [ 
	^ 0
]

{ #category : #accessing }
MeoParticle >> velocity [ 
	^ Point r: self speed degrees: self heading
]
