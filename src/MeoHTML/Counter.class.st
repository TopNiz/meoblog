"
Counter class
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MeoHTML
}

{ #category : #'instance creation' }
Counter class >> withValue: aNumber [

  ^ self new count: aNumber
]

{ #category : #accessing }
Counter >> count [
	^count
]

{ #category : #accessing }
Counter >> count: aNumber [
	count := aNumber 
]

{ #category : #operations }
Counter >> decrement [ 
	count := count - 1
]

{ #category : #operations }
Counter >> increment [ 
	count := count + 1
]

{ #category : #initialization }
Counter >> initialize [ 
	count := 0.
	^self
]

{ #category : #printing }
Counter >> printOn: aStream [

  super printOn: aStream.
  aStream nextPutAll: ' with value: ', self count printString.
  aStream cr
]
