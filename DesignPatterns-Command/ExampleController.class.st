Class {
	#name : #ExampleController,
	#superclass : #Object,
	#category : #'DesignPatterns-Command'
}

{ #category : #example }
ExampleController >> makeExample [

	| ent |
	
	ent := GameObject new.
	ent addButton: (ButtonA controlling: ent).
	ent addButton: (ButtonB controlling: ent).
   ent addButton: (ButtonX controlling: ent).
	ent addButton: (ButtonY controlling: ent).
		
	ent pushButton: $A.
	ent pushButton: $B.
	ent pushButton: $X.
	ent pushButton: $Y.
]
