"
Meoblog post component 
"
Class {
	#name : #MeoPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post',
		'postsList'
	],
	#category : #'MeoHTML-Components'
}

{ #category : #'instance creation' }
MeoPostComponent class >> new: aPost [
	^ self new
		post: aPost;
		yourself
]

{ #category : #'instance creation' }
MeoPostComponent class >> new: aPost within: aPostsList [
	^ self new
		post: aPost;
		postsList: aPostsList;
		yourself
]

{ #category : #accessing }
MeoPostComponent >> post [
	^ post
]

{ #category : #accessing }
MeoPostComponent >> post: aPost [
	post := aPost
]

{ #category : #accessing }
MeoPostComponent >> postsList [ 
	^ postsList
]

{ #category : #accessing }
MeoPostComponent >> postsList: aPostsList [ 
	postsList := aPostsList
]

{ #category : #rendering }
MeoPostComponent >> renderContentOn: html [
	self renderPostTitleOn: html.
	self renderPostMetaOn: html.
	self renderPostTextOn: html
]

{ #category : #rendering }
MeoPostComponent >> renderPostCategoryOn: html [
	html span
		style: 'font-weight: bold;';
		with: 'Category: '.
	^ html anchor
		callback: [ self postsList currentCategory: self post category ];
		with: self post category
]

{ #category : #rendering }
MeoPostComponent >> renderPostDateOn: html [
	html span
		style: 'font-weight: bold;';
		with: 'Date: '.
	html span: self post date asDate
]

{ #category : #rendering }
MeoPostComponent >> renderPostMetaOn: html [
	html heading
		level6;
		style: 'font-style: italic;';
		with: [ self renderPostDateOn: html.
			html space.
			self renderPostCategoryOn: html ]
]

{ #category : #rendering }
MeoPostComponent >> renderPostTextOn: html [
	html div: self post text
]

{ #category : #rendering }
MeoPostComponent >> renderPostTitleOn: html [
	html heading
		level1;
		with: self post title
]
