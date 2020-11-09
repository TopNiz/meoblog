"
Meo-Adapted version of a Tiny blog
"
Class {
	#name : #MeoBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#category : #'MeoHTML-Blog'
}

{ #category : #demos }
MeoBlog class >> createDemoPosts [
"MeoBlog createDemoPosts"
	self current
	writeBlogPost: ((MeoPost title: 'Welcome in TinyBlog' text: 'TinyBlog is a small blog engine made with Pharo.' category: 'TinyBlog') visible: true);
	writeBlogPost: ((MeoPost title: 'Report Pharo Sprint' text: 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done' category: 'Pharo') visible: true);
	writeBlogPost: ((MeoPost title: 'Brick on top of Bloc - Preview' text: 'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG. Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.' category: 'Pharo') visible: true);
	writeBlogPost: ((MeoPost title: 'The sad story of unclassified blog posts' text: 'So sad that I can read this.') visible: true); writeBlogPost: ((MeoPost title: 'Working with Pharo on the Raspberry Pi' text: 'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #initialization }
MeoBlog class >> current [
	"Answer the instance of the blog"
	^ self selectAll 
		ifNotEmpty: [ :b | b anyOne ]
		ifEmpty: [ self new save ]
]

{ #category : #initialization }
MeoBlog class >> initialize [ 
	self reset 
]

{ #category : #initialization }
MeoBlog class >> initializeVoyageOnMemoryDB [
	VOMemoryRepository new enableSingleton
]

{ #category : #testing }
MeoBlog class >> isVoyageRoot [
"Indicates that instances of this class are top level documents
in noSQL databases"
	^ true
]

{ #category : #initialization }
MeoBlog class >> reset [
	self initializeVoyageOnMemoryDB 
]

{ #category : #accessing }
MeoBlog >> allBlogPosts [
	^ posts
]

{ #category : #accessing }
MeoBlog >> allBlogPostsFromCategory: aString [ 
	^ self allBlogPosts select: [ :p | p category = aString ]
]

{ #category : #accessing }
MeoBlog >> allCategories [
	^ (posts collect: [ :p | p category ]) asSet 
]

{ #category : #accessing }
MeoBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #accessing }
MeoBlog >> allVisibleBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | (p category = aCategory) and: [ p isVisible ] ]
]

{ #category : #initialization }
MeoBlog >> initialize [ 
	super initialize.
	posts := OrderedCollection new
]

{ #category : #actions }
MeoBlog >> removeAllPosts [
"Remove all posts from database"
	posts do: [ :p | p remove ].
	posts := OrderedCollection new.
	self save
]

{ #category : #accessing }
MeoBlog >> size [
	^posts size
]

{ #category : #actions }
MeoBlog >> writeBlogPost: aMeoPost [
"Write the blog post in database" 
	posts add: aMeoPost.
	aMeoPost save.
	self save
]
