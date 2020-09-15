1. Add categories and products_categories model for association
    - add category_ids to products_params
    - add checkbox options in products new form
    - add new category action in Category controller
    - make the field to create new category in products#new form only accessible to admin
    - add edit_product_path(@product) to show and index page (later to be protected by admin authorization)

2. Change products index page to have dynamic <h1> if it is for all products or products within a category.

