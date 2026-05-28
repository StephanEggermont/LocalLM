Class {
	#name : 'AgentMessage',
	#superclass : 'Object',
	#instVars : [
		'role',
		'content'
	],
	#category : 'LocalLM-Model',
	#package : 'LocalLM',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
AgentMessage class >> assistant: aString [
	^self new
		role: 'assistant';
		content: aString;
		yourself
]

{ #category : 'as yet unclassified' }
AgentMessage class >> system: aString [
	^self new
		role: 'system';
		content: aString;
		yourself
]

{ #category : 'as yet unclassified' }
AgentMessage class >> user: aString [
	^self new
		role: 'user';
		content: aString;
		yourself
]

{ #category : 'as yet unclassified' }
AgentMessage >> addContent: aString [
	content := content, aString
]

{ #category : 'as yet unclassified' }
AgentMessage >> asDictionary [
	^Dictionary new
		at: #role put: role;
		at: #content put: content;
		yourself
]

{ #category : 'accessing' }
AgentMessage >> content [
	^ content
]

{ #category : 'accessing' }
AgentMessage >> content: anObject [
	content := anObject
]

{ #category : 'accessing' }
AgentMessage >> role [
	^ role
]

{ #category : 'accessing' }
AgentMessage >> role: anObject [
	role := anObject
]
