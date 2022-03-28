Class {
	#name : #CommandButtonComponent,
	#superclass : #WAComponent,
	#instVars : [
		'buttonName',
		'command'
	],
	#category : #CommandCounterApp
}

{ #category : #'instance creation' }
CommandButtonComponent class >> newButton: name [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| buttonComp |
	buttonComp := self new.
	buttonComp buttonName: name.
	^ buttonComp .
]

{ #category : #accessing }
CommandButtonComponent >> buttonName [
	^ buttonName
]

{ #category : #accessing }
CommandButtonComponent >> buttonName: anObject [
	buttonName := anObject
]

{ #category : #accessing }
CommandButtonComponent >> command [
	^ command
]

{ #category : #accessing }
CommandButtonComponent >> command: anObject [
	command := anObject
]

{ #category : #rendering }
CommandButtonComponent >> renderContentOn: html [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	html anchor 
		"callback: [ CommandCounterState current changeCounter: 1 ];"
		callback: [ self runAction ];
		with: 'Add 1'.
]

{ #category : #'as yet unclassified' }
CommandButtonComponent >> runAction [

	command ifNotNil: [ command doAction ]
]
