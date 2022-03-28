Class {
	#name : #CommandCounterAppRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main',
		'button'
	],
	#category : #CommandCounterApp
}

{ #category : #testing }
CommandCounterAppRootComponent class >> canBeRoot [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	^ true.
]

{ #category : #'class initialization' }
CommandCounterAppRootComponent class >> initialize [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	|app|
	app := WAAdmin register: self asApplicationAt: 'CommandCounter' .
	app 
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
]

{ #category : #accessing }
CommandCounterAppRootComponent >> button [

	^ button
]

{ #category : #accessing }
CommandCounterAppRootComponent >> button: anObject [
	button := anObject
]

{ #category : #hooks }
CommandCounterAppRootComponent >> children [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	^ {  }.
]

{ #category : #initialization }
CommandCounterAppRootComponent >> initialize [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	super initialize.
	main := CounterDisplayComponent new.
	button := CommandButtonComponent new.
]

{ #category : #accessing }
CommandCounterAppRootComponent >> main [
	^ main
]

{ #category : #accessing }
CommandCounterAppRootComponent >> main: anObject [
	main := anObject
]

{ #category : #rendering }
CommandCounterAppRootComponent >> renderContentOn: html [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	html render: main.
	html render: button.
]

{ #category : #initialization }
CommandCounterAppRootComponent >> setCommand: aCommand [ 

	self button command: aCommand
]

{ #category : #updating }
CommandCounterAppRootComponent >> updateRoot: anHtmlRoot [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Command Counter App'.
]
