"
MeoBlog test suite
"
Class {
	#name : #MeoBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'first',
		'post',
		'previousRepository'
	],
	#category : #'MeoHTML-Tests'
}

{ #category : #running }
MeoBlogTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.
	
	blog := MeoBlog current. 
	blog removeAllPosts.
	
	first := MeoPost title: 'aTitle' text: 'aText' category: 'First category'.
	blog writeBlogPost: first.
	
	post := (MeoPost title: 'another Title' text: 'another  Text' category: 'Second category') unhide.
	
	
]

{ #category : #running }
MeoBlogTest >> tearDown [ 
	VORepository setRepository: previousRepository.
	super tearDown
]

{ #category : #running }
MeoBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
]

{ #category : #tests }
MeoBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
MeoBlogTest >> testAllBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allBlogPostsFromCategory: 'Second category') size equals: 1
]

{ #category : #tests }
MeoBlogTest >> testAllCategories [
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
MeoBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
MeoBlogTest >> testAllVisibleBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allVisibleBlogPostsFromCategory: 'First category') size equals: 0.
	self assert: (blog allVisibleBlogPostsFromCategory: 'Second category') size equals: 1
]

{ #category : #tests }
MeoBlogTest >> testBlogSize [
	self assert: blog size equals: 1
]

{ #category : #tests }
MeoBlogTest >> testRemoveAllBlogPosts [
	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
MeoBlogTest >> testUnclassifiedBlogPosts [
	blog writeBlogPost: post.
	self assert: (blog allBlogPosts select: [ :p | p isUnclassified ]) size equals: 0.
]
