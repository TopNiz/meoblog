"
A demo for a rotating planet around the center.
MeoPlanets new openInWindow

For the Responsibility part: 
I'm a planet rotating around the center (earth).

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	frame:		<Object>
	planet:		<Object>
	surface:		<Object>


    Implementation Points
"
Class {
	#name : #MeoPlanets,
	#superclass : #Morph,
	#instVars : [
		'surface',
		'planet',
		'frame'
	],
	#category : #'MeoHTML-LightsOut'
}

{ #category : #defaults }
MeoPlanets >> defaultExtent [
	^ 800@800
]

{ #category : #drawing }
MeoPlanets >> drawOn: aCanvas [

	self render.
	surface displayOnMorphicCanvas: aCanvas at: bounds origin. 

]

{ #category : #drawing }
MeoPlanets >> drawPlanets: canvas [

	canvas pathTransform restoreAfter: [
		
		canvas pathTransform translateX: 0 + ((frame * 0.5) cos) Y: 	1 + ((frame * 0.5) sin);
			scaleBy: 0.5 .
		
		canvas 
			setPaint: Color black;
			setShape: self planet;
			draw.
	]
]

{ #category : #initialization }
MeoPlanets >> initialize [ 
	"initialize board"

	super initialize.
	self extent: self defaultExtent.
	
	surface := AthensCairoSurface extent: self extent.
	
	planet := surface createPath: [:builder |
		builder
			absolute;
			moveTo: -1 @ 0 ; 
			ccwArcTo: 0@ 1 angle: 90 degreesToRadians ;
			ccwArcTo: 1@0 angle: 90 degreesToRadians ;
			ccwArcTo: 0@ -1 angle: 90 degreesToRadians ;
			ccwArcTo: -1@0 angle:  90 degreesToRadians 
	].

	frame := 1.
	self startStepping.
]

{ #category : #accessing }
MeoPlanets >> planet [
	^ planet
]

{ #category : #rendering }
MeoPlanets >> render [ 

	surface drawDuring: [:canvas | 
		canvas pathTransform loadIdentity.
		surface clear. 
		
"		canvas 
			setPaint: Color white;
			drawShape: (0@0 corner: self extent ).
"
		canvas pathTransform
			translateX: self extent x * 0.5  Y:  self extent y * 0.5;
			scaleBy: 40. 
			
		canvas pathTransform  rotateByDegrees:  (frame * 0.5 + ((frame *0.1 + 1.7) cos * 5)).
		self drawPlanets: canvas
	].

]

{ #category : #'stepping and presenter' }
MeoPlanets >> step [
	frame := Time millisecondClockValue / 100.
	
	self changed
]

{ #category : #'model - stepping' }
MeoPlanets >> stepTime [
	^ 0
]
