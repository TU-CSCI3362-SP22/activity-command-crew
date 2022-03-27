Class {
	#name : #Button,
	#superclass : #Object,
	#instVars : [
		'controlledEntity'
	],
	#category : #'DesignPatterns-Command'
}

{ #category : #constructor }
Button class >> controlling: entity [	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| button |
	button := self new.
	button controlledEntity: entity.
	^button.
]

{ #category : #accessing }
Button >> controlledEntity [
	^ controlledEntity
]

{ #category : #accessing }
Button >> controlledEntity: anObject [
	controlledEntity := anObject
]

{ #category : #action }
Button >> doAction [

	self subclassResponsibility.
]

{ #category : #action }
Button >> isNamed: literal [

	self subclassResponsibility.
]
