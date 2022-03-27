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
GameObject >> pushA [
	(buttons detect: [ :each | each isKindOf: ButtonA ]) doAction.	
]

{ #category : #action }
GameObject >> pushB [
	(buttons detect: [ :each | each isKindOf: ButtonB ]) doAction.	
]

{ #category : #action }
GameObject >> pushX [
	(buttons detect: [ :each | each isKindOf: ButtonX ]) doAction.	
]

{ #category : #action }
GameObject >> pushY [
	(buttons detect: [ :each | each isKindOf: ButtonY ]) doAction.	
]
