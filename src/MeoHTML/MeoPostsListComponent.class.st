"
Meo Posts list component
"
Class {
	#name : #MeoPostsListComponent,
	#superclass : #MeoScreenComponent,
	#instVars : [
		'postsList',
		'categories',
		'currentCategory'
	],
	#category : #'MeoHTML-Components'
}

{ #category : #'instance creation' }
MeoPostsListComponent class >> new: aCategory [
	^ self new
		currentCategory: aCategory;
		yourself 
]

{ #category : #accessing }
MeoPostsListComponent >> categories [
	^ categories ifNil: [ categories := MeoCategoriesComponent categories: self blog allCategories postsList: self ]
]

{ #category : #hooks }
MeoPostsListComponent >> children [ 
	^ Array with: postsList 
]

{ #category : #accessing }
MeoPostsListComponent >> currentCategory [
	^ currentCategory 
]

{ #category : #accessing }
MeoPostsListComponent >> currentCategory: aCategory [
	currentCategory := aCategory 
]

{ #category : #actions }
MeoPostsListComponent >> gotoAdministrationView [
	self call: MeoAdminComponent new
]

{ #category : #accessing }
MeoPostsListComponent >> postsList: aCollectionOfPosts [
	^ aCollectionOfPosts
		collect: [ :p | MeoPostComponent new: p within: self ]
]

{ #category : #accessing }
MeoPostsListComponent >> readSelectedPosts [
	^ self postsList: (self currentCategory
			ifNil: [ self blog allVisibleBlogPosts ]
			ifNotNil: [ :category | self blog allVisibleBlogPostsFromCategory: category ])
]

{ #category : #rendering }
MeoPostsListComponent >> renderCategoriesColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ self renderCategoriesOn: html ]
]

{ #category : #rendering }
MeoPostsListComponent >> renderCategoriesOn: html [
	^ html render: self categories
]

{ #category : #rendering }
MeoPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [ html tbsRow
		showGrid;
		with: [ self renderCategoriesColumnOn: html.
			self renderPostsColumnOn: html ] ]
]

{ #category : #rendering }
MeoPostsListComponent >> renderPostsColumnOn: html [
	^ html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ self renderPostsOn: html ]
]

{ #category : #rendering }
MeoPostsListComponent >> renderPostsOn: html [
	self readSelectedPosts do: [ :p | html render: p ]
]
