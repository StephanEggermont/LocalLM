Class {
	#name : 'LocalClient',
	#superclass : 'Object',
	#instVars : [
		'client',
		'baseUrl',
		'model',
		'thinking'
	],
	#category : 'LocalLM-Model',
	#package : 'LocalLM',
	#tag : 'Model'
}

{ #category : 'accessing' }
LocalClient >> baseUrl [
	^ baseUrl
]

{ #category : 'accessing' }
LocalClient >> baseUrl: anObject [
	baseUrl := anObject
]

{ #category : 'as yet unclassified' }
LocalClient >> chat: messages [
	|payload response|
	payload := Dictionary new
		at: #model put: self model;
		at: #stream put: false;
		at: #think put: thinking;
		at: #messages put: messages;
		yourself.
		
	response := client 
		timeout: 180;
		url: baseUrl, '/api/chat';
		entity: ((ZnEntity text:
			(STONJSON toString: payload))
			contentType: ZnMimeType applicationJson;
		contentType: ZnMimeType applicationJson);
		post;
		response.
	^STONJSON fromString: response entity string
]

{ #category : 'as yet unclassified' }
LocalClient >> initialize [
	client := ZnClient new.
	baseUrl := 'http://localhost:11434'.
	model := 'qwen3.6:35b'.
	thinking := false
]

{ #category : 'accessing' }
LocalClient >> model [
	^ model
]

{ #category : 'accessing' }
LocalClient >> model: anObject [
	model := anObject
]

{ #category : 'accessing' }
LocalClient >> thinking [
	^ thinking
]

{ #category : 'accessing' }
LocalClient >> thinking: anObject [
	thinking := anObject
]
