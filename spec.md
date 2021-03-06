• Use the Ruby on Rails framework.

• Your models must:

[X] Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships
    User
    has_many :brews
    has_many :comments
    has_many :brew_comments, through: :brews, source: :comments
    
    Brew
    belongs_to :user 
    has_many :commnets
    has_many :users_commented, through: :comments, source: :user

    Comment
    belongs_to :user
    belongs_to :brew

    Eqipment 
    has_many :brews

[X] Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
    Attribute submitted by user-> comment content

[X] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
    Brew
        validates :name, :brand, :grind_size, :dose, :extraction_volume, :extraction_time, presence: true
    User
        validates :email, presence: true
        validates :username, presence: true, uniqueness: true
    Comment
        validates :content, presence: true

- You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

[X] Your application must provide standard user authentication, including signup, login, logout, and passwords.
    Application allows user to signup, login, logout. Application uses bcrypt to create a secure password. 

[X] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
    Application allows user to log in using Google. 

• You must include and make use of a nested resource with the appropriate RESTful URLs.

- You must include a nested new route with form that relates to the parent resource

- You must include a nested index or show route

Your forms should correctly display validation errors.

[X] Your fields should be enclosed within a fields_with_errors class

[X] Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

[X] Logic present in your controllers should be encapsulated as methods in your models.

[X] Your views should use helper methods and partials when appropriate.

[X] Follow patterns in the Rails Style Guide and the Ruby Style Guide.

[X] Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
    Used rails resource 