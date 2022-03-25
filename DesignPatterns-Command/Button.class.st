Class {
	#name : #Button,
	#superclass : #Object,
	#instVars : [
		'controlledEntity'
	],
	#category : #'DesignPatterns-Command'
}

{ #category : #accessing }
Button >> controlledEntity [
	^ controlledEntity
]

{ #category : #accessing }
Button >> controlledEntity: anObject [
	controlledEntity := anObject
]

{ #category : #'as yet unclassified' }
Button >> doAction [

	self subclassResponsibility.
]
