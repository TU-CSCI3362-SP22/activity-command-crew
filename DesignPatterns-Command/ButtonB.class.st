Class {
	#name : #ButtonB,
	#superclass : #Button,
	#category : #'DesignPatterns-Command'
}

{ #category : #action }
ButtonB >> doAction [ 

	Transcript show: 'duck'.
	Transcript cr.
]

{ #category : #action }
ButtonB >> isNamed: literal [

	^ literal = $B
]
