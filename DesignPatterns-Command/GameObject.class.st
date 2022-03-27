Class {
	#name : #GameObject,
	#superclass : #Object,
	#instVars : [
		'posX',
		'posY',
		'buttons'
	],
	#category : #'DesignPatterns-Command'
}

{ #category : #adding }
GameObject >> addButton: aButton [
	buttons add: aButton.
]

{ #category : #initialization }
GameObject >> initialize [ 

	super initialize.
	posX := 0.
	posY := 0.
	buttons := OrderedCollection new.

]

{ #category : #accessing }
GameObject >> posX [
	^ posX
]

{ #category : #accessing }
GameObject >> posX: anObject [
	posX := anObject
]

{ #category : #accessing }
GameObject >> posY [
	^ posY
]

{ #category : #accessing }
GameObject >> posY: anObject [
	posY := anObject
]

{ #category : #action }
GameObject >> pushButton: literal [
	(buttons detect: [ :each | each isNamed: literal ]) doAction.	
]

{ #category : #'as yet unclassified' }
GameObject >> replaceButton: aLiteral with: aButton [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	buttons remove: (buttons detect: [ :each | each isNamed: aLiteral ]).
	self addButton: aButton.
]
