Class {
	#name : #Command,
	#superclass : #Object,
	#category : #CommandCounterApp
}

{ #category : #'as yet unclassified' }
Command class >> doAction [

	self subclassResponsibility.
]
