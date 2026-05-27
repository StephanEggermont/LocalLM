Class {
	#name : 'BaselineOfLocalLM',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfLocalLM',
	#package : 'BaselineOfLocalLM'
}

{ #category : 'loading' }
BaselineOfLocalLM class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'LocalLM' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : 'baseline' }
BaselineOfLocalLM >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'LocalLM'
		]
]
