"
MeoBouncing class is a simulation board of bouncing particles

To test: execute the following

MeoBouncing new openInWorld.
"
Class {
	#name : #MeoBouncing,
	#superclass : #BorderedMorph,
	#instVars : [
		'particles',
		'damageReported'
	],
	#category : #'MeoHTML-LightsOut'
}

{ #category : #'menu actions' }
MeoBouncing >> changeColor [
	| r |
	r := self color red + (1 / 255).
	r := r min: 1.
	self color: (Color r: r g: self color green b: self color blue)
]

{ #category : #drawing }
MeoBouncing >> drawOn: aCanvas [
	"Clear the damageReported flag when redrawn."

	super drawOn: aCanvas.
	damageReported := false
]

{ #category : #initialization }
MeoBouncing >> initialize [ 
	| rg particle |
	
	super initialize.
	damageReported := false.
	self bounds: (50@50 extent: 350@350).
	color := Color paleYellow.
	
	particles := OrderedCollection new.
	
	1 to: 30 do: [ :n |
		rg := Random new.
		particle := MeoParticle newAt: 
			(self extent - (20 @ 20)) * ((rg next)@(rg next))
			+ self topLeft
			+ (10 @ 10).
		
		particles add: particle.
		self addMorph: particle ].
	
	self stopStepping.
]

{ #category : #stepping }
MeoBouncing >> invalidRect: damageRect from: aMorph [
	"Try setting 'quickRedraw' to true. This invalidates the entire morph, whose bounds typically subsume all it's submorphs. (However, this code checks that assumption and passes through any damage reports for out-of-bounds submorphs. Note that atoms with super-high velocities do occaisionally shoot through the walls!) An additional optimization is to only submit only damage report per display cycle by using the damageReported flag, which is reset to false when the morph is drawn."

	| quickRedraw |
	quickRedraw := true.  "false gives the original invalidRect: behavior"
	(quickRedraw and:
	 [(bounds origin <= damageRect topLeft) and:
	 [damageRect bottomRight <= bounds corner]]) ifTrue: [
		"can use quick redraw if damage is within my bounds"
		damageReported ifFalse: [super invalidRect: bounds from: self].  "just report once"
		damageReported := true.
	] ifFalse: [super invalidRect: damageRect from: aMorph].  "ordinary damage report"
]

{ #category : #accessing }
MeoBouncing >> particles [
	^ particles
]

{ #category : #accessing }
MeoBouncing >> particles: anObject [
	particles := anObject
]
