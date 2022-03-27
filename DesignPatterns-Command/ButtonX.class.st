Class {
	#name : #ButtonX,
	#superclass : #Button,
	#category : #'DesignPatterns-Command'
}

{ #category : #'as yet unclassified' }
ButtonX >> doAction [ 

	Transcript show: 'attack'.
	Transcript cr.
]

{ #category : #action }
ButtonX >> isNamed: literal [

	^ literal = $X
]
