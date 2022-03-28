"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCommandCounterApp,
	#superclass : #PackageManifest,
	#category : #'CommandCounterApp-Manifest'
}

{ #category : #'code-critics' }
ManifestCommandCounterApp class >> ruleGRUsesCurlyBraceArraysRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#CommandCounterApp)) #'2022-03-16T13:52:04.053295-06:00') )
]
