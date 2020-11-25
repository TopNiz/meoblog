"
MeoBouncing class is a simulation board of bouncing particles
"
Class {
	#name : #MeoBouncing,
	#superclass : #BorderedMorph,
	#instVars : [
		'particles',
		'frame'
	],
	#category : #'MeoHTML-LightsOut'
}

{ #category : #drawing }
MeoBouncing >> drawOn: aCanvas [

	self render.
]

{ #category : #initialization }
MeoBouncing >> initialize [ 
	| rg |
	
	super initialize.
	self bounds: (50@50 extent: 100@100).
	color := Color paleYellow.
	
	1 to: 10 do: [ :n |
		rg := Random new.
		self addMorph: (MeoParticle newAt: self extent * ((rg next)@(rg next)) + self topLeft) ].
	
	frame := 1.
	self startStepping.
]

{ #category : #rendering }
MeoBouncing >> render [ 
	self allMorphs do: [ :each | each moveForward: each speed headingTo: each heading ]
]

{ #category : #stepping }
MeoBouncing >> step [
	frame := Time millisecondClockValue / 100.
	
	self changed
]

{ #category : #stepping }
MeoBouncing >> stepTime [
	^ 0
]
