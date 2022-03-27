Class {
	#name : #ButtonA,
	#superclass : #Button,
	#instVars : [
		'jumped'
	],
	#category : #'DesignPatterns-Command'
}

{ #category : #action }
ButtonA >> doAction [ 
	jumped ifTrue: [ Transcript show: 'Double '].
	jumped := jumped not.
	Transcript show: 'Jump'.
	Transcript cr.
]

{ #category : #initialization }
ButtonA >> initialize [
	super initialize.
	jumped := false.
]

{ #category : #action }
ButtonA >> isNamed: literal [

	^literal = $A.
]
