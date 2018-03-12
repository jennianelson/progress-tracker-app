# Specifications for the Rails Assessment

## Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

    ### Relationships

    #### User 
        * has_many :student_subjects
        * has_many :subjects, through: :student_subjects
        * has_many :student_standards
        * has_many :standards, through: :student_standards

    #### Subject
        * has_many :sections
        * has_many :standards
        * has_many :student_subjects
        * has_many :users, through: :student_subjects

    #### Section
        * belongs_to :subject
        * has_many :standards

    #### Standard
        * belongs_to :section
        * belongs_to :subject
        * has_many :student_standards
        * has_many :users, through: :student_standards

    #### StudentStandard
        * belongs_to :standard
        * belongs_to :user
        * belongs_to :student_subject
    
    #### StudentSubject
        * belongs_to :user 
        * belongs_to :subject
        * has_many :student_standards
    

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    ### Validations

    #### User
    (validations managed through Devise)
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

    #### Subject
        * validates presence of title
        * validates presence and uniqueness of set_id

    #### Section
        * validates presence of title
    
    #### Standard
        * validates presence of description and dot_notation

    #### StudentStandard
        * none
    
    #### StudentSubject
        * validates_uniqueness_of :subject_id, :scope => :user_id

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    * StudentStandard.user_and_section(current_user, @section) URL: /sections/:id
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate