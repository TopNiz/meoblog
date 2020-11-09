"
Test Counter class
"
Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#category : #'MeoHTML-Other'
}

{ #category : #tests }
CounterTest >> testAlternateInstanceCreation [

  self assert: ((Counter withValue: 7) increment; count) = 8
]

{ #category : #tests }
CounterTest >> testCounterIsSetAndRead [
  | c |
  c := Counter new.
  c count: 7.
  self assert: c count equals: 7
]

{ #category : #tests }
CounterTest >> testCounterIsSetAndReady [
	| c |
	c := Counter new.
	c count: 7.
	self assert: c count equals: 7
]

{ #category : #tests }
CounterTest >> testCounterIsSetToZero [

  self assert: Counter new count = 0
]

{ #category : #tests }
CounterTest >> testDecrement [

	| c |
	c := Counter new.
	c count: 7; decrement; decrement.
	self assert: c count equals: 5
]

{ #category : #tests }
CounterTest >> testIncrement [

	| c |
	c := Counter new.
	c count: 7; increment; increment.
	self assert: c count equals: 9
]
