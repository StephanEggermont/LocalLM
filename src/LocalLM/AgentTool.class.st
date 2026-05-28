Class {
	#name : 'AgentTool',
	#superclass : 'Object',
	#category : 'LocalLM-Model',
	#package : 'LocalLM',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
AgentTool >> execute: input [
	^self subclassResponsibility
]

{ #category : 'as yet unclassified' }
AgentTool >> toolName [
	^self subclassResponsibility
]
