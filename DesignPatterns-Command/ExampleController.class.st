Class {
	#name : #ExampleController,
	#superclass : #Object,
	#category : #'DesignPatterns-Command'
}

{ #category : #'as yet unclassified' }
ExampleController >> makeExample [

	| ent a b x y |
	
	ent := GameObject new.
	a := ButtonA new.
	a controlledEntity: ent.
	b := ButtonB new.
	b controlledEntity: ent.
	x := ButtonX new.
	x controlledEntity: ent.
	y := ButtonY new.
	y controlledEntity: ent.
	
	a doAction.
	b doAction.
	x doAction.
	y doAction.
		
]
