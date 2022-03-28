Class {
	#name : #Add1,
	#superclass : #Command,
	#category : #CommandCounterApp
}

{ #category : #'as yet unclassified' }
Add1 class >> doAction [

	CommandCounterState current changeCounter: 1.
]
