Class {
	#name : #CounterDisplayComponent,
	#superclass : #WAComponent,
	#instVars : [
		'counterState'
	],
	#category : #CommandCounterApp
}

{ #category : #initialization }
CounterDisplayComponent >> initialize [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	super initialize.
	counterState := CommandCounterState current.
]

{ #category : #rendering }
CounterDisplayComponent >> renderContentOn: html [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	html text: counterState counter
]
