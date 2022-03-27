Class {
	#name : #ButtonY,
	#superclass : #Button,
	#category : #'DesignPatterns-Command'
}

{ #category : #'as yet unclassified' }
ButtonY >> doAction [ 

	Transcript show: 'pew pew'.
	Transcript cr.
]

{ #category : #action }
ButtonY >> isNamed: literal [

	^ literal = $Y
]
