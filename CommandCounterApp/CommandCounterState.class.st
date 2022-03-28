Class {
	#name : #CommandCounterState,
	#superclass : #Object,
	#instVars : [
		'counter',
		'incrementButton',
		'decrementButton',
		'incBy5Button',
		'decBy5Button'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #CommandCounterApp
}

{ #category : #accessing }
CommandCounterState class >> current [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	^ uniqueInstance ifNil: [  uniqueInstance := self new ].
]

{ #category : #'class initialization' }
CommandCounterState class >> initialize [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	self reset. 
]

{ #category : #initialization }
CommandCounterState class >> reset [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	uniqueInstance := nil.
]

{ #category : #'as yet unclassified' }
CommandCounterState >> changeCounter: aNumber [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	counter := counter + aNumber.
]

{ #category : #accessing }
CommandCounterState >> counter [
	^ counter
]

{ #category : #accessing }
CommandCounterState >> counter: anObject [
	counter := anObject
]

{ #category : #accessing }
CommandCounterState >> decBy5Button [
	^ decBy5Button
]

{ #category : #accessing }
CommandCounterState >> decBy5Button: anObject [
	decBy5Button := anObject
]

{ #category : #accessing }
CommandCounterState >> decrementButton [
	^ decrementButton
]

{ #category : #accessing }
CommandCounterState >> decrementButton: anObject [
	decrementButton := anObject
]

{ #category : #accessing }
CommandCounterState >> incBy5Button [
	^ incBy5Button
]

{ #category : #accessing }
CommandCounterState >> incBy5Button: anObject [
	incBy5Button := anObject
]

{ #category : #accessing }
CommandCounterState >> incrementButton [
	^ incrementButton
]

{ #category : #accessing }
CommandCounterState >> incrementButton: anObject [
	incrementButton := anObject
]

{ #category : #initialization }
CommandCounterState >> initialize [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	self counter: 0.
]
