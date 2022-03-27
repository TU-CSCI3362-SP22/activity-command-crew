Class {
	#name : #ButtonY,
	#superclass : #Button,
	#category : #'DesignPatterns-Command'
}

{ #category : #action }
ButtonY >> doAction [ 

	Transcript show: 'pew pew'.
	Transcript cr.
]

{ #category : #action }
ButtonY >> isNamed: literal [

	^ literal = $Y
]
