Class {
	#name : #GameObject,
	#superclass : #Object,
	#instVars : [
		'posX',
		'posY',
		'a',
		'b',
		'x',
		'y'
	],
	#category : #'DesignPatterns-Command'
}

{ #category : #initialization }
GameObject >> initialize [ 

	super initialize.
	posX := 0.
	posY := 0.
	a := ButtonA controlling: self.
	b := ButtonB controlling: self.
	x := ButtonX controlling: self.
	y := ButtonY controlling: self.
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
	a doAction.
]

{ #category : #action }
GameObject >> pushB [
	b doAction.
]

{ #category : #action }
GameObject >> pushX [
	x doAction.
]

{ #category : #action }
GameObject >> pushY [
	y doAction.
]
