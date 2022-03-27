Class {
	#name : #ButtonX,
	#superclass : #Button,
	#category : #'DesignPatterns-Command'
}

{ #category : #action }
ButtonX >> doAction [ 

	Transcript show: 'attack'.
	Transcript cr.
]

{ #category : #action }
ButtonX >> isNamed: literal [

	^ literal = $X
]
