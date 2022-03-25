Class {
	#name : #GameObject,
	#superclass : #Object,
	#instVars : [
		'posX',
		'posY'
	],
	#category : #'DesignPatterns-Command'
}

{ #category : #initialization }
GameObject >> initialize [ 

	super initialize.
	posX := 0.
	posY := 0.
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
