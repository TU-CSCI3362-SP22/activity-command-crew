Class {
	#name : #ExampleController,
	#superclass : #Object,
	#category : #'DesignPatterns-Command'
}

{ #category : #example }
ExampleController >> makeExample [

	| ent a b x y |
	
	ent := GameObject new.
	ent pushA.
	ent pushB.
	ent pushX.
	ent pushY.
]
